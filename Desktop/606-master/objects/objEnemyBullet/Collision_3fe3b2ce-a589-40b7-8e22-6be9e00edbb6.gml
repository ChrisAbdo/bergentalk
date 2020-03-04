sprite_index = sprExplode
audio_play_sound(soundRocketExplode,0,false);
global.lifetimeScore += 100;
timer += 1
if timer == 2 {
	//kill the rocket
	instance_destroy(id)
}

