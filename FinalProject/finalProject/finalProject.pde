// Tamagotchi 2.0
// The idea  behind Tamagotchi 2.0 is to create a virtual pet for those who are too busy to have a live one. 
// Although this idea is not a new one, it deserves some attention and could be reworked a little bit to be 
// suitable for adults  instead of children. 
// The main concept is to create a selection of mini games to keep the virtual pet in a good mood and help it grow. 
// The pet will also require feeding and attention to develop certain positive character traits; 
// or, in case of neglect, it will develop negative character traits (violent behavior or, maybe, unhealthy eating habits?). 
// The Tamagotchi will also have different appearance depending on how it is treated.
// The Tamagotchi will be controlled by the arrow keys, the mini games will be activated from the menu, and the progress 
// and current state (hunger level, boredom level) will be displayed at the top of the screen.
// This ability to influence the development and growth of the virtual creature is aimed at creating a “special bond” 
// between the user and the Tamagotchi that expands the usual gaming experience.
// Since our lives become increasingly busy and free time more and more limited, I find this project worthy exploration because 
// it can become a great stress reliever as well as virtual companion or toy to replace a real pet.

import sprites.*;
import sprites.maths.*;
import sprites.utils.*;

boolean right = false;
boolean left = false;
boolean up = false;
boolean down = false;
int hiveX = 40;
int hiveY = 40;
int hiveSize = 80;
PImage hiveImg;

// We'll be using one object from the Hero class
Hero hero;
// Create a sprite for the hero
Sprite blob;
// and a StopWatch to keep track of time elapsed for sprite animation
StopWatch timer = new StopWatch();;

Stats stats;
// And an array list of bees (so that we can target them individually when necessary)
ArrayList<Bee> bees = new ArrayList<Bee>();

void setup() {
  size(800, 400);
  // Create an instance of Hero
  hero = new Hero();
  hiveImg = loadImage("hive.png");
  // Create Sprite by providing "this", the file with the spritesheet, the number of columns and rows in the sheet, and the z-index
  blob = new Sprite(this, "blob.png", 4, 4, 0);
  stats = new Stats();
}

void draw() {
  background(255);
  // Draw a bee hive
  imageMode(CENTER);
  image(hiveImg, hiveX, hiveY, hiveSize, hiveSize);
  
  // We get the time elapsed since the last frame (the deltaTime)
  double deltaTime = timer.getElapsedTime();
  // We update the sprites in the program based on that delta
  S4P.updateSprites(deltaTime);
  // Then we draw them on the screen
  S4P.drawSprites();
  
  // Apply gravity to the hero so that he doesn't float when jumps up
  PVector gravity = new PVector(0, 150);
  hero.applyForce(gravity);
  
  // update and display hero
  hero.update();
  //hero.display();
  stats.update();
  stats.display();
  
  // go through the array list of bees, check if they collide with hero, update and display them
  for (int b=0; b < bees.size(); b++) {
    Bee bee = (Bee)bees.get(b);
    bee.update();
    bee.display();
    bee.checkCollision(hero);
  }
}

// Check if any of control keys is pressed
void keyPressed() {
  if (keyCode == RIGHT) {
    right = true;
  }
  if (keyCode == LEFT) {
    left = true;
  }
  if (keyCode == UP) {
    up = true;
  }
  if (keyCode == DOWN) {
    down = true;
  }
}  

// making sure that the movement stops when the key is released
void keyReleased() {
  if (keyCode == LEFT && hero.acceleration.x < 0) {
    left = false;
  } 
  else if (keyCode == RIGHT && hero.acceleration.x > 0) {
    right = false;
  }
  if (keyCode == UP && hero.acceleration.y < 0) {
    up = false;
    
  } 
  else if (keyCode == DOWN && hero.acceleration.y > 0) {
    down = false;
  }
 } 

// When hive is clicked bees are spawnd. Can only work when there are no other bees on screen  
void mousePressed() {
  if (dist(mouseX, mouseY, hiveX, hiveY) < hiveSize/2 && bees.size() == 0) {
    for(int b = 0; b < 10; b++) {
      bees.add(new Bee());
    }
  }
}