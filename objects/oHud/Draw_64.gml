draw_set_color(make_color_rgb(255,255,255));
draw_set_font(fntHUD);

draw_text(x, y, global.roomNames[? room]);
draw_text(x, y + 30, "Speed: " + string(oPlayer.speed));

if (oPlayer.fuel <= 25)
{
	draw_set_color(c_red);
}

draw_text(x, y + 60, "Fuel: " + string(oPlayer.fuel) + "%");