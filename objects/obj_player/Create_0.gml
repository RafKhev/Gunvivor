/// @description Armas
// You can write your code in this editor

lastKey = 0

for (var _i = 0;_i<9;_i++){ //Arruma todos alarmes
	alarm[_i] = 0;	
}

setDirection = function(_dir){ //Movimento
	if (!keyboard_check(vk_space)){
		lastKey = keyboard_key
		direction = dir
		image_angle = direction
		//show_debug_message(lastKey)
		return
	}
}

function my_array_delete(_arr, _pos) { 
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
//VARIÁVEIS DO JOGADOR
//--------------------------------------------//
vel = 3
player_damage = 1;
player_weapon_scale = 1;
max_weapon_level = 15;
//--------------------------------------------//
/*VARIÁVEIS DAS ARMAS

scale: tamanho do projétil
dano: dano causado
pierce: inimigos atingidos antes do projétil ser destruido
velocity: velocidade de movimento do projétil
cooldown: frames até o próximo disparo
min_cooldown: menor intervalo possível
level: nível da arma
*/
//--------------------------------------------//

pistol = {
	name: "Pistol",
	scale: 1.4, 
	damage: 1,
	pierce: 0,
	velocity: 18,
	cooldown: 14,
	min_cooldown: 3,
	level: 0,
	max_level: 10
}

shotgun = {
	name: "Shotgun",
	scale: 0.8,
	amount: 4,
	spread_reduc: 15,
	damage: 6,
	pierce: 0,
	velocity: 10,
	cooldown: 22,
	min_cooldown: 6,
	level: 0,
	max_level: 10
}

minigun = {
	name: "Minigun",
	scale: 1.4, 
	damage: 1,
	pierce: 0,
	velocity: 18,
	cooldown: 14,
	min_cooldown: 3,
	//Escalonamento
	size_scale: 1.4, 
	damage_scale: 0.4,
	pierce_scale: 0,
	velocity_scale: 3,
	cooldown_scale: 2,
	//Nivel
	level: 0,
	max_level: 10
}

bomb = {
	name: "Bomb",
	scale: 1.4, 
	damage: 1,
	pierce: 0,
	velocity: 18,
	cooldown: 14,
	min_cooldown: 3,
	level: 0,
	max_level: 10
}
//##########################################//	
//               LISTA DE ARMAS             //
//##########################################//	

//weapons = ["minigun","shotgun","pistol"];
weapons = ["shotgun"]

//cds = [1, 25, 17]
cds = [17]

//##########################################//	
//          MANIPULAR DAS ARMAS             //
//##########################################//

addWeapon = function(weapon, _cd){
	array_push(weapons, weapon)
	array_push(cds, _cd)
	//show_debug_message("adiciounou " + weapon + " recarga: " + string(_cd))
	switch(weapon){
		case "pistol":
			pistol.level++
			break
		case "shotgun":
			shotgun.level++
			break
		case "minigun":
			minigun.level++
			break
		case "bomb":
			bomb.level++
			break
		default: break
	}
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

upgrade_weapon = function(_arma, _tipo){
	if(_arma.level < _arma.max_level){
		switch(upgrade){
			case "scale":
				break
			default: break;
		}
	}
}
upgradeWeapon = function(arma, upgrade){
	switch(arma){
	case "pistol":

		if(pistol.level < pistol.max_level){
			switch(upgrade){
				case "Speed":
					pistol.velocity+=10;
					show_debug_message("melhorou pistol");
				default: break;
			}
			weapon_pistol_level++
		}else {
			show_debug_message("MAX LEVEL REACHED, GET SOME POINTS INSTEAD")	
		}
		
		break;
	case "shotgun":
		if(shotgun.level < shotgun.level){
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
	
//##########################################//	
	
has_weapon = function(weapon){ 
	if get_weapon_level(weapon) > 0{
		return true
	}else
		return false
}

get_weapon_level = function(weap){
	switch(weap){
		case "pistol":
			return weapon_pistol_level;
		case "shotgun":
			return weapon_shotgun_level;
		case "minigun":
			return weapon_minigun_level;
		case "bomb":
			return weapon_bomb_level;
		default: break;
	}
}

//##########################################//	
//                   ARMAS                  //
//##########################################//	

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
	b.image_xscale = pistol.scale * player_weapon_scale
	b.image_yscale = pistol.scale * player_weapon_scale
	b.speed = pistol.velocity
	b.pierce = pistol.pierce
	b.damage = pistol.damage * player_damage
	//show_debug_message("atirou");
	
}

shotgun = function(){
	
	random_set_seed(random(60))
	
	var b = obj_bullet
	
	var initial_angle = direction
	var spd = shotgun.velocity

	repeat(shotgun.amount){
		var angle = random_range(-20-shotgun.spread_reduc,20+shotgun.spread_reduc)
		var b1 = instance_create_layer(x,y,"tiros",b)
		b1.image_angle -= angle 
		b1.direction -= angle 
		b1.speed = spd
	}
}

minigun = function(){
	var b = obj_bullet
	var initial_angle = direction
	var new_angle = irandom_range(initial_angle-20,initial_angle+20)
	
	var b1 = instance_create_layer(x,y,"tiros",b)
	b1.direction = new_angle
	b1.image_angle = direction
	b1.speed = minigun.velocity
}
	
bomb = function(){
	var b = obj_bomba
	
	var b1 = instance_create_layer(x,y,"tiros",b)
	b1.direction = direction
	b1.speed = bomb.velocity
}

