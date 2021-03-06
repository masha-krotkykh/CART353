// Food superclass. Bees and scorpios will inherit from it. They will be food for the Hero

class Food {
 // Define main properties 
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector dist;
  float topspeed;
  int size;
  boolean collide = false;  
  PImage foodImg;
  boolean isDead = false;
  float accX;
  float accY;

  void update() {
    // Update position by velocity and velocity by acceleration
    // Random acceleration to immitate more organic movement
    acceleration = new PVector(accX, accY);
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }
  
  // Check for collision with the Hero
  void checkCollision(Hero hero) {
    // By subtracting distances between two vectors find the distance between an instance of food and the Hero
    PVector distance = PVector.sub(hero.location, location);
    float distanceMag = distance.mag();
    // Define the collision distance 
    float minDistance = size/2 + hero.hWidth/2;
    
    // If a creature collides with hero, declare it dead
    if (distanceMag < minDistance) {
      isDead = true;
      // every caught creature will increase the level of fullness
      stats.foodEaten = stats.foodEaten + 1;
      hero.fullness = hero.fullness + 300;
    }
  }

 // Display creatures
  void display() {
    imageMode(CENTER);
    image(foodImg, location.x, location.y, size, size);
  }
}
