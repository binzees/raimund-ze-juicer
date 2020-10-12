//
// raimund-the-juicer
//
// welle top-level part
//
// Copyright (c) 2020 Michael Binz
//

use <schnecke.scad>
use <lib/threads.scad>
include <common.scad>

drilling();

module drilling()
{
    diameter = 6;
    depth = 50;
    
    union ()
    {
        translate( [0, 0, (diameter/2) - cmn_OVERLAP ] )
        {
            cylinder(
                h=diameter, 
                d1=2*diameter,
                d2=0,
                center=true);
            
            translate( [0, 0, depth/2] )
            {
                cylinder(
                    h=depth, 
                    d=diameter,
                    center=true);
            }
        }
    } // union
}
