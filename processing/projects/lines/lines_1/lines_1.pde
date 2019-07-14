
import processing.pdf.*;          // Import PDF code
import java.util.Calendar;

boolean savePDF = true;

void setup() {
  size(600, 600);
  stroke(color(20,20,20));
  noFill();
}

float margin = 60;

void draw() {
  
  if(savePDF) beginRecord(PDF, "lines"+timestamp()+".pdf");     // Start writing to PDF
  
  background(230, 230, 230);
  println(width);
  
  for (int i=0; i<height-2*margin; i+=10) {
    line(0+margin,0+margin,width-margin,margin+i);
    line(width-margin,height-margin,0+margin,i+margin);
  }
}


// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
