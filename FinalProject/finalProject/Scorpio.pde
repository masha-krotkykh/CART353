// Bee class. Bees will be food for the Hero
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
    // Constrain location within window
    //location.x = constrain(location.x, size/2, width - size/2);
    location.y = constrain(location.y, hero.yOffset, height - size/2);
    if (location.x >= width || location.x <= 0) {
      velocity.x = -velocity.x;
    }
  }
  
  // Check for collision with the Hero
  void checkCollision(Hero hero) {
    super.checkCollision(hero);
    // Remove bee from an arrayList if it's been eaten
    if (isDead == true) {
      scorpios.remove(this);
    }
  }
}
