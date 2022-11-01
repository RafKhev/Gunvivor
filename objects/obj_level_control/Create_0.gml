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

weapon_list = []

for (i=0;i<array_length(obj_player.weapons);i++){
	array_push(weapon_list, obj_player.weapons[i])
}

levelup = function(){
	up_text = true
	level+=1
	next_level = floor(next_level * 1.8)
	
	var w1 = instance_create_layer
}






