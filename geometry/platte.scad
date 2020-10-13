//
// raimund-the-juicer
//
// platte common part
//
// Copyright (c) 2020 Michael Binz
//

use <drilling.scad>

platte();

/*
 * @param l=60 Length in x direction.
 * @param w=40 Width in y direction.
 * @param s=2 Thickness in z direction.
 * @param drilling=6 Drilling diameter.
 */
module platte(
    l=60,
    w=40,
    s=2,
    drilling=6
)
{
    cornerRadius = 5;
    length = l;
    width = w;
    height = s;
    
    circleDiameter = 2*cornerRadius;
    h = height /2;

    difference() {
        hull() 
        {
            tlLen = (length/2) - cornerRadius;
            tlWid = (width/2) - cornerRadius;
            
            translate([tlLen,tlWid,h]) 
                cylinder(d=circleDiameter, h=height, center=true);
            translate([tlLen,-tlWid,h]) 
                cylinder(d=circleDiameter, h=height, center=true);
            translate([-tlLen,tlWid,h]) 
                cylinder(d=circleDiameter, h=height, center=true);
            translate([-tlLen,-tlWid,h]) 
                cylinder(d=circleDiameter, h=height, center=true);
        }
        union() {
            tlLen = (length/2) - circleDiameter;
            tlWid = (width/2) - circleDiameter;
            
            translate([tlLen,tlWid,-height]) 
                drilling( d=drilling, depth=h );
            translate([tlLen,-tlWid,-height]) 
                drilling( d=drilling, depth=h );
            translate([-tlLen,tlWid,-height]) 
                drilling( d=drilling, depth=h );
            translate([-tlLen,-tlWid,-height])
                drilling( d=drilling, depth=h );
        }    
    }
}
