/// @description Insert description here
// You can write your code in this editor
var cores = choose (c_red, c_orange, c_yellow)
var xx = random_range(x-3,x+3)
var yy =  random_range(y-3, y+3)

gpu_set_blendmode(bm_add)
draw_sprite_ext(spr_explosao, image_index-1, xx, yy, 0.9, 0.9, image_angle, cores, 0.9);
gpu_set_blendmode(bm_normal)





