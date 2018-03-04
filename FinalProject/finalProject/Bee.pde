class Bee {
 
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  int size = 15;
 
  Bee() {
    location = new PVector(width, 0);
    velocity = new PVector(0, 0);
    topspeed = 5;
  }
 
  void update() {
    acceleration = PVector.random2D();
    
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
    location.x = constrain(location.x, 0, width);
    location.y = constrain(location.y, 0, height);
  }
 
  void display() {
    noStroke();
    fill(175);
    ellipse(location.x, location.y, size, size);
  }
}