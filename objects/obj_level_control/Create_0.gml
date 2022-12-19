/// @description Insert description here
// You can write your code in this editor

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

upgrade_list = ["Dano", "Velocidade", "Tamanho", "Perfurar"]
weapon_list = ["pistol", "shotgun", "minigun", "bomb"];
cooldown_list = [30, 60, 4, 150];

//-------------------------------------------------------//
levelup = function(){
	
	for (i=0;i<3;i++){ //Pega uma arma aleatória do vetor weapon_list
		
		do {
			r = irandom_range(0,array_length(weapon_list));
		}until(r != array_length(weapon_list));
		do {
			b = irandom_range(0,array_length(upgrade_list));
		}until(b != array_length(upgrade_list));
		
		upgradeItems[i] = weapon_list[r];
		upgradeSpriteIndex[i] = r;
		upgradeTypes[i] = upgrade_list[b];
		upgradeItemsCooldown[i] = cooldown_list[r];
		show_debug_message(upgradeItemsCooldown[r])
		
		//show_debug_message(string(i) + ":" + upgradeItems[i] + ":" + upgradeItemsCooldown[i]);
	}

	
	up_text = true
	level+=1
	next_level = floor(next_level * 1) //mudar pra 1.8 depois
	
	upgradeWindowActive = true;
}




