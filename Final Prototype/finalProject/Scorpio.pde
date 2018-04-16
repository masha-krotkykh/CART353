// Scorpio class. Scorpios will be food for the Hero
class Scorpio extends Food {
 // Define main properties 
  PImage scorpioImg = loadImage("scorpio.png");    
 
 // Construct a bee, where it will originate and limit its top speed 
  Scorpio() {
    location = new PVector(stoneX, stoneY);
    velocity = new PVector(0, 0);
    // Limit the top speed
    topspeed = 4;
    foodImg = scorpioImg;
    size = 30;
  }
 
  void update() {
    // Call update from super class Food
    super.update();
    accX = random(-0.2, 0);
    accY = random(-1, 1);
    // Constrain location 
    // wrap around the window
    location.y = constrain(location.y, hero.yOffset, height - size/2);
    if (location.x <= 0) {
      location.x = width + size/2;
    }
  }
  
  // Check for collision with Hero
  void checkCollision(Hero hero) {
    super.checkCollision(hero);
    // Remove bee from an arrayList if it's been eaten
    if (isDead == true) {
      scorpios.remove(this);
    }
  }
}
