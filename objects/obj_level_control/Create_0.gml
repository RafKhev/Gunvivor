/// @description Insert description here
// You can write your code in this editor

p = obj_player;
level = 1
exp_current = 0
next_level = 100
up_text = false
xp_multiply = 1

ganha_xp = function(_xp){
		exp_current += _xp * xp_multiply
		
		if exp_current >= next_level {
			levelup()
		}
}

//---------------------------------------------------------//

upgradeWindowActive = false;
upgradeSpriteIndex = [];
upgradeItemsCooldown = [0,0,0,0];

upgrade_list_pistol = ["Speed"]
upgrade_list_shotgun = ["Speed"]
upgrade_list_minigun = ["Speed"]
upgrade_list_bomb = ["Speed"]
//upgrade_list_pistol
//upgrade_list_pistol

weapon_list = ["pistol", "shotgun", "minigun", "bomb"];
cooldown_list = [p.pistol.cooldown, p.shotgun.cooldown, p.minigun.cooldown, p.bomb.cooldown];


//-------------------------------------------------------//
levelup = function(){
	
	upgrade_list = []
	level_list = []
	
	for (i=0;i<3;i++){ //Pega uma arma aleatória do vetor weapon_list
		
		do {
			r = irandom_range(0,array_length(weapon_list));
		}until(r != array_length(weapon_list));
		
		upgrade_items[i] = weapon_list[r];
		upgrade_sprite_index[i] = r;
		
		//Verifica a lista de upgrades
		
		switch (upgrade_items[i]){
			case "pistol":
				array_copy(upgrade_list,0,upgrade_list_pistol,0,array_length(upgrade_list_pistol));
				break;
			case "shotgun":
				array_copy(upgrade_list,0,upgrade_list_shotgun,0,array_length(upgrade_list_shotgun));
				break;
			case "minigun":
				array_copy(upgrade_list,0,upgrade_list_minigun,0,array_length(upgrade_list_minigun));
				break;
			case "bomb":
				array_copy(upgrade_list,0,upgrade_list_bomb,0,array_length(upgrade_list_bomb));
				break;
			default: break;
		}
		
		do {
			b = irandom_range(0,array_length(upgrade_list));
		}until(b != array_length(upgrade_list));
		
		upgradeTypes[i] = upgrade_list[b];
		array_push(level_list, p.get_weapon_level(upgradeItems[i]))
		upgradeItemsCooldown[i] = cooldown_list[r];
		show_debug_message(string(upgradeItems[i]) + ":" + string(p.get_weapon_level(upgradeItems[i])))
		
		//show_debug_message(string(i) + ":" + upgradeItems[i] + ":" + upgradeItemsCooldown[i]);
	}
	upgradeWindowActive = true;
	
	//---------------------------------------//
	
	up_text = true
	level+=1
	
	next_level = floor(next_level * 1) //mudar pra 1.8 depois
}


