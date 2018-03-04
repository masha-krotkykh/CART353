// class do define the main character
class Hero {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float vx;
  float vy;
  int hWidth = 40;
  int hHeight = 40;
  PImage hImage;
  float speed = 0.2;
  float gravity = 1;
  float mass;
  int topSpeed = 5;
  int yOffset = height - 50;
  
  Hero() {
    location = new PVector(width/2, yOffset);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    mass = 20;
  }
  
  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }
  
  void update() {
    velocity.add(acceleration);
    velocity.x = constrain(velocity.x, -5, 5);
    location.add(velocity);
    acceleration.mult(0);
    
    location.y = constrain(location.y, hHeight / 2, yOffset);
    location.x = constrain(location.x, hWidth / 2, width - hWidth / 2);

    
  if (right == true) {
    acceleration.x = speed;
  }
  else if (left == true) {
    acceleration.x = -speed;
  }
  else {
    acceleration.x = 0;
    velocity.x = 0;
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
  
  void display() {
    noStroke();
    fill(155);
    ellipse(location.x, location.y, hWidth, hHeight);
  }
}