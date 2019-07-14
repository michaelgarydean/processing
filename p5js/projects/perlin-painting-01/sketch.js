
var numPoints = 45;
var nStart = 0;
var ampDist = 14;
var thickness = 0.05;
var ampCurve;

var hop;

function setup() {

  createCanvas(window.innerWidth, window.innerHeight);

  // Line quality
  strokeWeight(thickness);
  strokeJoin(ROUND);
  noFill();

  ampCurve = height/8;
}

function draw() {

  // Finish drawing after count goes to 8
  if(nStart>8) {
    return;
  }

  // Update animation, mostly the noise function
  nStart += 0.01;

  // Line color
  //stroke(0,130,164);

  // Space between each point
  hop = width/numPoints;

  // Displace the line on the y axis
  var yDistort = noise(nStart)-0.5;

  // Draw line
  beginShape();

  curveVertex(0, height/2);

  for (var i = 0; i <= width; i=i+hop) {
    curveVertex(i, noise(i,nStart)*ampCurve*yDistort*ampDist+height/2);
  }
  
  endShape();
}
