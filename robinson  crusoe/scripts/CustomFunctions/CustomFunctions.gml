//desenhar a arma do player
function draw_my_weapon()
{
	//desenha a arma
	//pega a arma fora do corpo do player
	var _xOffset = lengthdir_x(weaponOffsetDist, aimDir);
	var _yOffset = lengthdir_y(weaponOffsetDist, aimDir);

	//flipa a arma pro lado certo
	var _weaponYscl =1;
	if aimDir > 90 &&  aimDir < 270
	{
		_weaponYscl = -1;
	}

	draw_sprite_ext(spr_gun, 0, x + _xOffset, centerY + _yOffset, 1,_weaponYscl, aimDir,c_white, 1);
	
}