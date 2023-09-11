/// @description Insert description here
// You can write your code in this editor

exp_concedido = 100

controle_exp = obj_level_control;

status_burning = false
status_frozen = false
status_immune = false
status_slow = false
iframe = false

hp = irandom_range(controle_exp.level, controle_exp.level+5)

speed = 1

alarm[0] = 0

dano = function(_dano){
	hp -= _dano
	//iframe = true
	//alarm[0] = 1
	
}

//State machine
state = "chase"

state_machine = function(){
	switch(state){
		case "chase":
			if (instance_exists(obj_player)){
				speed = 1
				direction = point_direction(x,y,lerp(x,obj_player.x,global.frames),lerp(y,obj_player.y,global.frames))
				image_angle = direction
			}
			break
		case "firing":
			if instance_exists(obj_player){
				direction = point_direction(x,y,lerp(x,obj_player.x,global.frames),lerp(y,obj_player.y,global.frames))
				image_angle = direction
				speed = 0
			}
	default:
		break	
	}
}