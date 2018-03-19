// Particle child class for the sandstorm

class Sand extends Particle {
  
  PImage sand;
  
  Sand(PVector l) {
    super(l);
    acceleration.x=(acceleration.x+0.5);
    sand = loadImage("sand.png");
  }
  
  float r = 1.5;

  // Method to display
  void display() {
    imageMode(CENTER);
    tint(255,lifespan);
    image(sand,location.x,location.y);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (location.x > width) {
      return true;
    } 
    else {
      return false;
    }
  }
}