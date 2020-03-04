//phys for bullets
bullet = instance_create_depth(x, y,-10000, objBullet);
bullet.direction = image_angle;
bullet.image_angle = image_angle;
bullet.speed = 10;

//play sound
audio_play_sound(soundRocketFire,0,false);