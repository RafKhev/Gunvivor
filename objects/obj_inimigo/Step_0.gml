/// @description Insert description here
// You can write your code in this editor


stateMachine()

if (distance_to_object(obj_player) <= 100){
	state = "firing"
	//show_debug_message(state)
}else{
	state = "chase"
	//show_debug_message(state)
}

if (health = 0){
	instance_destroy()	
}
//show_debug_message(distance_to_object(obj_player))