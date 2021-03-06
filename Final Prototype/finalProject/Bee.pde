// Bee class. Bees will be food for the Hero.
// subclass of Food class

class Bee extends Food {
 // Define main properties 
 PImage beeImg = loadImage("bee.png");
 // Define and construct a bee, where it will originate and limit its top speed 
  Bee() {
    location = new PVector(hiveX, hiveY);
    velocity = new PVector(0, 0);
    // Limit the top speed
    topspeed = 7;
    foodImg = beeImg;
    size = 20;
  }
 
  void update() {
    // Call update from super class Food
    super.update();
    // Add random movement for more organic look
    accX = random(-3, 3);
    accY = random(-2, 2);
    // Constrain location within window
    location.x = constrain(location.x, size/2, width - size/2);
    location.y = constrain(location.y, stats.statsHeight, hero.yOffset);
  }
  
  // Check for collision with the Hero
  void checkCollision(Hero hero) {
    super.checkCollision(hero);
    // Remove bee from an arrayList if it's been eaten
    if (isDead == true) {
      bees.remove(this);
    }
  }
}
