/// @description Insert description here
// You can write your code in this editor
var select1 = keyboard_check_pressed(49);
var select2 = keyboard_check_pressed(50);
var select3 = keyboard_check_pressed(51);


if (select1){
	
	//show_debug_message("Melhorou: " + upgradeItems[0]);
	if p.has_weapon(upgradeItems[0])
		p.upgradeWeapon(upgradeItems[0], upgradeTypes[0]);
	else
		p.addWeapon(upgradeItems[0], upgradeItemsCooldown[0]);
	upgradeWindowActive = false;
	
}else if(select2){
	
	//show_debug_message("Melhorou: " + upgradeItems[1]);
	if p.has_weapon(upgradeItems[1])
		p.upgradeWeapon(upgradeItems[1], upgradeTypes[1]);
	else
		p.addWeapon(upgradeItems[1], upgradeItemsCooldown[1]);
	upgradeWindowActive = false;
	
}else if(select3){
	
	//show_debug_message("Melhorou: " + upgradeItems[2]);
	if p.has_weapon(upgradeItems[2]){
		p.upgradeWeapon(upgradeItems[2], upgradeTypes[2]);
	}
	else
		p.addWeapon(upgradeItems[2], upgradeItemsCooldown[2]);
		
	upgradeWindowActive = false;
	
}



