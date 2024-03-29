/// @description Insert description here
// You can write your code in this editor
//var gui_height = display_get_gui_height()
//var gui_width = display_get_gui_width()

draw_text(20,60,"Level: "+ string(level)+"\nEXP: "+string(exp_current)+"/"+string(next_level))

var weapon_sprite = spr_weapon_sprites;

if (upgradeWindowActive){
	draw_sprite_stretched_ext(spr_upgrade, image_index, 32, 32, 128, 128, c_white, 1);
	draw_sprite_ext(weapon_sprite, upgradeSpriteIndex[0], 96, 96,2,2,0,c_white,1);
	draw_text(90, 126,string(upgradeItems[0]) + "LVL: " + string(level_list[0]));
	draw_text(90, 146,string(upgradeTypes[0]));
	
	draw_sprite_stretched_ext(spr_upgrade, image_index, 32, 192, 128, 128, c_white, 1);
	draw_sprite_ext(weapon_sprite, upgradeSpriteIndex[1], 96, 256,2,2,0,c_white,1); 
	draw_text(90, 276,string(upgradeItems[1]) + "LVL: " + string(level_list[1]));
	draw_text(90, 296,string(upgradeTypes[1]));
	
	draw_sprite_stretched_ext(spr_upgrade, image_index, 32, 352, 128, 128, c_white, 1);
	draw_sprite_ext(weapon_sprite, upgradeSpriteIndex[2], 96, 416,2,2,0,c_white,1); 
	draw_text(90, 436 ,string(upgradeItems[2]) + "LVL: " + string(level_list[2]));
	draw_text(90, 456,string(upgradeTypes[2]));
}
