if (weapon != noone)
{
    if (aimDir >= 0 && aimDir < 180)
    {
        draw_my_weapon();
    }
}

draw_self();

if (weapon != noone)
{
    if (aimDir >= 180 && aimDir < 360)
    {
        draw_my_weapon();
    }
}