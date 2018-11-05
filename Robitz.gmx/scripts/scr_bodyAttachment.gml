//Determines offset and angle of attached body part.

//argument0 = X Offset
//argument1 = Y Offset (should be a negative value)

if(attached.myCross.x<attached.x-argument0)
{
    x = attached.x - argument0;
    image_xscale=-1;
}
else
{
    x = attached.x + argument0;
    image_xscale=1;
}
y = attached.y + argument1;
