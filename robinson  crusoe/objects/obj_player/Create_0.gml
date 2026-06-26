//variaveis pra movimento
moveDir = 0;
moveSpd = 2;
xspd = 0;
yspd = 0;

//sprite control
centerYOffset = -16;
centerY = y + centerYOffset;

weaponOffsetDist = 4;
aimDir = 0;

face = 3;

// Sprites desarmado
spriteNormal = [];
spriteNormal[0] = spr_playerRight;
spriteNormal[1] = spr_playerUp;
spriteNormal[2] = spr_playerLeft;
spriteNormal[3] = spr_playerDown;

// Sprites armado
spriteArmed = [];
spriteArmed[0] = spr_playerRightArma;
spriteArmed[1] = spr_playerUpArma;
spriteArmed[2] = spr_playerLeftArma;
spriteArmed[3] = spr_playerDownArma;

//informacao da arma
shootTimer = 0;

bulletobj = obj_bullet;

trabuco =
{
    sprite : spr_gun,
    length : sprite_get_bbox_right(spr_gun) - sprite_get_xoffset(spr_gun),
    bulletobj : obj_bullet,
    cooldown : 9,
}

machadao =
{
}

weapon = trabuco;