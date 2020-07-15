
h_c1 = 140;
h_c2 = 15;
h_c3 = 15;
h_c4 = 15;

cylinder( r1=42, r2=20, h=h_c1 );

translate( [0, 0, h_c1] )
{
    cylinder( r=20, h=h_c2 );

    translate( [0,0,h_c2] )
    {
        cylinder( r=19, h=h_c3 );

        translate( [0,0,h_c3] )
        {
            cylinder( r=17, h=14 );
        }
    }
}
