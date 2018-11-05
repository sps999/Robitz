
    /* Material determines the following variables:
    
    Hardness: determines the Defensice Value
        -
    Melting Point: determines temperature at which a meltdown occurs
        -
    Thermal Conductivity: determines the rate of exchange of Heat
        -
    Density: determines the Mass of the body part
        -kg/m^3
    Conductivity: determines the effectiveness of electricity
        - Electricity effects the body part of highest conductivity
        -
    Magnetivity: determines the effectiveness of magnets (Negative values result in repulsion) 
        - The Net Sum of Megnetism controls the effect magnetic fields have
        -
    
-------------------------------------------------------------------------------------        
        
    Magnesium - 12 (260, 650, 160, 1738, 23)
        Hardness: 260
        Melting Point: 650
        Thermal Conductivity: 160
        Density: 1738
        Conductivity: 23    
        
    Aluminium - 13 (245, 660, 235, 2700, 38)
        Hardness: 245
        Melting Point: 660
        Thermal Conductivity: 235
        Density: 2700
        Conductivity: 38
        
    Titanium - 22 (716, 1668, 22, 4507, 2.5)
        Hardness: 716
        Melting Point: 1668
        Thermal Conductivity: 22
        Density: 4507
        Conductivity: 2.5        
        
    Chromium - 24 (1120, 1907, 94, 7140, 7.9)
        Hardness: 1120
        Melting Point: 1907
        Thermal Conductivity: 94
        Density: 7140
        Conductivity: 7.9
        
    Iron - 26 (490, 1538, 80, 7874, 10)
        Hardness: 490
        Melting Point: 1538
        Thermal Conductivity: 80
        Density: 7874
        Conductivity: 10
        
    Nickel - 28 (700, 1455, 91, 8908, 14)
        Hardness: 700
        Melting Point: 1455
        Thermal Conductivity: 91
        Density: 8908
        Conductivity: 14
        
    Copper - 29 (874, 1085, 400, 8920, 59)
        Hardness: 874
        Melting Point: 1085
        Thermal Conductivity: 400
        Density: 8920
        Conductivity: 59
        
    Zinc - 30 (412, 420, 120, 7140, 17)
        Hardness: 412
        Melting Point: 420
        Thermal Conductivity: 120
        Density: 7140
        Conductivity: 17
        
    */
    
if (argument0=12) //Magnesium 12
{
    hardness=22;
    meltingPoint=350;
    heatResist=160;
    density=1738;
    conductivity=23;
    c_material=c_magnesium; //make_color_rgb(96,128,128);
}
if (argument0=13) //Aluminum 13
{
    hardness=21;
    meltingPoint=353;
    heatResist=235;
    density=2700;
    conductivity=38;
    c_material=c_aluminum; //make_color_rgb(192,192,224);
}
if (argument0=22) //Titanium 22
{
    hardness=37;
    meltingPoint=363;
    heatResist=22;
    density=4507;
    conductivity=2.5;
    c_material=c_titanium; //make_color_rgb(224,192,160);
}
if (argument0=24) //Chromium 24
{
    hardness=50;
    meltingPoint=769;
    heatResist=94;
    density=7140;
    conductivity=8;
    c_material=c_chromium; //make_color_rgb(192,224,224);
}
if (argument0=26) //Iron 26
{
    hardness=29;
    meltingPoint=646;
    heatResist=80;
    density=7874;
    conductivity=10;
    c_material=c_iron; //make_color_rgb(96,96,96);
}
if (argument0=28) //Nickel 28
{
    hardness=36;
    meltingPoint=618;
    heatResist=91;
    density=8908;
    conductivity=14;
    c_material=c_nickel; //make_color_rgb(96,128,96);
}
if (argument0=29) //Copper 29
{
    hardness=43;
    meltingPoint=495;
    heatResist=400;
    density=8920;
    conductivity=59;
    c_material=c_copper; //make_color_rgb(192,128,96);
}
if (argument0=30) //Zinc 30
{
    hardness=27;
    meltingPoint=273;
    heatResist=120;
    density=7140;
    conductivity=17;
    c_material=c_zinc; //make_color_rgb(160,224,255);
}
