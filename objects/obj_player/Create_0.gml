/// @description Insert description here
// You can write your code in this editor

//@TODO arrumar o sistema de atirar multiplas armas
vel = 3
lastKey = 0

weapons = ["minigun"];

cds = [10,30,5]

for (var i = 0;i<9;i++){
	alarm[i] = 0;	
}

atirar = function(){
	if ((keyboard_check(vk_up) || keyboard_check(vk_left) || keyboard_check(vk_down) ||  keyboard_check(vk_right))){
		for (var i=0;i<array_length(weapons);i++){
			var current = weapons[i]
			
			switch(current){
				case "pistol":
					if (alarm[0] == -1){
						pistol()
						alarm[0] = cds[0]
					} 
					break;
				case "shotgun":
					if (alarm[1] == -1){
						shotgun()
						alarm[1] = cds[1]
					}
					break;
				case "minigun":
					if (alarm[2] == -1){
						minigun()
						alarm[2] = cds[2]
					}
					break;
			}
			
		}
			
	}
	//esse daqui ta funcionando blz
	//if (alarm[1] = -1 && (keyboard_check(vk_up) || keyboard_check(vk_left) || keyboard_check(vk_down) ||  keyboard_check(vk_right))){
	//	alarm[1] = cd2
	//	shotgun()
	//}
	
	
	
}

setDirection = function(dir){
	if (!keyboard_check(vk_space)){
		lastKey = keyboard_key
		direction = dir
		image_angle = direction
		show_debug_message(lastKey)
		return
	}
}

pistol = function(){
	cooldown = 25
	
	var bullet1 = obj_bullet

	var b = instance_create_layer(x,y,"tiros",bullet1);
	b.image_xscale = 1.4
	b.image_yscale = 1.4
	//show_debug_message("atirou");
	
}

shotgun = function(){
	cooldown = 40
	
	var b = obj_bullet
	
	var b1 = instance_create_layer(x,y,"tiros",b)
	b1.image_angle -= 40
	b1.direction -= 40
	var b2 = instance_create_layer(x,y,"tiros",b)
	b2.image_angle += 40
	b2.direction += 40
	instance_create_layer(x,y,"tiros",b)
	
}

minigun = function(){
	var b = obj_bullet
	var initial_angle = direction
	var new_angle = irandom_range(initial_angle-15,initial_angle+15)
	
	var b1 = instance_create_layer(x,y,"tiros",b)
	b1.direction = new_angle
	b1.image_angle = direction
}
