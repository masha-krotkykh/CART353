
// class for the Roller that will be moved around the screen with arrow keys while rotating 
// some parts of code were borrowed from The Nature of Code by Daniel Shiffman

class Roller {
 
  // declaring variables for mass, size, position, as well as image, rotation, and PVectors
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass = 10;
  int size = 50;
  PImage rolloImg = loadImage("rollo.png");
  float rot;
  float x = width / 4;
  float y = height - 50;
   
  Roller() {
    //defining starting state for the Roller
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    rot = 0.0;
  }
 
  void update() {
    // trapping the Roller inside the window
    location.y = constrain(location.y, size / 2, height - size / 2);
    location.x = constrain(location.x, size / 2, width - size / 2);
    
    //defining controls for the Roller - will be moved around with arrow keys and rotate at the same time
    if (rollRight == true || rollUp == true) {
      rot += 0.09;
    } 
    else if (rollLeft == true || rollDown == true) {
      rot -=0.09;
    }
    
    // putting movement together : acceleration to define velocity, velocity to define position and resetting velocity so that it doesn't build up
    velocity.add(acceleration);
    location.add(velocity);
    velocity.mult(0);
} 

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  // displaying the Roller as an image, defining rotation for "rolling"
  void display() {
    pushMatrix();
    translate(location.x, location.y); 
    rotate(rot);
    imageMode(CENTER);
    image(rolloImg, 0, 0);
    popMatrix();
  }
}