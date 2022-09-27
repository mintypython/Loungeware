held = {
	"primary": false,
	"secondary": false,
	"right": false,
	"up": false,
	"left": false,
	"down": false
};

pressed = {
	"primary": false,
	"secondary": false,
	"right": false,
	"up": false,
	"left": false,
	"down": false
};

released = {
	"primary": false,
	"secondary": false,
	"right": false,
	"up": false,
	"left": false,
	"down": false
};

swipe_x = 0;
swipe_y = 0;

presspoint_x = 0;
presspoint_y = 0;

moving = false;

normal = function() {
	held[$ "primary"] = mouse_check_button(mb_left);
	pressed[$ "primary"] = false;
	
	
	held[$ "secondary"] = mouse_check_button(mb_right);
	pressed[$ "secondary"] = mouse_check_button_released(mb_right);
	
	held[$ "right"] = false;
	held[$ "up"] = false;
	held[$ "left"] = false;
	held[$ "down"] = false;
	
	pressed[$ "right"] = false;
	pressed[$ "up"] = false;
	pressed[$ "left"] = false;
	pressed[$ "down"] = false;
	
	released[$ "right"] = false;
	released[$ "up"] = false;
	released[$ "left"] = false;
	released[$ "down"] = false;
	
	
	if (mouse_check_button_pressed(mb_left)) {
		presspoint_x = x;
		presspoint_y = y;
		menu_state = press;
	}
}

press = function() {
	if (mouse_check_button_released(mb_left)) {
		pressed[$ "primary"] = true;
		menu_state = normal;
	}
	else if (point_distance(presspoint_x, presspoint_y, x, y) > 10) {
		held[$ "primary"] = false;
		held[$ "secondary"] = false;
		pressed[$ "primary"] = false;
		pressed[$ "secondary"] = false;
		menu_state = swipe;
	}
}

swipe = function() {
	swipe_x = x - presspoint_x;
	swipe_y = y - presspoint_y;
	if (mouse_check_button_released(mb_left)) {
		swipe_x = 0;
		swipe_y = 0;
		menu_state = normal;
	}
}

menu_state = normal;

spawn_buttons = function() {
	primary = instance_create_depth(0, 0, -100, ___obj_mouse_button);
	primary.pos_x = 0.8556;
	primary.pos_y = 0.6819;
	
	secondary = instance_create_depth(0, 0, -100, ___obj_mouse_button);
	secondary.pos_x = 0.7535;
	secondary.pos_y = 0.7675;
	
	right = instance_create_depth(0, 0, -100, ___obj_mouse_button);
	right.pos_x = 0.25;
	right.pos_y = 0.25;
	
	up = instance_create_depth(0, 0, -100, ___obj_mouse_button);
	up.pos_x = 0.1901;
	up.pos_y = 0.6697;
	
	left = instance_create_depth(0, 0, -100, ___obj_mouse_button);
	left.pos_x = 0.25;
	left.pos_y = 0.25;
	
	down = instance_create_depth(0, 0, -100, ___obj_mouse_button);
	down.pos_x = 0.25;
	down.pos_y = 0.25;
}