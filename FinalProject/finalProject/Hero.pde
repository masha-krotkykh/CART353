// class do define the main character
class Hero {
  // Main properties
  PVector location;
  PVector velocity;
  PVector acceleration;
  int hWidth = 40;
  int hHeight = 80;
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
  //depending on hero's current condition his avatar will be either good or bad 
  int mood = 0;
  //depending on current level avatar will grow
  int growth = 0;
  
  Hero() {
    // PVectors to model hero's movement
    location = new PVector(width/2, yOffset);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    mass = 30;
  }
  
  // Model gravity so that the hero gets back down after a jump
  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }
  
  void update() {
    // Update position by velocity and velocity by acceleration
    // Create movement (constrain horizontal speed)
    velocity.add(acceleration);
    velocity.x = constrain(velocity.x, -5, 5);
    location.add(velocity);
    acceleration.mult(0);
    // Constrain hero's location within the window
    location.y = constrain(location.y, hHeight / 2, yOffset);
    location.x = constrain(location.x, hWidth / 2, width - hWidth / 2);
    
    // If hero is sad or hungry, his avatar will be changed to an evil doppelganger
    if (joy < 6 || fullness < 6) {
      // switching to the second row of the sprite sheet
      mood = 12;
    }
    else mood = 0;
    
    if (stats.level < 1) {
      growth = 0;
    }
    else if (stats.level >= 1 && stats.level < 2) {
      growth = 24;
    }
    else if (stats.level >=2 && stats.level < 3) {
      growth = 48;
    }
    else if (stats.level >= 3 ) {
      growth = 72;
    }


    // Move when one of the arrow keys is pressed 
    // Set the hero's location and frame sequences from the sprite to animate
    evolution.setXY(hero.location.x, hero.location.y);
    if (right == true) {
      acceleration.x = speed;
      evolution.setFrameSequence(growth + mood + 8, growth + mood + 11, 0.2);
    }
    else if (left == true) {
      acceleration.x = -speed;
      evolution.setFrameSequence(growth + mood + 4, growth + mood + 7, 0.2);
    }
    else {
      acceleration.x = 0;
      velocity.x = 0;
      evolution.setFrameSequence(growth + mood + 0, growth + mood + 3, 0.3);
    }
    if (up == true) {
      acceleration.y = -speed * 30;
    }
    else if (down == true) {
      acceleration.y = speed;
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
    if (joy < 20) { 
      joy = joy + stats.gamesWon;
    }
  }
}
