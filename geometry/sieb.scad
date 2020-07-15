//
// raimund-the-juicer
//
// sieb part
//
// Copyright (c) 2020 Michael Binz
//

// stomp
use <schnecke.scad>

sieb();

module sieb( starke=2, overlap=0.001 )
{
    h0 = 140;
    h = 120;
    r1_c1 = 42/2;
    r2_c1 = 20/2;

    h_c2 = 15;
    r_c2 = r2_c1;

    h_c3 = 15;
    r_c3 = 19/2;

    h_c4 = 15;
    r_c4 = 17 / 2;
    
//    translate( [0,-r1_c1-starke,0] )
//    cube( [starke,2*(r1_c1+starke),h], center=false );
    
    difference() 
    {
        union()
        {
    translate( [0,-r1_c1-starke,0] )
    cube( [starke,2*(r1_c1+starke),h], center=false );
        stomp( h=h0, r1=r1_c1+2, r2=r2_c1+2, stompHeight=120 );
        }
//        stomp( h=h0, r1=r1_c1+2, r2=r2_c1+2, stompHeight=120 );
        translate( [0,0,-overlap] )
        stomp( h=h0, r1=r1_c1, r2=r2_c1, stompHeight=120+(2*overlap) );
    }
}
