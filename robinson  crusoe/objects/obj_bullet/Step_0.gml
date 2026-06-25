xspd =  lengthdir_x(spd, dir);
yspd = lengthdir_y(spd, dir);

	x += xspd;
	y += yspd;
		
	//colisao
	if place_meeting(x, y, obj_solid_wall)
	{
		instance_destroy();
	}