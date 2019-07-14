
import processing.pdf.*;          // Import PDF code
import java.util.Calendar;

boolean savePDF = true;

float tileCount = 20;
int circleAlpha = 255;
color circleColor = color(20,20,20);  //matte black

void setup() {
  size(4000,4000);
}

void draw() {
  
  if(savePDF) beginRecord(PDF, "dots"+timestamp()+".pdf");     // Start writing to PDF
  
  translate(width/tileCount/2, height/tileCount/2);
  
  background(238, 238, 238);   //set background to flat white
  //smooth();                    //draw smooth shapes
  noFill();                    //only draw outlines of shapes
  //fill(circleColor);
  
  //set seed for random()
  randomSeed(0);
  
  //initialize stroke
  float strokeAmt = 1;
  float scale = 0.25;
  stroke(circleColor, circleAlpha);
  strokeWeight(strokeAmt);
  
  //draw the circles
  for (int gridY=0; gridY<tileCount; gridY++) {
    for(int gridX=0; gridX<tileCount; gridX++) {
      
      float posX = width/tileCount * gridX;
      float posY = height/tileCount * gridY;
      
      strokeAmt = random(-3,150);
      scale = random(-3,35);
      
      if(strokeAmt>=0) {
        strokeWeight(strokeAmt*0.05);
        ellipse(posX,posY,scale*width/tileCount,scale*height/tileCount-1);
      } //end if
      
    } //end loop
  } //end loop
  
  //stop writing to PDF
  if (savePDF) {
    savePDF = false;
    endRecord();
  } //end loop
  
} //end draw

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
