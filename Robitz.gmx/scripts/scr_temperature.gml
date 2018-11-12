/// Temperature

if(hp>0)
{
    temperature+=(-0.05/heatResist)*(temperature-roomTemp);
    if(temperature >= 0)
    {
        image_blend=merge_color(c_material,c_red,(temperature/meltingPoint));
        frost = 1;
    }
    else
    {
        image_blend=merge_color(c_material,c_teal,(temperature/freezingPoint));
        frost = 1-(0.8*(temperature/freezingPoint));
    }
    
    // Overheating
    if(temperature>meltingPoint)
    {
        image_blend=c_red;
        if(hp>0)
        {
            if(depth<0)
            {
                effect_create_above(ef_smokeup,bbox_left+random(bbox_right-bbox_left),bbox_top+random(bbox_bottom-bbox_top),0.05,c_white);
            } else effect_create_below(ef_smokeup,bbox_left+random(bbox_right-bbox_left),bbox_top+random(bbox_bottom-bbox_top),0.05,c_white);
            hp-=0.1*(1+temperature/meltingPoint);
            temperature-=0.1*(1+temperature/meltingPoint);
            if(!sound_isplaying(snd_warning) && team!=0)
            {
                sound_play(snd_warning);
            }
        }
    }
    
    // Freezing
    if(temperature<freezingPoint)
    {
        image_blend=c_teal;
        frost=0.2;
        if(hp>0)
        {
            temperature+=0.1*(1+temperature/freezingPoint);
        }
    }
    
    // Heat from attached object effects this part
    // Used for Head, Legs, Arm
    if (argument0=1)
    {
        if(attached.hp>0)
        {
            temperature+=(-0.1/heatResist)*(temperature-attached.temperature);
        }
    }
    // Body temperature effected by Head, Arms, Legs
    // Used by Body
    if (argument0=2)
    {
        if(myHead.hp>0)
        {
            temperature+=(-0.02/heatResist)*(temperature-myHead.temperature);
        }
        if(myRArm.hp>0)
        {
            temperature+=(-0.02/heatResist)*(temperature-myRArm.temperature);
        }
        if(myLArm.hp>0)
        {
            temperature+=(-0.02/heatResist)*(temperature-myLArm.temperature);
        }
        if(myLeg.hp>0)
        {
            temperature+=(-0.02/heatResist)*(temperature-myLeg.temperature);
        }
    }
} else temperature=0;
