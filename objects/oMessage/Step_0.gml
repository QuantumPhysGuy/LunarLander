if (keyboard_check_pressed(vk_enter))
{
	if (image_index = 0)
	{
		if (room_exists(room_next(room)))
		{
			room_goto_next();	
		}
		else
		{
			room_goto(room_first);
		}
	}
	else
	{
		room_goto(room_first);
	}
}