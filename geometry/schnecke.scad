//
// raimund-the-juicer
//
// schnecke part
//
// Copyright (c) 2020 Michael Binz
//

module schnecke( h=100, r1=50, r2=20 )
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

module spiralSimple(height=20,Radius=20,baseRadius=3,frequency=1,resolution=25)
{
	union()
    {
		translate( [0,0,-(height/2)] )
        {
            for( i=[0:resolution-2])
            {
                hull()
                {
                    rotate ([0,0,frequency*360/(resolution-1)*i]) 
                    translate ([Radius,0,i*height/(resolution-1)])
                    sphere( r=baseRadius );
                    rotate ([0,0,frequency*360/(resolution-1)*(i+1)])
                    translate ([Radius,0,(i+1)*height/(resolution-1)]) 
                    sphere( r=baseRadius );
                }
            }
        }
    }
}
