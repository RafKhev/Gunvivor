/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_player)){
	direction = point_direction(x,y,lerp(x,obj_player.x,10),lerp(y,obj_player.y,10))
	image_angle = direction
}



