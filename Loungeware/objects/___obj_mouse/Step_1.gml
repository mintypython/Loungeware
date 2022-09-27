x = mouse_x;
y = mouse_y;

moving = x != xprevious || y != yprevious;

if (instance_exists(___MG_MNGR) && ___MG_MNGR.state == "playing_microgame") {
	menu_state = normal;
}
else {
	menu_state();
}