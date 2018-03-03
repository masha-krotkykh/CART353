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
  
  Hero() {
    location = new PVector(width/2, height - 50);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    mass = 20;
  }
  
  void update() {
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
    acceleration.mult(0);
    
    location.y = constrain(location.y, hWidth / 2, height - hWidth / 2);
    location.x = constrain(location.x, hHeight / 2, width - hHeight / 2);

    
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
    acceleration.y = -speed;
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