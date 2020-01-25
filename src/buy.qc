void() no_money = {
	centerprint(activator, LOC_NO_MONEY);
	sound (activator, CHAN_VOICE, "misc/talk.wav", 1, ATTN_NORM);
}

void() no_space = {
	centerprint(activator, LOC_NO_SPACE);
	sound (activator, CHAN_VOICE, "misc/talk.wav", 1, ATTN_NORM);
}

void() buy_ogre_use = {
	bprint(activator.classname);
}

void() buy_ogre = {
	precache_ogre();
	self.use = buy_ogre_use;
}