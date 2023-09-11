/// @description Insert description here
// You can write your code in this editor
_cd = 0
player = obj_player
weapon = ""
active_w = false

function toggle_weapon(_weapon, _cooldown){
	show_debug_message(active_w) 
	if (active_w == false){
		
		player.addWeapon(_weapon, _cooldown);
		active_w = true
	}
	else{
		player.removeWeapon(_weapon);
		active_w = false
	}
	
}

