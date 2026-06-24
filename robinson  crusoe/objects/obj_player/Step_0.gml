//pega os inputs do player
	rightkey = keyboard_check(ord("D"));
	leftkey = keyboard_check(ord("A"));
	upkey = keyboard_check(ord("W"));
	downkey = keyboard_check(ord("S"));


//movimento do player
#region
	//pega a direção
	var _horizKey = rightkey - leftkey;
	var _vertKey = downkey - upkey;
	moveDir = point_direction(0, 0, _horizKey, _vertKey);
	
	//pega a velocidade do x e do y 
	var _spd =0;
	var _inputLevel = point_distance(0,0, _horizKey,_vertKey);
	_inputLevel = clamp(_inputLevel, 0, 1);
	_spd = moveSpd * _inputLevel;
	
	
	xspd = lengthdir_x(_spd, moveDir);
	yspd = lengthdir_y(_spd, moveDir);
	
	//colisão
	
	if place_meeting( x +  xspd, y, obj_solid_wall )
	{
		xspd = 0;
	}
	
	if place_meeting( x, y + yspd, obj_solid_wall )
	{
		yspd = 0
	}
	
	//mover o jogador
	x += xspd;
	y += yspd;
	
	depth = -bbox_bottom;
#endregion

//mira do player
	centerY = y + centerYOffset;
	
	//mira
	aimDir = point_direction(x, centerY, mouse_x, mouse_y);

//sprite control
#region
	//tendo certeza que o player olhe para a direção certa
	face = round(aimDir/90);
	
	if face == 4 { face = 0;};
	
	//animação
	
	if xspd == 0 && yspd == 0
	{
		image_index = 0;
	}
	
	//colocar o sprite do player
	mask_index = sprite[3];
	sprite_index = sprite[face]
#endregion