//
// raimund-the-juicer
//
// welle top-level part
//
// Copyright (c) 2020 Michael Binz
//

use <platte.scad>

tischbein();

module tischbein ()
{
    d_top = 80;
    d_bottom = 40;
    // Height
    h0 = 300;
    // Angle
    angle=0;
    thickness = 2;
    
    rotate([180,0,0]) platte(
        w=d_top+20,
        l=d_top+20,
        s=thickness );

    rotate ([angle,0,0]) {
        translate( [0, 0, 0] )
        {
            difference ()
            {
                cylinder(
                    r1=d_top/2,
                    r2=d_bottom/2,
                    h=h0 );
                cylinder(
                    r1=(d_top/2)-(2*thickness),
                    r2=(d_bottom/2)-(2*thickness),
                    h=h0 );
            }
        }
    }
}
