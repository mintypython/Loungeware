function ___mouse_select_list(list, x, y, w, h) {
	if (!___obj_mouse.pressed[$ "primary"])
		return -1;
	
	var length = array_length(list);
	for (var i = 0; i < length; i++) {
		if (point_in_rectangle(___obj_mouse.x, ___obj_mouse.y,
			x, y + i * h, x + w, y + (i + 1) * h))
				return i;
	}
	return -1;
}