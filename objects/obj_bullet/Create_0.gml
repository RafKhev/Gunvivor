/// @description Insert description here
// You can write your code in this editor
direction = obj_player.direction
image_angle = obj_player.image_angle
speed = 14
alarm[0] = 1
damage = 1
pierce = 1;

causa_dano = function(instance){
	instance.health -= damage
}
