/// @description Armas
// You can write your code in this editor

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
//VARIÁVEIS
//--------------------------------------------//
vel = 3
xp_scaling = 1;

player_damage = 1;
player_weapon_scale = 1;
max_weapon_level = 15;
//--------------------------------------------//
//VARIÁVEIS DAS ARMAS
//--------------------------------------------//
//Pistola
weapon_pistol_scale = 1.4;
weapon_pistol_damage = 1;
weapon_pistol_pierce = 0;
weapon_pistol_speed = 18;
weapon_pistol_cooldown = 14;
weapon_pistol_level = 1;
//Shotgun
weapon_shotgun_level = 1;
weapon_shotgun_speed = 10;
//Minigun
weapon_minigun_level = 1;
weapon_minigun_speed = 15;
//Bomba
weapon_bomb_level = 1;
weapon_bomb_speed = 3;
//--------------------------------------------//
//ARMAS
//--------------------------------------------//

//weapons = ["minigun","shotgun","pistol"];
weapons = ["pistol"]

//cds = [1, 25, 17]
cds = [17]


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
	
upgradeWeapon = function(arma, upgrade){
	switch(arma){
	case "pistol":
		if(weapon_pistol_level < max_weapon_level){
			switch(upgrade){
				case "Speed":
					weapon_pistol_speed+=10;
					show_debug_message("melhorou pistol");
				default: break;
			}
			weapon_pistol_level++
		}else {
			show_debug_message("MAX LEVEL REACHED, GET SOME POINTS INSTEAD")	
		}
		
		break;
	case "shotgun":
		if(weapon_shotgun_level < max_weapon_level){
			switch(upgrade){
				case "Speed":
					weapon_shotgun_speed+=10;
					show_debug_message("melhorou shot");
					break;
				default: break;
			}
			weapon_shotgun_level++
		}else {
			show_debug_message("MAX LEVEL REACHED, GET SOME POINTS INSTEAD")	
		}
		break;
	case "minigun":
		if(weapon_minigun_level < max_weapon_level){
			switch(upgrade){
				case "Speed":
					weapon_minigun_speed+=10;
					show_debug_message("melhorou mini");
					break;
				default: break;
			}
			weapon_minigun_level++
		}else {
			show_debug_message("MAX LEVEL REACHED, GET SOME POINTS INSTEAD")	
		}
		break;
	case "bomb":
		if(weapon_bomb_level < max_weapon_level){
			switch(upgrade){
				case "Speed":
					weapon_bomb_speed+=10;
					show_debug_message("melhorou bomb")
					break;
				default: break;
			}
			weapon_bomb_level++
		}else {
			show_debug_message("MAX LEVEL REACHED, GET SOME POINTS INSTEAD")	
		}
		break;
	break;
	default: break;
	}
}
	
hasWeapon = function(weapon){ 
	var l = array_length(weapons);
	for (i=0;i<l;i++){
		if weapon == weapons[i]{
			show_debug_message("tem " + string(weapon))
			return true;
		}
		else{
			show_debug_message("nao tem " + string(weapon))
			return false
		}
	}
}

//--------------------------------------------//
//ARMAS
//--------------------------------------------//

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
				case "bomb":
					if (alarm[3] == -1){
						bomb()
						alarm[3] = cds[i]
					}
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
	b.image_xscale = weapon_pistol_scale * player_weapon_scale
	b.image_yscale = weapon_pistol_scale * player_weapon_scale
	b.speed = weapon_pistol_speed
	b.pierce = weapon_pistol_pierce
	b.damage = weapon_pistol_damage * player_damage
	//show_debug_message("atirou");
	
}

shotgun = function(){
	
	var b = obj_bullet
	
	var b1 = instance_create_layer(x,y,"tiros",b)
	b1.image_angle -= 40
	b1.direction -= 40
	b1.speed = weapon_shotgun_speed
	var b2 = instance_create_layer(x,y,"tiros",b)
	b2.image_angle += 40
	b2.direction += 40
	b2.speed = weapon_shotgun_speed
	instance_create_layer(x,y,"tiros",b)
	
}

minigun = function(){
	var b = obj_bullet
	var initial_angle = direction
	var new_angle = irandom_range(initial_angle-20,initial_angle+20)
	
	var b1 = instance_create_layer(x,y,"tiros",b)
	b1.direction = new_angle
	b1.image_angle = direction
	b1.speed = weapon_minigun_speed
}
	
bomb = function(){
	var b = obj_bomba
	
	var b1 = instance_create_layer(x,y,"tiros",b)
	b1.direction = direction
	b1.speed = weapon_bomb_speed
}

