/*
==============================================================================

OLD ONE

==============================================================================
*/

void() finale_3;
void() finale_4;

entity	shub;

$frame old1 old2 old3 old4 old5 old6 old7 old8 old9 
$frame old10 old11 old12 old13 old14 old15 old16 old17 old18 old19 
$frame old20 old21 old22 old23 old24 old25 old26 old27 old28 old29 
$frame old30 old31 old32 old33 old34 old35 old36 old37 old38 old39 
$frame old40 old41 old42 old43 old44 old45 old46 

$frame shake1 shake2 shake3 shake4 shake5 shake6 shake7 shake8
$frame shake9 shake10 shake11 shake0 shake12 shake13 shake14
$frame shake15 shake16 shake17 shake18 shake19 shake20

void() old_idle1        =[      $old1,  old_idle2       ] {};
void() old_idle2        =[      $old2,  old_idle3       ] {};
void() old_idle3        =[      $old3,  old_idle4       ] {};
void() old_idle4        =[      $old4,  old_idle5       ] {};
void() old_idle5        =[      $old5,  old_idle6       ] {};
void() old_idle6        =[      $old6,  old_idle7       ] {};
void() old_idle7        =[      $old7,  old_idle8       ] {};
void() old_idle8        =[      $old8,  old_idle9       ] {};
void() old_idle9        =[      $old9,  old_idle10      ] {};
void() old_idle10       =[      $old10, old_idle11      ] {};
void() old_idle11       =[      $old11, old_idle12      ] {};
void() old_idle12       =[      $old12, old_idle13      ] {};
void() old_idle13       =[      $old13, old_idle14      ] {};
void() old_idle14       =[      $old14, old_idle15      ] {};
void() old_idle15       =[      $old15, old_idle16      ] {};
void() old_idle16       =[      $old16, old_idle17      ] {};
void() old_idle17       =[      $old17, old_idle18      ] {};
void() old_idle18       =[      $old18, old_idle19      ] {};
void() old_idle19       =[      $old19, old_idle20      ] {};
void() old_idle20       =[      $old20, old_idle21      ] {};
void() old_idle21       =[      $old21, old_idle22      ] {};
void() old_idle22       =[      $old22, old_idle23      ] {};
void() old_idle23       =[      $old23, old_idle24      ] {};
void() old_idle24       =[      $old24, old_idle25      ] {};
void() old_idle25       =[      $old25, old_idle26      ] {};
void() old_idle26       =[      $old26, old_idle27      ] {};
void() old_idle27       =[      $old27, old_idle28      ] {};
void() old_idle28       =[      $old28, old_idle29      ] {};
void() old_idle29       =[      $old29, old_idle30      ] {};
void() old_idle30       =[      $old30, old_idle31      ] {};
void() old_idle31       =[      $old31, old_idle32      ] {};
void() old_idle32       =[      $old32, old_idle33      ] {};
void() old_idle33       =[      $old33, old_idle34      ] {};
void() old_idle34       =[      $old34, old_idle35      ] {};
void() old_idle35       =[      $old35, old_idle36      ] {};
void() old_idle36       =[      $old36, old_idle37      ] {};
void() old_idle37       =[      $old37, old_idle38      ] {};
void() old_idle38       =[      $old38, old_idle39      ] {};
void() old_idle39       =[      $old39, old_idle40      ] {};
void() old_idle40       =[      $old40, old_idle41      ] {};
void() old_idle41       =[      $old41, old_idle42      ] {};
void() old_idle42       =[      $old42, old_idle43      ] {};
void() old_idle43       =[      $old43, old_idle44      ] {};
void() old_idle44       =[      $old44, old_idle45      ] {};
void() old_idle45       =[      $old45, old_idle46      ] {};
void() old_idle46       =[      $old46, old_idle1       ] {};

void() old_pain1        =[		$shake1,  old_pain2       ] {lightstyle(0, "m");};
void() old_pain2        =[      $shake2,  old_pain3       ] {lightstyle(0, "k");};
void() old_pain3        =[      $shake3,  old_pain4       ] {lightstyle(0, "g");};
void() old_pain4        =[      $shake4,  old_pain5       ] {lightstyle(0, "c");};
void() old_pain5        =[      $shake5,  old_pain6       ] {lightstyle(0, "a");};
void() old_pain6        =[      $shake6,  old_pain7       ] {lightstyle(0, "g");};
void() old_pain7        =[      $shake7,  old_pain8       ] {lightstyle(0, "k");};
void() old_pain8        =[      $shake8,  old_pain9       ] {lightstyle(0, "m");};
void() old_pain9        =[      $shake9,  old_pain10      ] {lightstyle(0, "k");};
void() old_pain10       =[      $shake10, old_pain11      ] {lightstyle(0, "g");};
void() old_pain11       =[      $shake11, old_pain12      ] {lightstyle(0, "c");};
void() old_pain12       =[      $shake12, old_pain13      ] {lightstyle(0, "a");};
void() old_pain13       =[      $shake13, old_pain14      ] {lightstyle(0, "g");};
void() old_pain14       =[      $shake14, old_pain15      ] {lightstyle(0, "k");};
void() old_pain15       =[      $shake2, old_idle1		  ] {lightstyle(0, "m");};

void() old_thrash1        =[	  $shake1,  old_thrash2       ] {lightstyle(0, "m");};
void() old_thrash2        =[      $shake2,  old_thrash3       ] {lightstyle(0, "k");};
void() old_thrash3        =[      $shake3,  old_thrash4       ] {lightstyle(0, "k");};
void() old_thrash4        =[      $shake4,  old_thrash5       ] {lightstyle(0, "i");};
void() old_thrash5        =[      $shake5,  old_thrash6       ] {lightstyle(0, "g");};
void() old_thrash6        =[      $shake6,  old_thrash7       ] {lightstyle(0, "e");};
void() old_thrash7        =[      $shake7,  old_thrash8       ] {lightstyle(0, "c");};
void() old_thrash8        =[      $shake8,  old_thrash9       ] {lightstyle(0, "a");};
void() old_thrash9        =[      $shake9,  old_thrash10      ] {lightstyle(0, "c");};
void() old_thrash10       =[      $shake10, old_thrash11      ] {lightstyle(0, "e");};
void() old_thrash11       =[      $shake11, old_thrash12      ] {lightstyle(0, "g");};
void() old_thrash12       =[      $shake12, old_thrash13      ] {lightstyle(0, "i");};
void() old_thrash13       =[      $shake13, old_thrash14      ] {lightstyle(0, "k");};
void() old_thrash14       =[      $shake14, old_thrash15      ] {lightstyle(0, "m");};
void() old_thrash15       =[      $shake15, old_thrash16      ] {lightstyle(0, "m");
	self.cnt = self.cnt + 1;
	if (self.cnt >= 3) {
		self.think = old_thrash16;
	} else {
		self.think = old_thrash1;
	}
};
void() old_thrash16       =[      $shake16, old_thrash17      ] {lightstyle(0, "g");};
void() old_thrash17       =[      $shake17, old_thrash18      ] {lightstyle(0, "c");};
void() old_thrash18       =[      $shake18, old_thrash19      ] {lightstyle(0, "b");};
void() old_thrash19       =[      $shake19, old_thrash20      ] {lightstyle(0, "a");};
void() old_thrash20       =[      $shake20, old_thrash20      ] {finale_4();};

//============================================================================

void() finale_3 =
{
	// start shub thrashing wildly
	shub.think = old_thrash1;
	sound (shub, CHAN_VOICE, "boss2/death.wav", 1, ATTN_NONE);
	lightstyle(0, "abcdefghijklmlkjihgfedcb");	
	
	bprint(LOC_BOSS_DEATH_A);
	bprint(ftos(self.arena_team));
	bprint(LOC_BOSS_DEATH_B);
	bprint("\n");
	
	bprint("Your time: ");
	bprint(ftos(time));
	bprint(" seconds.\n");
};

void() finale_4 =
{
	// throw tons of meat chunks	
	local	vector	oldo;
	local	vector	newo;
	local	float	x, y, z;
	local	float	r;

	sound (self, CHAN_VOICE, "boss2/pop2.wav", 1, ATTN_NONE);
	
	oldo = self.origin;

	z = 16;
	while (z <= 144)
	{
		x = -64;
		while (x <= 64)
		{
			y = -64;
			while (y <= 64)
			{
				newo_x = oldo_x + x;
				newo_y = oldo_y + y;
				newo_z = oldo_z + z;
				setorigin(self, newo);

				r = random();
				if (r < 0.3)				
					ThrowGib ("progs/gib1.mdl", -999);
				else if (r < 0.6)
					ThrowGib ("progs/gib2.mdl", -999);
				else
					ThrowGib ("progs/gib3.mdl", -999);
				y = y + 32;
			}
			x = x + 32;
		}
		z = z + 96;
	}

	remove (self);
	
	lightstyle(0, "m");	
};

//============================================================================

void (entity attacker, float damage) nopain =
{
	float hptest = self.max_health;
	//Do a small thrash every time 25% health goes away.
	for (float i = 0; i < 3; i ++) {
		hptest = hptest - (self.max_health * .25);
		if (self.health < hptest && self.health + damage > hptest) {
			self.think = old_pain1;
			bprint(LOC_BOSS_HP_A);
			bprint(ftos(self.arena_team));
			bprint(LOC_BOSS_HP_B);
			bprint(ftos(self.health));
			bprint(LOC_BOSS_HP_C);
			bprint("\n");
			i = 3;
		}
	}
	//if (random() < .3) {
		sound (shub, CHAN_VOICE, "hknight/grunt.wav", 1, ATTN_NONE);
	//}
	
};

//============================================================================
void() create_oldonehurt;

/*QUAKED monster_oldone (1 0 0) (-16 -16 -24) (16 16 32)
*/
void() monster_oldone =
{
	precache_model2 ("progs/oldone.mdl");

	precache_sound2 ("boss2/death.wav");
	precache_sound2 ("boss2/sight.wav");
	precache_sound2 ("boss2/pop2.wav");
	precache_sound2 ("hknight/grunt.wav");

	self.solid = SOLID_SLIDEBOX;
	self.movetype = MOVETYPE_STEP;
	
	setmodel (self, "progs/oldone.mdl");
	setsize (self, '-128 -128 -24', '128 128 256');

	if (!self.health)
		self.health = 40000;
	
	self.max_health = self.health;
	
	self.think = old_idle1;
	self.nextthink = time + 0.1;	
	self.takedamage = DAMAGE_AIM;
	self.th_pain = nopain;
	self.th_die = finale_3;
	shub = self;
	
	create_oldonehurt();
	
	total_monsters = total_monsters + 1;
};

void (entity attacker, float damage) oldonehurt_pain =
{
	T_Damage(self.enemy, self, attacker, damage);
	if (self.enemy.health <= 0) {
		self.health = 0;
		self.solid = SOLID_NOT;
	}
};

void() create_oldonehurt = {
	entity obj = spawn();
	
	obj.enemy = self;
	obj.classname = "info_oldonehurt";
	
	obj.arena_team = self.arena_team;
	obj.solid = SOLID_BBOX;
	setsize (obj, '-12 -12 -40', '12 12 40');
	obj.takedamage = DAMAGE_YES;
	obj.health = 9999999999999;
	obj.th_die = SUB_Null;
	obj.th_pain = oldonehurt_pain;
	
	makevectors(self.angles);
	
	setorigin(obj, self.origin + (v_forward * 130) + '0 0 45');
}






