// class do define the main character
class Hero {
  // Main properties
  PVector location;
  PVector velocity;
  PVector acceleration;
  int hWidth = 40;
  int hHeight = 40;
  PImage hImage;
  float speed = 0.2;
  float mass;
  // An offset so that Hero doesn't touch r=the bottom edge
  int yOffset = height - 50;
  // variables to determine hero's state
  int fullness = 20;
  int joy = 20;
  int eatTime = 0;
  int playTime = 0;
  int lastPlayed;
  int lastFed;
  int hungry = 10;
  int bored = 5;
  int gr = 40;
  
  
  
  Hero() {
    // PVectors to model hero's movement
    location = new PVector(width/2, yOffset);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    mass = 20.0;
  }
  // Model gravity so that the hero gets back down after a jump
  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }
  
  void update() {
    // Create movement (constrain horizontal speed)
    velocity.add(acceleration);
    velocity.x = constrain(velocity.x, -5, 5);
    location.add(velocity);
    acceleration.mult(0);
    // Constrain hero's location within the window
    location.y = constrain(location.y, hHeight / 2, yOffset);
    location.x = constrain(location.x, hWidth / 2, width - hWidth / 2);

  // Move when one of the arrow keys is pressed 
  // Set the hero's location and frame sequences from the sprite to animate
  blob.setXY(hero.location.x, hero.location.y);
  if (right == true) {
    acceleration.x = speed;
    blob.setFrameSequence(7, 10, 0.2);
  }
  else if (left == true) {
    acceleration.x = -speed;
    blob.setFrameSequence(3, 6, 0.2);
  }
  else {
    acceleration.x = 0;
    velocity.x = 0;
    blob.setFrameSequence(0, 3, 0.5);
  }
  if (up == true) {
    acceleration.y = -speed * gr;
  }

  else {
    acceleration.y = 0;
    velocity.y = 0;
  }
    // Countdown for the hero to get hungry
    // every 10 seconds he gets 1 point hungrier
    lastFed = (millis() - eatTime) / 1000;
    hungry = 10 - lastFed;
    if (hungry <= 0) {
      fullness = fullness - 1;
      eatTime = millis();
      fullness = constrain(fullness, 0, 20);
    }
    if (fullness < 20) { 
      fullness = fullness + stats.beesEaten;
    }
    // Countdown for the hero to get bored
    lastPlayed = (millis() - playTime) / 1000;
    bored = 20 - lastPlayed;
    if (bored <= 0) {
      joy = joy - 1;
      playTime = millis();
      joy = constrain(joy, 0, 20);
    }
    joy = joy + stats.gameWon;
  }
}
 
