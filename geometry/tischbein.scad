//
// raimund-the-juicer
//
// welle top-level part
//
// Copyright (c) 2020 Michael Binz
//

use <schnecke.scad>
use <lib/threads.scad>

tischbein();

module tischbein ()
{
    // Define part overlap.
    OVERLAP = 0.001;

    d_top = 80;
    d_bottom = 40;
    // Height
    h0 = 300;
    // Angle
    angle=22.5;
    thickness = 2;
    

    cube([d_top+20,d_top+20,thickness], center=true);
     
    rotate ([angle,0,0]) {
    translate( [0, 0, 0] )
    {
        
        difference () {
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
