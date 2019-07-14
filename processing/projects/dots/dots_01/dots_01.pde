
import processing.pdf.*;          // Import PDF code
import java.util.Calendar;


float tileCount = 20;
int circleAlpha = 255;
color circleColor = color(20,20,20);  //matte black

boolean savePDF = true;

void setup() {
  size(600,600);
}

void draw() {
  
  if(savePDF) beginRecord(PDF, "dots"+timestamp()+".pdf");     // Start writing to PDF
  
  translate(width/tileCount/2, height/tileCount/2);
  
  background(238, 238, 238);   //set background to flat white
  //smooth();                    //draw smooth shapes
  //fill();                    //only draw outlines of shapes
  
  //set seed for random()
  randomSeed(0);
  
  //initialize stroke
  float radius = 1;
  //stroke(circleColor, circleAlpha);
  //strokeWeight(strokeAmt);
  
  //draw the circles
  for (int gridY=0; gridY<tileCount; gridY++) {
    for(int gridX=0; gridX<tileCount; gridX++) {
      
      float posX = width/tileCount * gridX;
      float posY = height/tileCount * gridY;
      
      radius = random(-3,12);
      
      if(radius>=0) {
        noStroke();
        fill(circleColor);
        circle(posX,posY,radius);
      }
    }
  }
  
  //stop writing to PDF
  if (savePDF) {
    savePDF = false;
    endRecord();
    exit();
  } //end loop
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
