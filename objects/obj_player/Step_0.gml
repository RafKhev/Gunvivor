/// @description Comandos
// You can write your code in this editor

//Teclas
var up, down, left, right;
var s_up, s_down, s_left, s_right;

//var aup, adown, aleft, aright;
up = keyboard_check(ord("W"));
left = keyboard_check(ord("A"));
down = keyboard_check(ord("S"));
right = keyboard_check(ord("D"));

s_up = vk_up;
s_left = vk_left;
s_down = vk_down;
s_right = vk_right;

switch(keyboard_key){
	
	case s_right:
		//show_debug_message("right")
		setDirection(0)
		break
	case s_up:
		//show_debug_message("up")
		setDirection(90)
		break
	case s_left:
		//show_debug_message("left")
		setDirection(180)
		break
	case s_down:
		//show_debug_message("down")
		setDirection(270)
		break
	
	
}

atirar()
	
//Movimentação
y += (down-up)*vel;
x += (right-left)*vel; 

//Andar rapido
if(keyboard_check(ord("q"))){
	show_debug_message("SPID")
	vel=10;
}else{
	vel=5;
}



