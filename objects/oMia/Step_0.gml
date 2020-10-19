/// @description Insert description here
// You can write your code in this editor
if(y > 500) {
	
	var temp = surface_create(display_get_width(), display_get_height());
	surface_set_target(temp);
	draw_surface(application_surface, 0, 0);
	surface_reset_target();
	instance_deactivate_all(false);
	with (instance_create_layer(x, y, "Managers", oGameOverManager)) {
		surf = temp;
	}
	instance_destroy();
	exit;
}
var playerTryingToJump	=	oControls.jump;
var playerHoldingJump	=	oControls.jumpHeld;

if(vsp <= 0 && vsp >= -1 && grounded == false && !alarm[0]) {
	alarm[0] = 1;
	myGravity = 0.2;
}

vsp += myGravity;

if(grounded == false) {
	if(coyote_counter > 0) {
		coyote_counter--;
		if(jumped == false) {
			if(playerTryingToJump) {
				buffer_counter = buffer_max;
			}
		}
	}
}
else {
	jumped = false;
	coyote_counter = coyote_max;
}


if(playerTryingToJump) {
	buffer_counter = buffer_max;
}

if(buffer_counter > 0) {
	buffer_counter--;
	if(place_meeting(x, y+1, oGround)) {
		vsp = jumpHeight;
		vsp_f = 0;
		buffer_counter = 0;
		jumped = true;
	}
}
vsp += vsp_f;
vsp_f	=		vsp - (floor(abs(vsp)) * sign(vsp));
vsp		-=		vsp_f;

vsp = min(vsp, vsp_max);

if(vsp < 0 && !playerHoldingJump) {
	vsp = max(vsp, -2);
}



if(place_meeting(x, y+vsp, oGround) && grounded == false) {
	while(!place_meeting(x, y+sign(vsp), oGround)) {
		y = y + sign(vsp);
	}
	vsp = 0;
	grounded = true;
}
else {
	grounded = false;
}

y += vsp;

if(grounded == true && y > 326) y = 326;

if(place_meeting(x, y+1, oGround)) {
	sprite_index = sMiaNew;
}
else {
	if(vsp < 0) {
		sprite_index = sMiaUp;
	}
	else {
		sprite_index = sMiaDown;
	}
}