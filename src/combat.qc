
void() T_MissileTouch;
void() info_player_start;
void(entity targ, entity attacker) ClientObituary;

void() monster_death_use;

//============================================================================

/*
============
CanDamage

Returns true if the inflictor can directly damage the target.  Used for
explosions and melee attacks.
============
*/
float(entity targ, entity inflictor) CanDamage =
{
// bmodels need special checking because their origin is 0,0,0
	if (targ.movetype == MOVETYPE_PUSH)
	{
		traceline(inflictor.origin, 0.5 * (targ.absmin + targ.absmax), TRUE, self);
		if (trace_fraction == 1)
			return TRUE;
		if (trace_ent == targ)
			return TRUE;
		return FALSE;
	}
	
	traceline(inflictor.origin, targ.origin, TRUE, self);
	if (trace_fraction == 1)
		return TRUE;
	traceline(inflictor.origin, targ.origin + '15 15 0', TRUE, self);
	if (trace_fraction == 1)
		return TRUE;
	traceline(inflictor.origin, targ.origin + '-15 -15 0', TRUE, self);
	if (trace_fraction == 1)
		return TRUE;
	traceline(inflictor.origin, targ.origin + '-15 15 0', TRUE, self);
	if (trace_fraction == 1)
		return TRUE;
	traceline(inflictor.origin, targ.origin + '15 -15 0', TRUE, self);
	if (trace_fraction == 1)
		return TRUE;

	return FALSE;
};


/*
============
Killed
============
*/
void(entity targ, entity attacker) Killed =
{
	local entity oself;

	oself = self;
	self = targ;
	
	float otherteam;
	entity t;
	
	if (self.health < -99)
		self.health = -99;		// don't let sbar look bad if a player dies with super low health

	if (self.movetype == MOVETYPE_PUSH || self.movetype == MOVETYPE_NONE)
	{	// doors, triggers, etc
		self.th_die ();
		self = oself;
		return;
	}

	self.enemy = attacker;

// bump the monster counter
	if (self.flags & FL_MONSTER)
	{
		killed_monsters = killed_monsters + 1;
		WriteByte (MSG_ALL, SVC_KILLEDMONSTER);
		
		//Monsters drop cash for the other team
		if (self.arena_team) {
			if (self.arena_team == 1) {
				otherteam = 2;
			} else {
				otherteam = 1;
			}
			
			while (1) {
				t = nextent(t);
				if (t.classname == "player") {
					if (t.arena_team == otherteam) {
						purchase(t, -1 * ceil(value_for_item(self.classname) * DROP_MULTIPLIER));
					}
				} else {
					break;
				}
			}
		}
	}

	ClientObituary(self, attacker);
	
	self.takedamage = DAMAGE_NO;
	self.touch = SUB_Null;

	monster_death_use();
	
	self.effects = 0;
	self.super_time = 0;
	self.invincible_time = 0;
	self.invincible_finished = 0;
	self.super_damage_finished = 0;
	
	self.th_die ();
	
	self = oself;
};


/*
============
T_Damage

The damage is coming from inflictor, but get mad at attacker
This should be the only function that ever reduces health.
============
*/
void(entity targ, entity inflictor, entity attacker, float damage) T_Damage =
{
	local	vector	dir;
	local	entity	oldself;
	local	float	save;
	local	float	take;
	
	//Damage is the damage that is being dealt.
	//Take is the amount of that damage that will actually be dealt to the health bar

	if (!targ.takedamage)
		return;

// used by buttons and triggers to set activator for target firing
	damage_attacker = attacker;

// check for quad damage powerup on the attacker
	if (attacker.super_damage_finished > time && inflictor.classname != "info_oldonehurt")
		damage = damage * 4;
		
	take = damage;

// save damage based on the target's armor level
	save = ceil(targ.armortype*take);
	if (save >= targ.armorvalue)
	{
		save = targ.armorvalue;
		targ.armortype = 0;	// lost all armor
		targ.items = targ.items - (targ.items & (IT_ARMOR1 | IT_ARMOR2 | IT_ARMOR3));
	}
	
	targ.armorvalue = targ.armorvalue - save;
	take = ceil(take-save);

// add to the damage total for clients, which will be sent as a single
// message at the end of the frame
// FIXME: remove after combining shotgun blasts?
	if (targ.flags & FL_CLIENT)
	{
		targ.dmg_take = targ.dmg_take + take;
		targ.dmg_save = targ.dmg_save + save;
		targ.dmg_inflictor = inflictor;
	}

// figure momentum add
	if ( (inflictor != world) && (targ.movetype == MOVETYPE_WALK) )
	{
		dir = targ.origin - (inflictor.absmin + inflictor.absmax) * 0.5;
		dir = normalize(dir);
		targ.velocity = targ.velocity + dir*damage*8;
	}

// check for godmode or invincibility
	if (targ.flags & FL_GODMODE || targ.outside)
		return;
	if (targ.invincible_finished > time && !(damage >= 666000 && damage < 666005))
	{
		if (self.invincible_sound < time)
		{
			sound (targ, CHAN_AUTO, "items/protect3.wav", 1, ATTN_NORM);
			self.invincible_sound = time + 2;
		}
		return;
	}

// team play damage avoidance
	if ( (teamplay == 1) && (targ.arena_team > 0) && (targ.arena_team == attacker.arena_team)
	&& (targ != attacker) 			
	&& (attacker.classname == "player")
	&& (inflictor.classname != "door") )	// because squishing a teammate is still possible
		return;
		
	//Monsters can't harm their own boss
	if (targ.classname == "monster_oldone" && targ.arena_team == attacker.arena_team)
		return;
		
// do the damage
	targ.health = targ.health - take;
			
	if (targ.health <= 0)
	{
		Killed (targ, attacker);
		return;
	}

// react to the damage
	oldself = self;
	self = targ;

	//Don't change targets if sturdy is active
	if ( (self.flags & FL_MONSTER) && attacker != world && !(self.sturdy_finished > time))
	{
	// get mad unless of the same class (except for soldiers)
		if (self != attacker && attacker != self.enemy)
		{	
			if (self.arena_team) {
				if (self.arena_team != attacker.arena_team  || (self.classname == "monster_army" && attacker.classname == "monster_army")) {
					if (self.enemy.classname == "player")
						self.oldenemy = self.enemy;
					
					self.enemy = attacker;
					FoundTarget ();
				}
			} else {
				//If this monster doesn't have a team, don't attack other monsters of the same type
				if ((self.classname != attacker.classname) || (self.classname == "monster_army"))
				{
					if (self.enemy.classname == "player")
						self.oldenemy = self.enemy;
					
					self.enemy = attacker;
					FoundTarget ();
				}
			}
		}
	}

	if (self.th_pain && !(self.sturdy_finished > time))
	{
		self.th_pain (attacker, take);
	// nightmare mode monsters don't go into pain frames often
		if (skill == 3 && !coppernightmare())
			self.pain_finished = time + 5;		
	}

	self = oldself;
};

/*
============
T_RadiusDamage
============
*/
void(entity inflictor, entity attacker, float damage, entity ignore) T_RadiusDamage =
{
	local	float 	points;
	local	entity	head;
	local	vector	org;

	head = findradius(inflictor.origin, damage+40);
	
	while (head)
	{
		if (head != ignore)
		{
			if (head.takedamage)
			{
				org = head.origin + (head.mins + head.maxs)*0.5;
				points = 0.5*vlen (inflictor.origin - org);
				if (points < 0)
					points = 0;
				points = damage - points;
				if (head == attacker)
					points = points * 0.5;
				if (points > 0)
				{
					if (CanDamage (head, inflictor))
					{	// shambler takes half damage from all explosions
						if (head.classname == "monster_shambler")						
							T_Damage (head, inflictor, attacker, points*0.5);
						else
							T_Damage (head, inflictor, attacker, points);
					}
				}
			}
		}
		head = head.chain;
	}
};

/*
============
T_BeamDamage
============
*/
void(entity attacker, float damage) T_BeamDamage =
{
	local	float 	points;
	local	entity	head;
	
	head = findradius(attacker.origin, damage+40);
	
	while (head)
	{
		if (head.takedamage)
		{
			points = 0.5*vlen (attacker.origin - head.origin);
			if (points < 0)
				points = 0;
			points = damage - points;
			if (head == attacker)
				points = points * 0.5;
			if (points > 0)
			{
				if (CanDamage (head, attacker))
				{
					if (head.classname == "monster_shambler")						
						T_Damage (head, attacker, attacker, points*0.5);
					else
						T_Damage (head, attacker, attacker, points);
				}
			}
		}
		head = head.chain;
	}
};

float() coppernightmare = 
{
	if (cvar("temp1") & SET_COPPERNIGHTMARE && skill == 3)
		return TRUE;
	else
		return FALSE;
}
