/// @description Insert description here
// You can write your code in this editor
function c(wp){
	for (i=0;i<array_length(obj_player.weapons);i++)
		if wp == obj_player.weapons[i]
			return true
	return false
}

switch(image_index){
	case 0:
		weapon = "pistol"
		cd = 15
		activeW = c(weapon)
		break;
	case 1:
		weapon = "shotgun"
		cd = 30
		activeW = c(weapon)
		break
	case 2: 
		weapon = "minigun"
		cd = 5
		activeW = c(weapon)
		break
}

toggle_weapon(weapon,cd)