//
// raimund-the-juicer
//
// schnecke part
//
// Copyright (c) 2020 Michael Binz
//

use <lib/spiral.scad>

/**
 *
 */
module schnecke( 
    h=100,
    r1=50,
    r2=20,
    resolution=50 )
{
    union()
    {
        stomp( 
            h, 
            5,
            21,
            10 );
        
        difference()
        {
            cylinder( r1=r1, r2=r2, h=h );

            translate( [0,0,h/2])
            spiralSimple(
                height=h,
                Radius=30,
                baseRadius=20,
                frequency=4,
                resolution=50
            );
        }
    }
}

/**
 * A cylinder stomp.  Creates a cylinder and limits this to
 * stompHeight.
 */
module stomp( fullHeight, stompHeight, r1, r2 )
{
    d = max( r1, r2 ) * 2;
    
    difference()
    {
        cylinder( r1=r1, r2=r2, h=fullHeight );
        
        translate( [0,0,(fullHeight/2)+stompHeight] )
            cube( [d,d,fullHeight], center = true  );
    }
}
