if (canOperate)
{
	if (vspeed > 8)
	{
		vspeed = 8;
	}
	
	if (fuel <= 25)
	{
		if (!audio_is_playing(Alarm))
		{
			audio_play_sound(Alarm, 1, true)
		}
	}
	else
	{
		if (audio_is_playing(Alarm))
		{
			audio_stop_sound(Alarm);
		}
	}
	
	if (keyboard_check(vk_up) || keyboard_check(vk_left) || keyboard_check(vk_right))
	{
		if (!audio_is_playing(Thrust))
		{
			audio_play_sound(Thrust, 1, false);
		}
	}
	else
	{
		if (audio_is_playing(Thrust))
		{
			audio_stop_sound(Thrust);
		}
	}
	
	if (keyboard_check(vk_up))
	{
		if (vspeed > -8)
		{
			vspeed -= 0.2;
		}
		
		fuel -= 0.2;
		
		part_type_direction(fire, 270, 270, 0, 0);
		part_emitter_region(partSys, emitter, 
				x + lengthdir_x(bottomLenX, image_angle) - lengthdir_y(bottomLenY, image_angle),
				x + lengthdir_x(bottomLenX, image_angle) - lengthdir_y(bottomLenY, image_angle),
				y + lengthdir_y(bottomLenX, image_angle) + lengthdir_x(bottomLenY, image_angle),
				y + lengthdir_y(bottomLenX, image_angle) + lengthdir_x(bottomLenY, image_angle),
				ps_shape_line,
				ps_distr_linear);
				
		part_emitter_burst(partSys, emitter, fire, 15);
	}
	
	if (keyboard_check(vk_left))
	{
		if (hspeed < 5)
		{
			hspeed += 0.1;
		}
		
		if (image_angle < 5)
		{
			image_angle += 1;
		}
		
		fuel -= 0.1;
		
		part_type_direction(fire, 180, 180, 0, 0);
		part_emitter_region(partSys, emitter, 
				x + lengthdir_x(LeftLenX, image_angle) - lengthdir_y(LeftLenY, image_angle),
				x + lengthdir_x(LeftLenX, image_angle) - lengthdir_y(LeftLenY, image_angle),
				y + lengthdir_y(LeftLenX, image_angle) + lengthdir_x(LeftLenY, image_angle),
				y + lengthdir_y(LeftLenX, image_angle) + lengthdir_x(LeftLenY, image_angle),
				ps_shape_line,
				ps_distr_linear);
				
		part_emitter_burst(partSys, emitter, fire, 15);
	}
	
	if (keyboard_check(vk_right))
	{
		if (hspeed > -5)
		{
			hspeed -= 0.1;
		}
		
		if (image_angle > -5)
		{
			image_angle -= 1;
		}
		
		fuel -= 0.1;
		
		part_type_direction(fire, 0, 0, 0, 0);
		part_emitter_region(partSys, emitter, 
				x + lengthdir_x(RightLenX, image_angle) - lengthdir_y(RightLenY, image_angle),
				x + lengthdir_x(RightLenX, image_angle) - lengthdir_y(RightLenY, image_angle),
				y + lengthdir_y(RightLenX, image_angle) + lengthdir_x(RightLenY, image_angle),
				y + lengthdir_y(RightLenX, image_angle) + lengthdir_x(RightLenY, image_angle),
				ps_shape_line,
				ps_distr_linear);
				
		part_emitter_burst(partSys, emitter, fire, 15);
	}
	
	if (!keyboard_check(vk_left))
	{
		if (image_angle < 0)
		{
			image_angle += 0.05;
		}
	}
	
	if (!keyboard_check(vk_right))
	{
		if (image_angle > 0)
		{
			image_angle -= 0.05;
		}
	}
	
	x = clamp(x, 15, room_width);
	y = clamp(y, 15, room_height);
}

if (fuel <= 0)
{
	fuel = 0;
	canOperate = false;
}