function display_write_all_specs(_x, _y) {
	var _str="";
	_str+="FPS = " + string(fps) + "\n";
	if(instance_exists(oCat)) {
		_str+="x = " + string(oCat.x) + "\n";
		_str+="y = " + string(oCat.y) + "\n";
		_str+="vsp = " + string(oCat.vsp) + "\n";
		_str+="grounded = " + ((oCat.grounded) ? "true" : "false") + "\n";
		_str+="buffer_counter = " + string(oCat.buffer_counter) + "\n";
		_str+="myGravity = " + string(oCat.myGravity) + "\n";
	}

	outlinedText(_x, _y, c_black, c_white, _str)
}

function display_write_spec() {

	enum display{Screen, Window, Gui, AppSurface, View};
	var str="";
	switch(argument[0])
	{
	  case display.Screen:
	    str="Display: "+string(display_get_width())+" x "+string(display_get_height())+" ("+string(display_get_width()/display_get_height())+")";
	  break;
	  case display.Window:
	    str="Window: "+string(window_get_width())+" x "+string(window_get_height())+" ("+string(window_get_width()/window_get_height())+")";
	  break;
	  case display.Gui:
	    str="GUI: "+string(display_get_gui_width())+" x "+string(display_get_gui_height())+" ("+string(display_get_gui_width()/display_get_gui_height())+")";
	  break;
	  case display.AppSurface:
	    str="App Surface: "+string(surface_get_width(application_surface))+" x "+string(surface_get_height(application_surface))+" ("+string(surface_get_width(application_surface)/surface_get_height(application_surface))+")";
	  break;
	  case display.View:
	    str="View: "+string(camera_get_view_width(view_camera[0]))+" x "+string(camera_get_view_height(view_camera[0]))+" ("+string(camera_get_view_width(view_camera[0])/camera_get_view_height(view_camera[0]))+")";
	 break;
	}
	return str;


}