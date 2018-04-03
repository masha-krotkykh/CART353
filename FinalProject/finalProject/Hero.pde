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
  int maxFullness = 21000;
  int maxJoy = 27000;
  int fullness;
  int joy;

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
    location.y = constrain(location.y, hHeight / 2, yOffset);
    location.x = constrain(location.x, hWidth / 2, width - hWidth / 2);
    
    // If hero is sad or hungry, his avatar will be changed to an evil doppelganger
    if (joy < maxJoy / 2) {
      mood = 12;
    }
    else mood = 0;
    // switching to the corresponding row of the sprite sheet depending on hero's current joy level and age
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
    
    // Hero gets hungrier and sadder over time
    fullness--;
    joy--;
    
    fullness = constrain(fullness, 0, maxFullness);
    joy = constrain(joy, 0, maxJoy);

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

    println(fullness, joy);
  }
}
