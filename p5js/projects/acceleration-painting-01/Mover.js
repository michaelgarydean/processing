

// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover{
  constructor(){
    this.position = createVector(width/2,height/2);
    this.velocity = createVector();
    this.acceleration = createVector();
    this.topspeed = 5;
    this.nStart = random(100);
    this.initialFill = random(250);
  }

  update() {

    // this.acceleration = p5.Vector.random2D();
    // random2D() not implemented? doing raw math for now instead
    // Update animation, mostly the noise function
    this.nStart += 0.05;

    var angle1 = TWO_PI*noise(this.nStart);
    var angle2 = TWO_PI*noise(this.nStart+100);
    //this.acceleration = createVector(cos(angle),sin(angle));


    this.acceleration = createVector(cos(angle1),sin(angle2));
    this.acceleration.mult(noise(this.nStart+50));

    this.velocity.add(this.acceleration);
    this.velocity.limit(this.topspeed);
    this.position.add(this.velocity);
  }

  display() {
    stroke(0);
    strokeWeight(0);
    fill(this.initialFill+this.acceleration.mag()*50);
    ellipse(this.position.x, this.position.y, 20-20*this.acceleration.mag(), 20-20*this.acceleration.mag());
  }

  checkEdges() {

    if (this.position.x > width) {
      this.position.x = 0;
    }
    else if (this.position.x < 0) {
      this.position.x = width;
    }

    if (this.position.y > height) {
      this.position.y = 0;
    }
    else if (this.position.y < 0) {
      this.position.y = height;
    }
  }

}
