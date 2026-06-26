//variaveis pra movimento
	moveDir = 0;
	moveSpd = 2;
	xspd = 0;
	yspd = 0;

//sprite control
	centerYOffset = -16;
	centerY = y + centerYOffset;//botar no evento step

	weaponOffsetDist = 4;
	aimDir = 0;

	face = 3;
	sprite[0] = spr_playerRight;
	sprite[1] = spr_playerUp;
	sprite[2] = spr_playerLeft;
	sprite[3] = spr_playerDown;


//informacao da arma
	shootTimer = 0;
	
	bulletobj = obj_bullet;
	
	trabuco = {
		sprite : spr_gun, 
		length : sprite_get_bbox_right(spr_gun)  - sprite_get_xoffset(spr_gun),
		bulletobj : obj_bullet,
		cooldown : 9,
	}
	
	machadao = {
	}
	
	weapon = trabuco;
	