hlaunchSpeed*=0.9;
totalMass=(mass+myHead.mass+myLeg.mass+myRArm.mass+myLArm.mass);

if(myCross.x<x) image_xscale=-1; else image_xscale=1;

if(electricity>0)
{
    electricity-=1;
    if(electricity<0)
    {
        electricity=0;
    }
}
//-----------------------------------------------
//               Input Controls
//-----------------------------------------------


if(keyboard_check(ord("D")) && not keyboard_check(ord("A")))
{
    if(electricity>myLeg.electricity)
    {
        legspeed=myLeg.movespeed*(1-totalMass/64000-electricity/100);
    }
    else
    {
        legspeed=myLeg.movespeed*(1-totalMass/64000-myLeg.electricity/100);
        if(leghold <= 30)
        {
            leghold++;
           
        } else legspeed *= 1.5;
        
    }
}

if(keyboard_check(ord("A")) && not keyboard_check(ord("D")))
{
    if(electricity>myLeg.electricity)
    {
        legspeed=-myLeg.movespeed*(1-totalMass/64000-electricity/100);
    }
    else
    {
        legspeed=-myLeg.movespeed*(1-totalMass/64000-myLeg.electricity/100);
        if(leghold <= 30)
        {
            leghold++;
        } else legspeed *= 1.5;
    }
}

if((not keyboard_check((ord("D"))) && legspeed>=0) || (not keyboard_check((ord("A"))) && legspeed<=0) || (keyboard_check((ord("D"))) && keyboard_check((ord("A")))))
{
    if(collision_rectangle(bbox_left+1,y+24,bbox_right-1,y+24,obj_oil,0,1))
    {
        legspeed*=0.99;
    }
    else
    {
        legspeed*=0.6;
    }
    leghold = 0;
}
// if(keyboard_check_pressed(vk_space) && (collision_rectangle(bbox_left+1,y+24,bbox_right-1,y+24+vspeed,obj_block,0,1) || (collision_rectangle(bbox_left+1,y+24,bbox_right-1,y+24+vspeed,obj_floor,0,1) && not keyboard_check((ord("S"))))))
// if((gamepad_check_button_pressed(1,3) || gamepad_check_button_pressed(1,2)) && (collision_rectangle(bbox_left+1,y+24,bbox_right-1,y+24+vspeed,obj_block,0,1) || (collision_rectangle(bbox_left+1,y+24,bbox_right-1,y+24+vspeed,obj_floor,0,1) && not gamepad_check_button(1,14))))
if(keyboard_check_pressed(vk_space) && (collision_rectangle(bbox_left+1,y+24,bbox_right-1,y+24+vspeed,obj_block,0,1) || (collision_rectangle(bbox_left+1,y+24,bbox_right-1,y+24+vspeed,obj_floor,0,1))) && not keyboard_check(ord("S")))
{
    if(abs(-1*(myLeg.baseJump*(1-totalMass/64000)))>6)
    {
        jumpspeed=-1*(myLeg.baseJump*(1-totalMass/64000));
    }
    else
    {
        jumpspeed=-6;
    }
    vlaunchSpeed=0;
}
// if(keyboard_check_pressed(vk_space) && not collision_rectangle(bbox_left+1,y+24,bbox_right-1,y+24+vspeed,obj_wall,0,1) && myLeg.hover=1)
// if((gamepad_check_button_pressed(1,3) || gamepad_check_button_pressed(1,2)) && not collision_rectangle(bbox_left+1,y+24,bbox_right-1,y+24+vspeed,obj_wall,0,1) && myLeg.hover=1)
if (keyboard_check_pressed(vk_space) && not collision_rectangle(bbox_left+1,y+28,bbox_right-1,y+28+vspeed,obj_wall,0,1) && myLeg.hover=1)
{
    myLeg.hovering=1;
}
// if(keyboard_check_released(vk_space) && myLeg.hover=1)
// if((gamepad_check_button_released(1,3) || gamepad_check_button_released(1,2)) && myLeg.hover=1)
if(keyboard_check_released(vk_space) && myLeg.hover=1)
{
    myLeg.hovering=0;
}
if(myLeg.hover=1)
{
    if(myLeg.hovering=1)
    {
        if(myLeg.energy>0)
        {
            jumpspeed-=myLeg.baseHover*(1-totalMass/64000);
            myLeg.energy-=myLeg.energyCost;
            if(myLeg.energy<0)
            {
                myLeg.energy=0;
            }
            
            // Flameboots Hover
            if(legChoice[player-1]=2)
            {
                i=instance_create(x-4+random(8),y+23,obj_fire);
                i.direction=270+random(10)+hspeed;
                i.image_xscale=0.5;
                i.image_yscale=0.5;
                i.temperature=800;
                i.speed=10;
            }
            
            // Turtleboots Groundpound
            if(legChoice[player-1]=3)
            {
                jumpspeed=10;
                i=instance_create(x-4+random(8),y+23,obj_slam);
                i.attached=myLeg;
                i.image_alpha=0.5;
                i.direction=270;
                i.image_angle=i.direction;
                i.image_xscale=1.3;
                i.image_yscale=1.3;
                i.team=team; //Stops from shooting self
                i.temperature=4200;
                i.attack=1;
            }
        }
    }
}
if(vlaunchSpeed>=abs(jumpspeed))
{
    vlaunchSpeed-=abs(jumpspeed);
    jumpspeed=0;
}
// if(keyboard_check_released(vk_space) && jumpspeed<0)
// if((gamepad_check_button_pressed(1,3) || gamepad_check_button_pressed(1,2)) && jumpspeed<0)
if(keyboard_check_released(vk_space) && jumpspeed<0)
{
    if(vlaunchSpeed>0 && vlaunchSpeed<abs(jumpspeed))
    {
        vlaunchSpeed=0;
        jumpspeed=0;
    }
}
hspeed=legspeed+hlaunchSpeed;

// Speed limiter to prevent moving through walls
if(hspeed>30)
{
    hspeed=30;
}
if(hspeed<-30)
{
    hspeed=-30;
}
vspeed=jumpspeed+vlaunchSpeed;

// Speed limiter to prevent falling through blocks
if(vspeed>30)
{
    vspeed=30;
}
if(vspeed<-30)
{
    vspeed=-30;
}

// ---------------- Self Destruct -----------------

if(keyboard_check(ord("R")) && hp>0)
{
    selfDestruct+=1;
    if(selfDestruct mod 5 = 0)
    {
        image_blend=c_red;
        sound_play(snd_warning);
    }
    if(selfDestruct >= 80)
    {
        selfDestruct=100;
        hp=0;
    }
}

// Cancel self destruct on key release
if((keyboard_check_released(ord("R"))) && hp>0)
{
    selfDestruct=0;
}

// Self destruct explosion
if(selfDestruct>80 && hp=0)
{
    if(screenShake<=selfDestruct-80)
    {
        screenShake=selfDestruct-80;
    }
    repeat(16)
    {
        i=instance_create(x,y,obj_fire);
        i.direction=random(360);
        i.speed=10;
        i.temperature=random_range(800,1600);
    }
    i=instance_create(x+random_range(-64,64),y+random_range(-64,64),obj_basicBullet);
    i.speed=0;
    i.attack=25;
    i.temperature=2000;
    i.image_xscale=3;
    i.image_yscale=3;
    i.team=team;
    i.alarm[0]=1;
    selfDestruct-=1;
    sound_play(snd_hit1);
}
//-----------------------------------------------
//               Collision
//-----------------------------------------------
// if((collision_rectangle(bbox_left+1,y+24,bbox_right-1,y+24+vspeed,obj_block,0,1) || (collision_rectangle(bbox_left+1,y+24,bbox_right-1,y+24+vspeed,obj_floor,0,1) && not keyboard_check((ord("S"))))) && vspeed>0)
// if((collision_rectangle(bbox_left+1,y+24,bbox_right-1,y+24+vspeed,obj_block,0,1) || (collision_rectangle(bbox_left+1,y+24,bbox_right-1,y+24+vspeed,obj_floor,0,1) && not gamepad_check_button(1,14))) && vspeed>0)
if ((collision_rectangle(bbox_left+1,y+24,bbox_right-1,y+24+vspeed,obj_block,0,1) || (collision_rectangle(bbox_left+1,y+24,bbox_right-1,y+24+vspeed,obj_floor,0,1) && not keyboard_check(ord("S"))))  && vspeed>0)
{
    with(collision_rectangle(bbox_left+1,y+24,bbox_right-1,y+24+vspeed,obj_wall,0,1))
    {
        other.y=y-24;
    }
    if(myCross.x<x)
    {
        myLeg.image_speed=-0.2*hspeed;
        myBackLeg.image_speed=-0.2*hspeed;        
    }
    else
    {
        myLeg.image_speed=0.2*hspeed;
        myBackLeg.image_speed=0.2*hspeed;
    }
    vspeed=0;
    vlaunchSpeed*=0.75;
    if(myLeg.hover=1)
    {
        myLeg.hovering=0;
        myLeg.energy=myLeg.energyMax;
    }
}
else
{
    myLeg.image_speed=0;
    myBackLeg.image_speed=0;
    vlaunchSpeed+=0.5;
}
if(collision_rectangle(bbox_right,y+23,bbox_right+hspeed,myHead.bbox_top+1,obj_block,0,1))
{
    if(hspeed>0)
    {
        with(collision_rectangle(bbox_right,y+23,bbox_right+hspeed,myHead.bbox_top+1,obj_block,0,1))
        {
            other.x+=bbox_left-other.bbox_right;
        }
        hspeed=0;
    }
}
if(collision_rectangle(bbox_left+hspeed,y+23,bbox_left,myHead.bbox_top+1,obj_block,0,1))
{
    if(hspeed<0)
    {
        with(collision_rectangle(bbox_left+hspeed,y+23,bbox_left,myHead.bbox_top+1,obj_block,0,1))
        {
            other.x+=bbox_right-other.bbox_left;
        }
        hspeed=0;
    }
}
if(collision_rectangle(bbox_left+1,myHead.bbox_top,bbox_right-1,myHead.bbox_top+vspeed,obj_block,0,1) && vspeed<0)
{
    with(collision_rectangle(bbox_left+1,myHead.bbox_top,bbox_right-1,myHead.bbox_top+vspeed,obj_block,0,1))
    {
        other.y+=bbox_bottom-other.myHead.bbox_top;
    }
    vspeed=0;
    vlaunchSpeed+=2;
}
