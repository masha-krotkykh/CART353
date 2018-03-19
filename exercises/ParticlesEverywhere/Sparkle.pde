// Child of Particle class for volcano eruption
class Sparkle extends Particle {
  PImage flame;
  
  Sparkle(PVector l) {
    super(l);
    flame = loadImage("bubble.png");
  }
  
  void display() {
    imageMode(CENTER);
    tint(255,0,0);
    image(flame,location.x,location.y);
  }
}