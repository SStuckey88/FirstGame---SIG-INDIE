// Get Inputs
var key_left =  keyboard_check(vk_left) or keyboard_check(ord("A"))
var key_right = keyboard_check(vk_right)|| keyboard_check(ord("D"))
var key_jump  = keyboard_check(vk_space)|| keyboard_check(ord("Z"))

var on_ground = place_meeting(x,y+1,oSolid)

dir_h = key_right - key_left

hspd = dir_h * walk_spd

vspd += grv;

if key_jump and jumps> 0 and  jumpBuffer <= 0
{

	vspd = jump_spd;
	jumpBuffer += 15
	jumps -=1;
		instance_create_depth(x+ irandom_range(-15,15),y+irandom_range(-15,15)+10,depth,odust);
	
	
	
}

if on_ground {
	jumps = maxJumps;
	jumpBuffer = 0;
	}

jumpBuffer = jumpBuffer -0.5
if jumpBuffer < 0{
	jumpBuffer = 0;
}

// Collision Code
if(place_meeting(x+hspd,y,oSolid))
{
	while(!place_meeting(x+sign(hspd),y,oSolid))
	{
		x+= sign(hspd);
	}
	hspd = 0;
}
x += hspd;

if(place_meeting(x,y+vspd,oSolid))
{
	while(!place_meeting(x,y+sign(vspd),oSolid))
	{
		y += sign(vspd);
	}
	vspd = 0
}
y += vspd
 
// Change Sprite
if hspd == 0
{
	
	sprite_index = sPlayer
} else  {
	image_xscale = sign(hspd)
	sprite_index = sPlayerRun 
}

if !on_ground 
	sprite_index = sPlayerJump