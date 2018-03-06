// class do define the main character
class Hero {
  // Main properties
  PVector location;
  PVector velocity;
  PVector acceleration;
  int hWidth = 40;
  int hHeight = 40;
  PImage hImage;
  float speed = 0.2;
  float mass;
  // An offset so that Hero doesn't touch r=the bottom edge
  int yOffset = height - 50;
  
  Hero() {
    // PVectors to model hero's movement
    location = new PVector(width/2, yOffset);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    mass = 20;
  }
  // Model gravity so that the hero gets back down after a jump
  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }
  
  void update() {
    // Create movement (constrain horizontal speed)
    velocity.add(acceleration);
    velocity.x = constrain(velocity.x, -5, 5);
    location.add(velocity);
    acceleration.mult(0);
    // Constrain hero's location within the window
    location.y = constrain(location.y, hHeight / 2, yOffset);
    location.x = constrain(location.x, hWidth / 2, width - hWidth / 2);

  // Move when one of the arrow keys is pressed 
  // Set the hero's location and frame sequences from the sprite to animate
  blob.setXY(hero.location.x, hero.location.y);
  if (right == true) {
    acceleration.x = speed;
    blob.setFrameSequence(7, 10, 0.2);
  }
  else if (left == true) {
    acceleration.x = -speed;
    blob.setFrameSequence(3, 6, 0.2);
  }
  else {
    acceleration.x = 0;
    velocity.x = 0;
    blob.setFrameSequence(0, 3, 0.5);
  }
  if (up == true) {
    acceleration.y = -speed * 50;
  }
  else if (down == true) {
    acceleration.y = speed;
  } 
  else {
    acceleration.y = 0;
    velocity.y = 0;
  }
 }
}