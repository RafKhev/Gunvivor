/// @description Insert description here
// You can write your code in this editor
var select1 = keyboard_check_pressed(49);
var select2 = keyboard_check_pressed(50);
var select3 = keyboard_check_pressed(51);




if (select1){
	show_debug_message("Melhorou: " + upgradeItems[0]);
	upgradeWindowActive = false;
}else if(select2){
	show_debug_message("Melhorou: " + upgradeItems[1]);
	upgradeWindowActive = false;
}else if(select3){
	show_debug_message("Melhorou: " + upgradeItems[2]);
	upgradeWindowActive = false;
}

