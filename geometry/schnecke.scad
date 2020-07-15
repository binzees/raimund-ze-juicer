
test();

module test ()
{
    union()
    {
        stomp( 140, 5, 21, 10 );
        difference()
        {
        schnecke();

        translate( [0,0,140/2])
        spiralSimple(
            height=140,
            Radius=30,
            baseRadius=20,
            frequency=4,
            resolution=50
        );
        }
    }
}

module schnecke ()
{
    // Define part overlap.
    OVERLAP = 0.001;

    h_c1 = 140;
    r1_c1 = 42/2;
    r2_c1 = 20/2;

    h_c2 = 15;
    r_c2 = r2_c1;

    h_c3 = 15;
    r_c3 = 19/2;

    h_c4 = 15;
    r_c4 = 17 / 2;

    cylinder( r1=r1_c1, r2=r2_c1, h=h_c1 );
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

//-------------------------------------------------------------
//simple spiral
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
