
module welle ()
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

    translate( [0, 0, h_c1-OVERLAP] )
    {
        c2 = h_c2 + OVERLAP;
        
        cylinder( r=r_c2, h=c2 );

        translate( [0,0,c2-OVERLAP] )
        {
            c3 = h_c3 + OVERLAP;
            
            cylinder( r=r_c3, h=c3 );

            translate( [0,0,c3-OVERLAP] )
            {
                c4 = h_c4 + OVERLAP;
                
                difference()
                {
                    cylinder( r=r_c4, h=h_c4+OVERLAP);
                
                    // Seitenfräsung Kurbelbefestigung.
                    
                    // 5 below moves the cube out of the center.
                    // This is arbitrary.
                    translate( [-r_c4,5,0] )
                    {
                        cube(
                            // 2*h_c4 simply means 'much bigger
                            // than needed'.
                            size=[2*r_c4,r_c4,2*h_c4],
                            center = false
                        );
                    }
                }
            }
        }
    }
}

welle();
