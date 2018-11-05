if(screenShake>0)
{
    view_xview[view_current]=view_xview[view_current]+random_range(-screenShake*0.4,screenShake*0.4);
    view_yview[view_current]=view_yview[view_current]+random_range(-screenShake*0.4,screenShake*0.4);
    attached.screenShake-=1;
    
    x+=choose(-attached.screenShake,attached.screenShake);
    y+=choose(-attached.screenShake,attached.screenShake);
}
if(screenShake=0)
{
    screen_shake = 0;
    if (view_xview[0] < 0 || view_xview[0] > 0 || view_yview[0] < 0 || view_yview[0] > 0)
    {
    repeat (8)
        {
            if (view_xview[0] < 0) {view_xview[0] += 1;} if (view_xview[0] > 0) {view_xview[0] -= 1;}
            if (view_yview[0] < 0) {view_yview[0] += 1;} if (view_yview[0] > 0) {view_yview[0] -= 1;}
        }
    }
}
