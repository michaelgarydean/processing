
import processing.pdf.*;          // Import PDF code
import java.util.Calendar;

boolean savePDF = true;
color matteBlack = color(20,20,20);

void setup() {
  size(4000, 4000);
  noFill();
}

void draw() {  
  
  float margin = width/5;
  float sineWidth = width-margin;
  float amp = height/3-margin;
  
  if(savePDF) beginRecord(PDF, "sine"+timestamp()+".pdf");     // Start writing to PDF
  stroke(matteBlack);
  background(230, 230, 230);
  
  float a = 0.0;
  float phaseShift = 3.14159;
  float inc = TWO_PI*4/(width-2*margin);
  int yOffset = height/2;
  
  strokeWeight(2);
  for (int i = int(margin); i < width-margin; i=i+4) {
    line(i, yOffset, i, amp*sin(a+phaseShift)+yOffset);
    a = a + inc;
  }
  
  translate(width/2,height/2);
  strokeWeight(2);
  //circle(0,0,sineWidth-margin);
  
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
