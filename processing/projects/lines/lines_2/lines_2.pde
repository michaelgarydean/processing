
import processing.pdf.*;          // Import PDF code
import java.util.Calendar;

boolean savePDF = true;

void setup() {
  size(4000, 4000);
  stroke(color(20,20,20));
  noFill();
}

float margin = 400;

void draw() {
  
  if(savePDF) beginRecord(PDF, "lines"+timestamp()+".pdf");     // Start writing to PDF
  
  background(230, 230, 230);
  
  for (int i=0; i<=height-2*margin; i+=(height*0.01)) {
    line(0+margin,0+margin,width-margin,margin+i);
    line(width-margin,height-margin,0+margin,i+margin);
  }
  
  //stop writing to PDF
  if (savePDF) {
    savePDF = false;
    endRecord();
  } //end loop
  
  exit();
}


// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
