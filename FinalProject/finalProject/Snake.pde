// Based on Snake Game by Daniel Shiffman // https://youtu.be/AaGK-fj-BAM

// Class for Snake object
// Variables for the snake
class Snake {
  PImage shine = loadImage("shine.png");
  PImage firefly = loadImage("firefly.png");
  float x = width/2;
  float y = height/2;
  float speedX = 0;
  float speedY = 0;
  ArrayList<PVector> tail = new ArrayList<PVector>();

  Snake() {
  }

  // Check collision
  // If snake touches target, return value of true, increase the snake size and increase hero's joy level
  boolean eat(PVector pos) {
    float d = dist(x, y, pos.x, pos.y);
    if (d < snek.size) {
      snek.total++;
      hero.joy += 300;
      return true;
    } 
    // otherwise return false
    else {
      return false;
    }
  }
  
  // Update snake depending on its progress
  void update() {
    if (snek.total > 0) {
      if (snek.total == tail.size() && !tail.isEmpty()) {
        tail.remove(0);
      }
      tail.add(new PVector(x, y));
    }
    
    // Update location by speed (increase speed depending on progress)
    x = x + speedX * (2 + snek.total/20);
    y = y + speedY * (2 + snek.total/20);
    
    // If snake hits a wall, game ends and snake's progress resets to 0
    if (x + snek.size/2 >= snek.margin + snek.screenWidth || x - snek.size/2 <= snek.margin || y + snek.size/2 >= height - snek.margin || y - snek.size/2 <= snek.margin) {
      tail.clear();
      fail();
    }
  }
 
 // Function for endgame executes when snake hits a wall
 // snake stops, resets its position
  void fail() {
    speedX = 0;
    speedY = 0;
    x= width/2;
    y = height/2;
    up = false;
    down = false;
    left= false;
    right = false;
    // Return to game screen
    state = 2;
    // When the game ends every 10 eaten targets add 1 point to levelUp in stats
    stats.levelUp = stats.levelUp + int(snek.total / 10);
    // And the total value gets reset to 0
    snek.total = 0;
  }

  // Display the snake
  // loop through the array of snake's tale to display each section
  void show() {
    for (PVector v : tail) {
      imageMode(CENTER);
      image(shine, v.x, v.y, snek.size, snek.size);
    }
    // display the snake's head
    image(firefly, x, y, snek.size, snek.size);    
  }
}
