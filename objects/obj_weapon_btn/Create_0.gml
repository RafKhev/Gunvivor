/// @description Insert description here
// You can write your code in this editor

player = obj_player
weapon = ""
activeW = false

function toggle_weapon(weapon, cooldown){
	show_debug_message(activeW) 
	if (activeW == false){
		
		player.addWeapon(weapon, cooldown);
		activeW = true
	}
	else{
		player.removeWeapon(weapon);
		activeW = false
	}
	
}

