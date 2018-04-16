// Bee class. Bees will be food for the Hero
class Bee {
 // Define main properties 
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector dist;
  float topspeed;
  int size = 20;
  boolean collide = false;
  PImage beeImg = loadImage("bee.png");    
 
  Bee() {
    location = new PVector(hiveX, hiveY);
    velocity = new PVector(0, 0);
    // Limit the top speed
    topspeed = 5;
  }
 
  void update() {
    // Random acceleration to immitate more organic movement
    acceleration = PVector.random2D();
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
    // Constrain location within window
    location.x = constrain(location.x, 0, width);
    location.y = constrain(location.y, 0, hero.yOffset);
  }
  
  // Check for collision with the Hero
  void checkCollision(Hero hero) {
    // By subtracting distances between two vectors find the distance between an instance of a bee and the Hero
    PVector distance = PVector.sub(hero.location, location);
    float distanceMag = distance.mag();
    // Define the collision distance 
    float minDistance = size/2 + hero.hWidth/2;
    
    // If the objects collide, remove this instance of a bee from the array list
    if (distanceMag < minDistance) {
      bees.remove(this);
      // every caught bee will increase the level of fullness
      stats.beesEaten = stats.beesEaten + 1;
    }
  }

 // Display bees
  void display() {
    imageMode(CENTER);
    image(beeImg, location.x, location.y, size, size);
  }
}