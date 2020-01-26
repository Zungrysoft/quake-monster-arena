void() no_money = {
	centerprint(activator, LOC_NO_MONEY);
	sound (activator, CHAN_VOICE, "misc/talk.wav", 1, ATTN_NORM);
}

void() no_space = {
	centerprint(activator, LOC_NO_SPACE);
	sound (activator, CHAN_VOICE, "misc/talk.wav", 1, ATTN_NORM);
}

void() precache_buy;

void() buy_use = {
	if (activator.inventory_size >= 50) {
		no_space();
		return;
	}
	
	activator.inventory[activator.inventory_size] = self.message;
	activator.inventory_size ++;
	activator.ammo_rockets = activator.inventory_size;
	
	self = activator;
	W_SetCurrentAmmo();
}

void() effect_buy = {
	precache_buy();
	self.use = buy_use;
	if (!self.message) {
		self.message = "monster_ogre";
	}
	if (!self.count)
		self.count = 50;
}

/*
Items are:
health	(red)
armor	(green)
quad	(blue)
pent	(yellow)
ring	(white)
speed	(lt blue)
ticket	(rainbow)
*/

void() reinitialize =
{
	if (self.classname == "monster_army")		{monster_army();}
	if (self.classname == "monster_dog")		{monster_dog();}
	if (self.classname == "monster_enforcer")	{monster_enforcer();}
	if (self.classname == "monster_ogre")		{monster_ogre();}
	if (self.classname == "monster_wizard")		{monster_wizard();}
	if (self.classname == "monster_demon1")		{monster_demon1();}
	if (self.classname == "monster_shambler")	{monster_shambler();}
	if (self.classname == "monster_fish")		{monster_fish();}
	if (self.classname == "monster_hell_knight"){monster_hell_knight();}
	if (self.classname == "monster_shalrath")	{monster_shalrath();}
	if (self.classname == "monster_tarbaby")	{monster_tarbaby();}
	if (self.classname == "monster_zombie")		{monster_zombie();}
	if (self.classname == "monster_knight")		{monster_knight();}
};

void() precache_buy =
{
	if (self.message == "monster_army")			{precache_army();}
	if (self.message == "monster_dog")			{precache_dog();}
	if (self.message == "monster_enforcer")		{precache_enforcer();}
	if (self.message == "monster_ogre")			{precache_ogre();}
	if (self.message == "monster_wizard")		{precache_wizard();}
	if (self.message == "monster_demon1")		{precache_demon1();}
	if (self.message == "monster_shambler")		{precache_shambler();}
	if (self.message == "monster_fish")			{precache_fish();}
	if (self.message == "monster_hell_knight")	{precache_hell_knight();}
	if (self.message == "monster_shalrath")		{precache_shalrath();}
	if (self.message == "monster_tarbaby")		{precache_tarbaby();}
	if (self.message == "monster_zombie")		{precache_zombie();}
	if (self.message == "monster_knight")		{precache_knight();}
};

float(string s) checktype =
{
	if (s == "health")	{return 1;}
	if (s == "armor")	{return 1;}
	if (s == "quad")	{return 1;}
	if (s == "pent")	{return 1;}
	if (s == "ring")	{return 1;}
	if (s == "speed")	{return 1;}
	
	return 0;
};




