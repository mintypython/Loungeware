x = lerp(0, window_get_width(), pos_x);
y = lerp(0, window_get_height(), pos_y);

draw_set_color(c_red);
draw_circle(x, y, radius * ___MG_MNGR.window_scale, false);