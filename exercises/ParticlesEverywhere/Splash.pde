// Child of Particle class for waterfall
class Splash extends Particle {
  PImage bubble;
  
  Splash(PVector l) {
    super(l);
    // constrain origin of bubbles in waterfall section of the screen
    location.x = constrain(location.x, 300, 600);
    bubble = loadImage("bubble.png");
  }
  
  void display() {
    imageMode(CENTER);
    color c = color(255, 100);
    tint(c, lifespan);
    image(bubble,location.x, location.y);
  }
    boolean isDead() {
      // make bubbles disappear when they get outside waterfall section of the screen
    if (location.x < (width/3) || location.x > (width/3)*2) {
      return true;
    } 
    else {
      return false;
    }
  }
}