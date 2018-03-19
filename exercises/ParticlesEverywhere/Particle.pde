// super-class parenting all different particle types

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;

 // setting main PVectors for all particles
  Particle(PVector l) {
    acceleration = new PVector(0,0.05);
    velocity = new PVector(random(-1,1),random(-2,0));
    location = l.get();
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 2.0;
  }

  void display() {
    noStroke();
    fill(0);
    ellipse(location.x,location.y,2,2);
  }
  
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}