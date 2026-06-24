//draw the weapon behind the player
	if aimDir >= 0 && aimDir < 180
	{
		draw_my_weapon();
	}
//desenha o player
draw_self();	

//desenhar a arma
	if aimDir >= 180 && aimDir < 360
	{
		draw_my_weapon();
	}