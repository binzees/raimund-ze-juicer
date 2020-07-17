
include <common.scad>
use <lib/threads.scad>

top_regelschraube();

module top_regelschraube()
{
    length = 40;
    
    handle_h = 40;
    handle_w = 60;
    handle_t = 5;
    
    metric_thread (diameter=8, pitch=1, length=length );
    
    translate( [
        0, 
        0, 
        (handle_h/2) + length-cmn_OVERLAP] )
    {
        cube( [handle_t,handle_w,handle_h], center=true );
    }
}
