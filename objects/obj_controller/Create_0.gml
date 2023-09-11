/// @description Insert description here
// You can write your code in this editor

global.frames = 60

enemy_count = 0

random_set_seed(global.frames)

spawn_enemy = function(_enemy, _amount){
	
	repeat(_amount){
		var _xx = random_range(0,room_width)
		var _yy = random_range(0,room_height)
	
		var _avis = instance_create_layer(_xx,_yy, "inimigos", obj_aviso)
		avis.passEnemy(_enemy)
		
		enemy_count++
	}
}
