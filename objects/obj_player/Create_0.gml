/// @description Insert description here
// You can write your code in this editor

vel = 3
lastKey = 0

for (var i = 0;i<9;i++){
	alarm[i] = 0;	
}

setDirection = function(dir){
	if (!keyboard_check(vk_space)){
		lastKey = keyboard_key
		direction = dir
		image_angle = direction
		//show_debug_message(lastKey)
		return
	}
}

function my_array_delete(arr, pos) {
    var arr_len = array_length(arr);
    if (arr_len > 0 && pos >= 0 && pos < arr_len) {
        var new_arr = array_create(arr_len-1);
        array_copy(new_arr, 0, arr, 0, pos);
        array_copy(new_arr, pos, arr, pos+1, arr_len-(pos+1));
        return new_arr;
    } else {
        return arr;
    }
}

//--------------------------------------------//
//ARMAS
//--------------------------------------------//

//weapons = ["minigun", "shotgun","pistol"];
weapons = []
//cds = [3, 25, 10]
cds =[]



addWeapon = function(weapon, _cd){
	array_push(weapons, weapon)
	array_push(cds, _cd)
	show_debug_message("adiciounou " + weapon + " recarga: " + string(_cd)) 
}

removeWeapon = function(weapon){
	for (var i=0;i<array_length(weapons);i++){
		if weapon == weapons[i]{
			weapons = my_array_delete(weapons,i);
			cds = my_array_delete(cds,i)
			show_debug_message("removeu " + weapon)
		}
	}
}

atirar = function(){
	if ((keyboard_check(vk_up) || keyboard_check(vk_left) || keyboard_check(vk_down) ||  keyboard_check(vk_right))){
		for (var i=0;i<array_length(weapons);i++){
			var current = weapons[i]
			
			switch(current){
				case "pistol":
					if (alarm[0] == -1){
						pistol()
						alarm[0] = cds[i]
					} 
					break;
				case "shotgun":
					if (alarm[1] == -1){
						shotgun()
						alarm[1] = cds[i]
					}
					break;
				case "minigun":
					if (alarm[2] == -1){
						minigun()
						alarm[2] = cds[i]
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

pistol = function(){
	
	var bullet1 = obj_bullet

	var b = instance_create_layer(x,y,"tiros",bullet1);
	b.image_xscale = 1.4
	b.image_yscale = 1.4
	//show_debug_message("atirou");
	
}

shotgun = function(){
	
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
