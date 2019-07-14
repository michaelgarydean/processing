
var numPoints = 45;
var nStart = 0;
var ampDist = 15;
var thickness = 0.05;
var ampCurve;

var hop;

function setup() {

  createCanvas(window.innerWidth, window.innerHeight);

  // Line quality
  strokeWeight(thickness);
  strokeJoin(ROUND);

  ampCurve = height/8;
}

function draw() {

  // Line color
  //stroke(0,130,164);

  // Space between each point
  hop = width/numPoints;
  noFill();

  nStart += 0.01;
  var yDistort = noise(nStart)-0.5;

  // Draw line
  beginShape();
  curveVertex(0, height/2);

  for (var i = 0; i < width; i=i+hop) {
    curveVertex(i, noise(i,nStart)*ampCurve*yDistort*ampDist+height/2);
  }
  endShape();
}
