// Creating a simple program with a Roller that will be moved around the screen with the arrow keys
// to collect objects and be infuenced by different forces

// by default the Roller stands still and waits for a key to be pressed
Roller roller;
boolean rollRight = false;
boolean rollLeft = false;
boolean rollUp = false;
boolean rollDown = false;

Artifact[] artifacts = new Artifact[20];
PImage[] artImages = new PImage[4]; 

// setting up the window and creating an instance of a Roller
// and four images for artifacts
void setup(){
  size(900, 500);
  roller = new Roller();
  artImages[0] = loadImage("01.png");
  artImages[1] = loadImage("02.png");
  artImages[2] = loadImage("03.png");
  artImages[3] = loadImage("04.png");
  
  // creating instances artifacts
  for (int a = 0; a < artifacts.length; a++) {
    artifacts[a] = new Artifact(artImages[int(random(0,4))], 5, random(0, width), random(0, height));
  }
}

void draw() {
  background(0);

// defining the variables that will be passed to newVelocity PVector according to which key is being pressed
  float x;
  float y;
  if (rollRight) {
    x = 1;
  }  
  else if (rollLeft) { 
    x = -1;
  }
  else {
    x = 0;
  }
  if (rollUp) {
    y = -1;
  }
  else if (rollDown) {
    y = 1;
  }
  else {
    y = 0;
  }
  
  PVector newVelocity = new PVector(x, y);
  roller.applyForce(newVelocity);
  newVelocity.mult(0);

  // defining forces that will influence the roller in special parts of the screen
  // friction should make its movement more difficult
  float c1 = 0.8;
  PVector friction = roller.acceleration.get();
  friction.mult(-1);
  friction.normalize();
  friction.mult(c1);
  
  // antifriction should speed it up
  float c2 = 2;
  PVector antifriction = roller.acceleration.get();
  antifriction.mult(1);
  antifriction.normalize();
  antifriction.mult(c2); 
  
  // checking if the Roller is one of the "special" places and applying forces accordingly
  if (roller.location.x >= 550 && roller.location.x <= 700) {
    roller.applyForce(antifriction);
  }
  
  if (roller.location.y >= 50 && roller.location.y <= 200) {
    roller.applyForce(friction);
  }
  
  // drawing rectangles to indicate "special" zones where forces will be applied
  noStroke();
  fill(0, 100, 150, 100);
  rect(550, 0, 150, height);
  
  fill(200, 200, 100, 80);
  rect(0, 50, width, 150);
  
  // updating and displaying the Roller
  roller.update();
  roller.display();
  
  // looping through an array of artifacts and applying forces to them
  // checking edges, updating, and displaying artifacts
  for (int a = 0; a < artifacts.length; a++) {
    PVector attract = roller.attract(artifacts[a]);
    artifacts[a].applyForce(attract);
    artifacts[a].checkEdges();
    artifacts[a].update();
    artifacts[a].display();
  }
}

// setting up controls to move the Roller around the screen
void keyPressed() {
  if (keyCode == RIGHT) {
    rollRight = true;
  }
  if (keyCode == LEFT) {
    rollLeft = true;
  }
  if (keyCode == UP) {
    rollUp = true;
  }
  if (keyCode == DOWN) {
    rollDown = true;
  }
}  

// making sure that the movement stops when the key is released
void keyReleased() {
  rollRight = false;
  rollLeft = false;
  rollUp = false;
  rollDown = false;
  roller.acceleration.mult(0); 
 } 