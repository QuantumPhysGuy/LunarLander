if (part_system_exists(partSys))
{
	part_system_destroy(partSys);
}

with (instance_create_layer(0, 0, "Messages", oMessage))
{
	image_index = 2;
}

if (speed > 0)
{
	audio_play_sound(Lose, 1, false);
}

gravity = 0;
vspeed = 0;
hspeed = 0;
canOperate = false;