class Roller {
 
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass = 10;
  int size = 50;
  PImage rolloImg;
  
  Roller() {
    location = new PVector(0 + size / 2, height - size * 2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
 
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
 
  void update() {
    PVector velocityNew = velocity.get(); 
    velocityNew.normalize();
    
    
    if (rollRight == true) {
      velocityNew.add(1, 0);  
    } 
    else if (rollLeft == true) {
      velocityNew.add(-1, 0); 
    }
    else if (rollUp == true) {
      velocityNew.add(0, -1);  
    }
    else if (rollDown == true) {
      velocityNew.add(0, 1); 
    } 
    
    velocity.add(acceleration);
    location.add(velocityNew);
    velocityNew.mult(0);
} 
  void display() {
    stroke(0);
    fill(175);
    ellipse(location.x, location.y, size, size);
  }
 
  void checkEdges() {
    if (location.x > width + size / 2) {
      location.x = 0 - size / 2;
    } 
  }
}