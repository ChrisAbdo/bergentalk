if (tilemap_get_at_pixel(collision,x,y) != 0) or place_meeting(x,y,objPlatform) {
	//make the rocket explode
	sprite_index = sprExplode
	var impulseX = 0;
	timer += 1
	if timer == 2 {
		//explosion jump calculation
		if (distance_to_object(objPlayer) < explosionRadius){
			//velocity equations:
			// v = d / |d|^2
			// velocity is the same vector as the distance vector, scaled for distance
			//horizontal velocity calculation
			//impulseX += round(((objPlayer.x - x) / (distance_to_object(objPlayer))));
			if ((objPlayer.x - x) > 0) {
				impulseX = 10;	
			}
			else if ((objPlayer.x - x) < 0) {
				impulseX = -10;	
			}
			objPlayer.rocketImpulseX += impulseX
			show_debug_message(objPlayer.rocketImpulseX)
			//vertical velocity calculation
			objPlayer.rocketImpulseY -= 10 //round(((objPlayer.y - y) / (distance_to_object(objPlayer))));	
		}
		//kill the rocket
		instance_destroy(id)
	}
}

if sprite_index = sprExplode {
	timer2 +=1
	if timer2 = 3 {
		instance_destroy(id)	
	}
}