// class do define the main character

class Hero {
  // Main properties: location, velocity, acceleration, size, speed, mass, fullness, joy
  PVector location;
  PVector velocity;
  PVector acceleration;
  int hWidth = 40;
  int hHeight = 80;
  float speed = 0.2;
  float mass;
  // An offset so that Hero doesn't touch r=the bottom edge
  int yOffset = height - 60;
  // variables to determine hero's state
  int maxFullness = 21000;
  int maxJoy = 27000;
  int fullness;
  int joy;
  boolean deceased = false;

  //depending on hero's current condition his avatar will be either good or bad 
  int heroState = 0;
  //depending on current level avatar will grow
  int growth = 0;

  // Will be activated when no actions are performed. After 1 minute Tamagotchi will fall asleep
  boolean inactivityCountdown = true;
  int startTime = 0;
  int timeElapsed;
  int snoozeTime = 60;

  Hero() {
    // PVectors to model hero's movement
    location = new PVector(width/2, yOffset);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    
    mass = 30;
    fullness = maxFullness;
    joy = maxJoy;
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
    location.y = constrain(location.y, hHeight / 2 + stats.statsHeight / 2, yOffset);
    location.x = constrain(location.x, hWidth / 2, width - hWidth / 2);
  
    // If hero is ignored and not exercised his avatar will be changed to an evil doppelganger; he gets sad when hungry
    // heroState and growth will define image sequences in the sprite sheet
    if (joy < maxJoy / 2) {
      heroState = 14;
    } 
    else if (fullness < maxFullness / 2) {
      heroState = 28;
    } 
    else heroState = 0;
    // switching to the corresponding row of the sprite sheet depending on hero's current joy level and age
    if (stats.level < 1) {
      growth = 0;
    } 
    else if (stats.level >= 1 && stats.level < 2) {
      growth = 42;
    } 
    else if (stats.level >=2 && stats.level < 3) {
      growth = 84;
    } 
    else if (stats.level >= 3 ) {
      growth = 126;
    }

    // Hero gets hungrier and sadder over time
    fullness--;
    joy--;

    fullness = constrain(fullness, 0, maxFullness);
    joy = constrain(joy, 0, maxJoy);
    
    
    // If no actions are taken hero falls asleep in 60 seconds
    if (inactivityCountdown) {
      timeElapsed = (millis() - startTime) / 1000;
      snoozeTime = 60 - timeElapsed;
    }  

    // Move when one of the arrow keys is pressed and the hero is not dead
    // Set the hero's location and frame sequences from the sprite to animate
    evolution.setXY(hero.location.x, hero.location.y);
    // When timer gets to 0 Hero goes to sleep 
    // Timer stops
    if (snoozeTime <= 0) {
      evolution.setFrameSequence(growth + heroState + 12, growth + heroState + 13, 0.6);
      inactivityCountdown = false;
    }
    else {
      if (right == true) {
        acceleration.x = speed;
        evolution.setFrameSequence(growth + heroState + 8, growth + heroState + 11, 0.2);
      } 
      else if (left == true) {
        acceleration.x = -speed;
        evolution.setFrameSequence(growth + heroState + 4, growth + heroState + 7, 0.2);
      } 
      else {
        acceleration.x = 0;
        velocity.x = 0;
        evolution.setFrameSequence(growth + heroState + 0, growth + heroState + 3, 0.3);
      }
      if (up == true) {
        acceleration.y = -speed * 30;
      } 
      else {
        acceleration.y = 0;
        velocity.y = 0;
      }
    }
    // If hero is starving and pining he dies
    if (joy <= 0 && fullness <= 0) {
      deceased = true;  
    }
  }

  // Function will be called when any key or mouse is pressed
  // makes hero wake up
  void resetTimer() {
    snoozeTime = 60;
    startTime = millis();
  }
}
