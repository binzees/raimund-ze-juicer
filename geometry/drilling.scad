//
// raimund-the-juicer
//
// Copyright (c) 2020 Michael Binz
//

include <common.scad>

drilling();

// A drilling. Subtract.
module drilling(
    d = 6,
    depth = 50
)
{
    d = d + (2*cmn_OVERLAP);
    
    union ()
    {
        translate( [0, 0, (d/2) - cmn_OVERLAP ] )
        {
            cylinder(
                h=d, 
                d1=2*d,
                d2=0,
                center=true);
            
            translate( [0, 0, depth/2] )
            {
                cylinder(
                    h=depth, 
                    d=d,
                    center=true);
            }
        }
    } // union
}
