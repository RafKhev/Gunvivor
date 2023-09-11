/// @description Insert description here
// You can write your code in this editor
if(iframe){
	gpu_set_blendmode(bm_add)
	draw_sprite_ext(spr_inimigo, 0, x, y, 1, 1, image_angle, c_red, 1)
	gpu_set_blendmode(bm_normal)
}else {
	draw_self()	
}
draw_text(x+16,y,hp)