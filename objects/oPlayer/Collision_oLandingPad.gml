if (part_system_exists(partSys))
{
	part_system_destroy(partSys);
}

if (speed > 5)
{
	with (instance_create_layer(0, 0, "Messages", oMessage))
	{
		image_index = 1;
	}
	
	audio_play_sound(Lose, 1, false);
}
else
{
	with (instance_create_layer(0, 0, "Messages", oMessage))
	{
		image_index = 0;
	}
	
	if (speed > 0 || gravity > 0)
	{
		audio_play_sound(Win, 1, false);
	}
}

gravity = 0;
vspeed = 0;
hspeed = 0;
canOperate = false;