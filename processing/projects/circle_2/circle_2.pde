
import processing.pdf.*;          // Import PDF code
import java.util.Calendar;

boolean savePDF = true;
color matteBlack = color(20,20,20);

void setup() {
  size(4000, 4000);
  noFill();
}

void draw() {
  float margin = width/10;
  
  if(savePDF) beginRecord(PDF, "circle"+timestamp()+".pdf");     // Start writing to PDF
  
  stroke(matteBlack);
  background(230, 230, 230);
  
  translate(width/2,height/2);
  
  int circleResolution = width/35;
  float radius = width/2-margin;
  float angle = TWO_PI/circleResolution;
  
  beginShape();
  for (int i=0; i<=circleResolution; i++){
    float x = cos(angle*i) * radius;
    float y = sin(angle*i) * radius;
    
    strokeWeight(5);
    line(0, 0, x, y);
    
    strokeWeight(5);
    fill(matteBlack);
    circle(x,y,width/200);
    // vertex(x, y);
  }
  endShape();
  
  noFill();
  
  int circleTwoResolution = 20;
  for (int i=5*width/circleTwoResolution; i<radius*2; i+=width/circleTwoResolution){
    strokeWeight(5);
    circle(0,0,i);
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
