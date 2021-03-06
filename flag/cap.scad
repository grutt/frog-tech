        //all units in mm
$fn = 100;

//capSpec
poleDia = 13;
wallThickness = 2;
capHeight = 65;

//mountingPlate Spec     
mpWidth = 65;
mpHeight = 65;
sheetThickness = 3.175 * 2;

screwDia = 5;

module mountingPlate(display=false){
    difference(){
        cube([mpWidth, wallThickness, mpHeight]);
        
       translate([0,0,mpHeight]){
            rotate([0,45,0]){
            translate([0,-.5,0]){
            cube([sqrt(pow(mpWidth, 2)+pow(mpHeight, 2)), sheetThickness+1, 999]);
            }
        }
    }     
        
    adjW = mpWidth - poleDia/2;
    adjH = mpHeight - wallThickness;
    
    echo("Width:");
    echo(adjW);
    echo("Height:");
    echo (adjH);
    
    
        if(display){
            translate([0,sheetThickness/2, 0 ]){
                cylinder(capHeight, d=poleDia);
            }
             cube([mpWidth, sheetThickness, wallThickness]);
        }
     
    }
}
//mountingPlate(true);


module cap(){

            
        difference(){
            union(){
            cylinder(capHeight, d=poleDia+2*wallThickness);
               translate([0,-sheetThickness/2, 0 ]){
                    cube([mpWidth, sheetThickness, wallThickness]);
               }
               translate([0,sheetThickness/2, 0 ]){
                    mountingPlate();
                    }
                    
                translate([0,-sheetThickness/2-wallThickness, 0 ]){
                    mountingPlate();
                    }
                }
            

            translate([0, 0, wallThickness]){
                cylinder(capHeight, d=poleDia);
            }
            
          translate([mpWidth-5,-30,-20]){
                cube([300,300, 300]);
           }
        }
}
//cap();

holderHeight = 30;

module poleHolder(holeDepth = -10){
    difference(){

    union(){
            cylinder(holderHeight, d=poleDia+2*wallThickness);
               translate([poleDia/2-wallThickness,-holderHeight/2, 0 ]){
                    cube([wallThickness*2, holderHeight, holderHeight]);
               }
           }

      translate([0, 0, holeDepth]){
            cylinder(capHeight*2, d=poleDia);
         }
    }
}

poleHolder();