/// @description Insert description here
// You can write your code in this editor

level = 1
exp_current = 0
next_level = 100

xp_multiply = 1

ganha_xp = function(_xp){
		exp_current += _xp * xp_multiply
		
		if exp_current >= next_level {
			level+=1
			next_level = floor(next_level * 1.8)
		}
}





