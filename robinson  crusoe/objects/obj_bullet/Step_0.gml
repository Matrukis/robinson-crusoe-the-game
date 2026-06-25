xspd =  lengthdir_x(spd, dir);
yspd = lengthdir_y(spd, dir);

	x += xspd;
	y += yspd;
	
//limpeza
	//destruir
	if destroy == true
	{
		
		instance_destroy();
	}
	//colisao
	if place_meeting(x, y, obj_solid_wall)
	{
		destroy=true;
	}
	
	//bala fora do range
	if point_distance(xstart, ystart, x, y) > maxDist
	{
		destroy	= true;
	}
	