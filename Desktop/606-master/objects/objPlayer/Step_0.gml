//Compute move direction on x-axis based on player input; either -1 if receiving left input(s), 1 if receiving right input(s), or 0 if receiving both left and right inputs at the same time

xMoveDir = (keyboard_check(ord("D")) or keyboard_check(vk_right)) - (keyboard_check(ord("A")) or keyboard_check(vk_left));

//Determine whether or not player is jumping
var jumping = 0;
if (tilemap_get_at_pixel(collision,bbox_left,bbox_bottom+1) != 0) or (tilemap_get_at_pixel(collision,bbox_right,bbox_bottom+1) != 0) or (place_meeting(bbox_right,bbox_bottom+1,objPlatform)) {
	if (keyboard_check_pressed(vk_space)) {
		jumping = 1
		audio_play_sound(soundJump,0,false);
	}
}

if (xMoveDir > 0) {
	sprite_index = sprPlayerRWalk
}else if (xMoveDir < 0) {
	sprite_index = sprPlayerLWalk	
}

//Compute new rocketImpulseX
if rocketImpulseX > 0 {
	rocketImpulseX -= drag
	if rocketImpulseX < 0 {
		rocketImpulseX = 0
	}
} else if rocketImpulseX < 0 {
	rocketImpulseX += drag
	if rocketImpulseX > 0 {
		rocketImpulseX = 0
	}
}

//Determine whether standing on a moving platform, and if so compute a value equivalent to that platform's horizontal speed to add to dx
var platformStanding = (instance_position(bbox_right,bbox_bottom+1,objPlatform))
var platformStandingDx = 0;
if platformStanding != noone {
	platformStandingDx = platformStanding.hSpeed;
}

//Compute dx and dy
dx = rocketImpulseX + (xMoveDir * moveSpeed) + platformStandingDx; //TEMPORARILY removed rocketImpulseX from this calculation until we've figured out x-axis rocket impulse correctly
dy = rocketImpulseY + dy + grav + (jumping * jumpImpulse);

//x-axis collisions
if (dx > 0) {
	// [CURRENTLY BREAKING MOVEMENT] dx -= drag;
	while (tilemap_get_at_pixel(collision,bbox_right + dx,bbox_top) != 0) or (tilemap_get_at_pixel(collision,bbox_right + dx,bbox_bottom) != 0) {
		dx -= 1
	}
}
if (dx < 0) {
	// [CURRENTLY BREAKING MOVEMENT] dx += drag;
	while (tilemap_get_at_pixel(collision,bbox_left + dx,bbox_top) != 0) or (tilemap_get_at_pixel(collision,bbox_left + dx,bbox_bottom) != 0) {
		dx += 1
	}
}

x += dx

//y-axis collisions
if (dy > 0) {
	while (tilemap_get_at_pixel(collision,bbox_right,bbox_bottom + dy) != 0) or (tilemap_get_at_pixel(collision,bbox_left,bbox_bottom + dy) != 0) or (position_meeting(bbox_right,bbox_bottom+clamp(dy,-1000,1),objPlatform)) or (position_meeting(bbox_left,bbox_bottom+clamp(dy,-1000,1),objPlatform)) {
		dy -= 1
	}
}
if (dy < 0) {
	while (tilemap_get_at_pixel(collision,bbox_right,bbox_top + dy) != 0) or (tilemap_get_at_pixel(collision,bbox_left,bbox_top + dy) != 0) {
		dy += 1
	}
}

y += dy

//resetting impulse every frame so that it only applies once
if (rocketImpulseY < 0) {
	rocketImpulseY = 0
}

//adds a death counter
instance_create_depth(0,0,0,deathCounter);

//if (rocketImpulseX > 0){
//	rocketImpulseX = 0	
//}
show_debug_message("deaths:")
show_debug_message(global.deathCount)
show_debug_message("dy:")
show_debug_message(dy)
show_debug_message("dx:")
show_debug_message(dx)


