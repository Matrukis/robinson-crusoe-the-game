//pega os inputs do player
	rightkey = keyboard_check(ord("D"));
	leftkey = keyboard_check(ord("A"));
	upkey = keyboard_check(ord("W"));
	downkey = keyboard_check(ord("S"));
	equipKey = keyboard_check_pressed(ord("2"));
	unequipKey = keyboard_check_pressed(ord("1"));
	shootkey = mouse_check_button(mb_left)
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
	
//sprite control
#region

if (weapon != noone)
{
    // Armado: olha para o mouse
    aimDir = point_direction(x, centerY, mouse_x, mouse_y);

    face = round(aimDir / 90);

    if (face == 4)
        face = 0;
}
else
{
    // Desarmado: olha para a direção que está andando
    if (_horizKey != 0 || _vertKey != 0)
    {
        if (abs(_horizKey) > abs(_vertKey))
        {
            face = (_horizKey > 0) ? 0 : 2;
        }
        else
        {
            face = (_vertKey > 0) ? 3 : 1;
        }
    }
}

//animação
if (xspd == 0 && yspd == 0)
{
    image_index = 0;
}
	
	if xspd == 0 && yspd == 0
	{
		image_index = 0;
	}
	
	//colocar o sprite do player
	// Escolhe os sprites conforme a arma equipada
if (weapon == noone)
{
    sprite_index = spriteNormal[face];
}
else
{
    sprite_index = spriteArmed[face];
}
#endregion
// Equipar / desequipar
if (unequipKey)
{
    weapon = noone;
}

if (equipKey)
{
    weapon = trabuco;
}

// Atirar
if (weapon != noone)
{
    if (shootTimer > 0)
        shootTimer--;

    if (shootkey && shootTimer <= 0)
    {
        shootTimer = weapon.cooldown;

        var _xoffset = lengthdir_x(weapon.length + weaponOffsetDist, aimDir);
        var _yoffset = lengthdir_y(weapon.length + weaponOffsetDist, aimDir);

        var _bulletInst = instance_create_depth(
            x + 4 + _xoffset,
            centerY - 2 + _yoffset,
            depth - 100,
            weapon.bulletobj
        );

        with (_bulletInst)
        {
            dir = other.aimDir;
        }
    }
}

