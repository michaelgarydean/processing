
let mover;
let count = 0;

function setup() {
  createCanvas(window.innerWidth, window.innerHeight);
  mover1 = new Mover();
  mover2 = new Mover();
  mover3 = new Mover();
}

function draw() {
  count++;

  mover1.update();
  mover1.checkEdges();
  mover1.display();

  mover2.update();
  mover2.checkEdges();
  mover2.display();

  mover3.update();
  mover3.checkEdges();
  mover3.display();
  console.log(count);

  if(count > 1500) {
    exit;
  }
}
