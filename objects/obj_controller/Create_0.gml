/// @description Insert description here
// You can write your code in this editor

enemy_count = 0

random_set_seed(room_speed)

spawn_enemy = function(_enemy, amount){
	
	repeat(amount){
		var xx = random_range(0,room_width)
		var yy = random_range(0,room_height)
	
		var avis = instance_create_layer(xx,yy, "inimigos", obj_aviso)
		avis.passEnemy(_enemy)
		
		enemy_count++
	}
}
