//spiralSolidMultiEllipse(
//    height=40,
//    Radius=20,
//    baseRadius=3,
//    frequency=0.25,
//    resolution=25,
//    numPairs=3);

spiralSimple(
    height=20,
    Radius=20,
    baseRadius=10,
    frequency=1,
    resolution=50
);

//-------------------------------------------------------------
//simple spiral
module spiralSimple(height=20,Radius=20,baseRadius=3,frequency=1,resolution=25) {
	union(){
		translate ([0,0,-(height/2)]) {
				for(i=[0:resolution-2]){
					hull(){
						rotate ([0,0,frequency*360/(resolution-1)*i]) translate ([Radius,0,i*height/(resolution-1)]) sphere(r=baseRadius, center=true);
						rotate ([0,0,frequency*360/(resolution-1)*(i+1)]) translate ([Radius,0,(i+1)*height/(resolution-1)]) sphere(r=baseRadius,center=true);
					}
				}
		}
	}
}

//cone spiral
module spiralCone(height=20,Radius=20,baseRadius=3,frequency=1,resolution=25) {
	union(){
		translate ([0,0,-(height/2)]) {
				for(i=[0:resolution-2]){
					hull(){
						rotate ([0,0,frequency*360/(resolution-1)*i]) translate ([Radius-(i-1)*Radius/resolution,0,i*height/(resolution-1)]) sphere(r=baseRadius, center=true);
						rotate ([0,0,frequency*360/(resolution-1)*(i+1)]) translate ([Radius-i*Radius/resolution,0,(i+1)*height/(resolution-1)]) sphere(r=baseRadius,center=true);
					}
				}
		}
	}
}

//ellipse spiral
module spiralEllipse(height=20,Radius=20,baseRadius=3,frequency=1,resolution=25) {
	union(){
		translate ([0,0,-(height/2)]) {
				for(i=[0:resolution-2]){
					hull(){
						rotate ([0,0,frequency*360/(resolution-1)*i]) translate ([Radius*sqrt(1-(i/(resolution-1)*(i/(resolution-1)))),0,i*height/(resolution-1)]) sphere(r=baseRadius, center=true);
						rotate ([0,0,frequency*360/(resolution-1)*(i+1)]) translate ([Radius*sqrt(1-((i+1)/(resolution-1)*((i+1)/(resolution-1)))),0,(i+1)*height/(resolution-1)]) sphere(r=baseRadius,center=true);
					}
				}
		}
	}
}

// Multiple spirals arranged radially around the axis
module spiralMulti(height=20,Radius=20,baseRadius=3,frequency=1,resolution=25,numSpirals=3) {
	shiftAngle=360/numSpirals;
	for(total=[0:numSpirals-1]) {
		union(){
		translate ([0,0,-(height/2)]) {
					for(i=[0:resolution-2]){
						hull(){
							rotate ([0,0,frequency*360/(resolution-1)*i+shiftAngle*total]) translate ([Radius,0,i*height/(resolution-1)]) sphere(r=baseRadius, center=true);
							rotate ([0,0,frequency*360/(resolution-1)*(i+1)+shiftAngle*total]) translate ([Radius,0,(i+1)*height/(resolution-1)]) sphere(r=baseRadius,center=true);
						}
					}
			}
		}
	}
}

// Multiple spirals arranged radially around the axis tapering in towards the axis
module spiralMultiCone(height=20,Radius=20,baseRadius=3,frequency=1,resolution=25,numSpirals=3) {
	shiftAngle=360/numSpirals;
	for(total=[0:numSpirals-1]) {
		union(){
			translate ([0,0,-(height/2)]) {
					for(i=[0:resolution-2]){
						hull(){
							rotate ([0,0,frequency*360/(resolution-1)*i+shiftAngle*total]) translate ([Radius-(i-1)*Radius/resolution,0,i*height/(resolution-1)]) sphere(r=baseRadius, center=true);
							rotate ([0,0,frequency*360/(resolution-1)*(i+1)+shiftAngle*total]) translate ([Radius-i*Radius/resolution,0,(i+1)*height/(resolution-1)]) sphere(r=baseRadius,center=true);
						}
					}
			}
		}
	}
}

//multiple ellipse spiral
module spiralMultiEllipseHalf(height=20,Radius=20,baseRadius=3,frequency=1,resolution=25,numSpirals=3) {
	shiftAngle=360/numSpirals;
	for(total=[0:numSpirals-1]) {
		union(){
			translate ([0,0,-(height/2)]) {
					for(i=[0:resolution-2]){
						hull(){
							rotate ([0,0,frequency*360/(resolution-1)*i+shiftAngle*total]) translate ([Radius*sqrt(1-(i/(resolution-1)*(i/(resolution-1)))),0,i*height/(resolution-1)]) sphere(r=baseRadius, center=true);
							rotate ([0,0,frequency*360/(resolution-1)*(i+1)+shiftAngle*total]) translate ([Radius*sqrt(1-((i+1)/(resolution-1)*((i+1)/(resolution-1)))),0,(i+1)*height/(resolution-1)]) sphere(r=baseRadius,center=true);
						}
					}
			}
		}
	}
}

//multiple ellipse spiral
module spiralMultiEllipse(height=20,Radius=20,baseRadius=3,frequency=1,resolution=25,numSpirals=3) {
	shiftAngle=360/numSpirals;
	for(total=[0:numSpirals-1]) {
		union(){
			translate ([0,0,-(height/2)]) {
					for(i=[-(resolution/2):(resolution/2)]){
						hull(){
							rotate ([0,0,frequency*360/(resolution-1)*i+shiftAngle*total]) translate ([Radius*sqrt(1-(i/(resolution/2)*(i/(resolution/2)))),0,i*height/(resolution-1)]) sphere(r=baseRadius, center=true);
							rotate ([0,0,frequency*360/(resolution-1)*(i+1)+shiftAngle*total]) translate ([Radius*sqrt(1-((i+1)/(resolution/2)*((i+1)/(resolution/2)))),0,(i+1)*height/(resolution-1)]) sphere(r=baseRadius,center=true);
						}
					}
			}
		}
	}
}

// Multiple spirals arranged radially around the axis tapering in towards the axis with a solid center
module spiralSolidMultiCone(height=20,Radius=20,baseRadius=3,frequency=1,resolution=25,numPairs=3) {
	shiftAngle=360/numPairs;
	for(total=[0:numPairs-1]) {
		union(){
			translate ([0,0,-(height/2)]) {
					for(i=[0:resolution-2]){
						hull(){
							hull(){								
								rotate ([0,0,frequency*360/(resolution-1)*i+shiftAngle*total]) translate ([Radius-(i-1)*Radius/resolution,0,i*height/(resolution-1)]) sphere(r=baseRadius, center=true);
								rotate ([0,0,frequency*360/(resolution-1)*i+shiftAngle*total+180]) translate ([Radius-(i-1)*Radius/resolution,0,i*height/(resolution-1)]) sphere(r=baseRadius, center=true);
							}
							hull(){								
								rotate ([0,0,frequency*360/(resolution-1)*(i+1)+shiftAngle*total]) translate ([Radius-i*Radius/resolution,0,(i+1)*height/(resolution-1)]) sphere(r=baseRadius,center=true);
								rotate ([0,0,frequency*360/(resolution-1)*(i+1)+shiftAngle*total+180]) translate ([Radius-i*Radius/resolution,0,(i+1)*height/(resolution-1)]) sphere(r=baseRadius,center=true);
							}
						}
					}
			}
		}
	}
}

//multiple ellipse spiral with solid center
module spiralSolidMultiEllipseHalf(height=20,Radius=20,baseRadius=3,frequency=1,resolution=25,numPairs=3) {
	shiftAngle=360/numPairs;
	for(total=[0:numPairs-1]) {
		union(){
			translate ([0,0,-(height/2)]) {
					for(i=[0:resolution-2]){
						hull(){
							hull(){	
								rotate ([0,0,frequency*360/(resolution-1)*i+shiftAngle*total]) translate ([Radius*sqrt(1-(i/(resolution-1)*(i/(resolution-1)))),0,i*height/(resolution-1)]) sphere(r=baseRadius, center=true);
								rotate ([0,0,frequency*360/(resolution-1)*i+shiftAngle*total+180]) translate ([Radius*sqrt(1-(i/(resolution-1)*(i/(resolution-1)))),0,i*height/(resolution-1)]) sphere(r=baseRadius, center=true);
							}
							hull(){
								rotate ([0,0,frequency*360/(resolution-1)*(i+1)+shiftAngle*total]) translate ([Radius*sqrt(1-((i+1)/(resolution-1)*((i+1)/(resolution-1)))),0,(i+1)*height/(resolution-1)]) sphere(r=baseRadius,center=true);
								rotate ([0,0,frequency*360/(resolution-1)*(i+1)+shiftAngle*total+180]) translate ([Radius*sqrt(1-((i+1)/(resolution-1)*((i+1)/(resolution-1)))),0,(i+1)*height/(resolution-1)]) sphere(r=baseRadius,center=true);
							}
						}
					}
			}
		}
	}
}

//multiple ellipse spiral with a solid center
module spiralSolidMultiEllipse(height=20,Radius=20,baseRadius=3,frequency=1,resolution=25,numPairs=3) {
	shiftAngle=360/numPairs;
	for(total=[0:numPairs-1]) {
		union(){
			translate ([0,0,-(height/2)]) {
					for(i=[-(resolution/2):(resolution/2)]){
						hull(){
							hull(){
								rotate ([0,0,frequency*360/(resolution-1)*i+shiftAngle*total]) translate ([Radius*sqrt(1-(i/(resolution/2)*(i/(resolution/2)))),0,i*height/(resolution-1)]) sphere(r=baseRadius, center=true);
								rotate ([0,0,frequency*360/(resolution-1)*i+shiftAngle*total+180]) translate ([Radius*sqrt(1-(i/(resolution/2)*(i/(resolution/2)))),0,i*height/(resolution-1)]) sphere(r=baseRadius, center=true);
							}
							hull(){
								rotate ([0,0,frequency*360/(resolution-1)*(i+1)+shiftAngle*total]) translate ([Radius*sqrt(1-((i+1)/(resolution/2)*((i+1)/(resolution/2)))),0,(i+1)*height/(resolution-1)]) sphere(r=baseRadius,center=true);
								rotate ([0,0,frequency*360/(resolution-1)*(i+1)+shiftAngle*total+180]) translate ([Radius*sqrt(1-((i+1)/(resolution/2)*((i+1)/(resolution/2)))),0,(i+1)*height/(resolution-1)]) sphere(r=baseRadius,center=true);
							}
						}
					}
			}
		}
	}
}
