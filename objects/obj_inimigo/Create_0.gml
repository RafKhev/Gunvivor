/// @description Insert description here
// You can write your code in this editor

exp_concedido = 100
controle_exp = obj_level_control;

status_burning = false
status_frozen = false
status_immune = false
status_slow = false

health = 5

speed = 1
//State machine
state = "chase"

stateMachine = function(){
	switch(state){
		case "chase":
			if (instance_exists(obj_player)){
				speed = 1
				direction = point_direction(x,y,lerp(x,obj_player.x,room_speed),lerp(y,obj_player.y,room_speed))
				image_angle = direction
			}
			break
		case "firing":
			if instance_exists(obj_player){
				direction = point_direction(x,y,lerp(x,obj_player.x,room_speed),lerp(y,obj_player.y,room_speed))
				image_angle = direction
				speed = 0
			}
	default:
		break	
	}
}