//all units in mm
$fn = 100;

//capSpec
poleDia = 10;
wallThickness = 2;
capHeight = 65;

//mountingPlate Spec
mpWidth = 65;
mpHeight = 65;
sheetThickness = 4;

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
        
        if(display){
            translate([0,sheetThickness/2, 0 ]){
                cylinder(capHeight, d=poleDia);
            }
             cube([mpWidth, sheetThickness, wallThickness]);
        }
    }
}
//mountingPlate();


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
                    
                translate([0,-sheetThickness, 0 ]){
                    mountingPlate();
                    }
                }
            
            
            translate([0, 0, wallThickness]){
                cylinder(capHeight, d=poleDia);
            }
        }
}
cap();