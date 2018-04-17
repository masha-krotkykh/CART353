// Tamagotchi 2.0
// It is simple and satisfying to take care of a virtual pet without having to commit to having a real one. 
// Tamagotchi must be fed and played with in order to stay in a good mood and in a good health. 
// If Tamagotchi gets hungry, he gets sad, if he is neglected for too long he gets mad and scary as well as his surroundings. 
// If no actions are performed he falls asleep. If he is too bored and too hungry, he dies. 
// There are two mini games user can play to entertain and train his pet, which also helps him grow.
// DON'T LET YOUR TAMAGOTCHI STARVE OR PINE!

import sprites.*;
import sprites.maths.*;
import sprites.utils.*;
PImage bgImg;
PImage bgNormal;
PImage bgAngry;

// By default none of controll keys are pressed
boolean right = false;
boolean left = false;
boolean up = false;
boolean down = false;

// Variables for hive and stone size and location
int hiveX = 40;
int hiveY = 90;
int hiveSize = 80;
float hiveRot;
PImage hiveImg;

int stoneWidth = 100;
int stoneHeight = stoneWidth/2;
int stoneX = 750;
int stoneY = 375;
float stoneLift;
PImage stoneImg;

// Hero animation sprite sheet
String currentSprite;

// By default start with the main screen
int state = 1;

// JSON file that will be created as soon as any progress is made
File progress;

// We'll be using one object from the Hero class
Hero hero;
// Create a sprite for the hero
Sprite evolution;
// and a StopWatch to keep track of time elapsed for sprite animation
StopWatch timer = new StopWatch();
// One instance of UI, stats, and each mini-game
UI ui;
Stats stats;
Snek snek;
Bubbles bubbles;
// And an array list of bees (so that we can target them individually when necessary)
ArrayList<Bee> bees = new ArrayList<Bee>();
ArrayList<Scorpio> scorpios = new ArrayList<Scorpio>();

void setup() {
  size(800, 420);
  // Create an instance of Stats, UI, Snake game, Bubble game, and Hero
  stats = new Stats();
  ui = new UI();
  snek = new Snek();
  bubbles = new Bubbles();
  hero = new Hero();
  
  // load images for hive and stone
  hiveImg = loadImage("hive.png");
  stoneImg = loadImage("stone.png");
  //images for the background
  bgNormal = loadImage("bg_normal.jpg");
  bgAngry = loadImage("bg_angry.jpg");
  
  // Create Sprite by providing "this", the file with the spritesheet, the number of columns and rows in the sheet, and the z-index
  evolution = new Sprite(this, "blob.png", 14, 12, 0);
  // Check if the file with current progress exists
  // if it does, load progress from the file
  progress = new File(dataPath("stats.json"));
  if (progress.exists()) {
    stats.loadProgress();
  }
}

void draw() {
  // Display the current screen according to the game stage
  
  // mainScreen is the stage where Tamagotch lives
  if(state == 1) {
    mainScreen();
  }
  // main gamesScreen displays when user wants to play a game
  else if(state == 2) {
    ui.gamesScreen();
  }
    
  // snake game
  else if(state == 21) {
    ui.snakeScreen();
  }
  
  // bubbles game
  else if(state == 22) {
    ui.bubblesScreen();
  }
  
  else if(state == 0) {
    ui.endScreen();
  }
}

void mainScreen() {  
  // 0 is default state of Hero, 14 is an angry state
  // display corresponding backgrounds
  if(hero.heroState == 0) {
    bgImg = bgNormal;
  }
  if(hero.heroState == 14) {
    bgImg = bgAngry;
  }
  background(bgImg);
  // Draw a bee hive and stone
  imageMode(CENTER);
  image(stoneImg, stoneX, stoneY + stoneLift, stoneWidth, stoneHeight);
  pushMatrix();
  translate(hiveSize/2,0);
  imageMode(CENTER);
  rotate(hiveRot);
  image(hiveImg, hiveX - hiveSize/2, hiveY, hiveSize, hiveSize);
  popMatrix();

  // We get the time elapsed since the last frame (the deltaTime)
  double deltaTime = timer.getElapsedTime();
  // We update the sprites in the program based on that delta
  S4P.updateSprites(deltaTime);
  // Then we draw them on the screen
  S4P.drawSprites();
  
  // Apply gravity to the hero so that he doesn't float when jumps up
  PVector gravity = new PVector(0, 150);
  hero.applyForce(gravity);

  // update, display, and save progress
  stats.progress();
  stats.saveProgress();
  stats.update();
  stats.display();
    
  // update and display hero
  hero.update();
  
  // go through the array list of bees, check if they collide with hero, update and display them
  for (int b = 0; b < bees.size(); b++) {
    Food bee = (Bee)bees.get(b);
    bee.update();
    bee.display();
    bee.checkCollision(hero);
  }
  
   // go through the array list of scorpios, check if they collide with hero, update and display them
  for (int s = 0; s < scorpios.size(); s++) {
    Food scorpio = (Scorpio)scorpios.get(s);
    scorpio.update();
    scorpio.display();
    scorpio.checkCollision(hero);
  }
  
    // if hero dies go to end screen
  if (hero.deceased) {
    state = 0;
  }
}

// Check if any of control keys is pressed
void keyPressed() {
  // When any key is pressed inactivity timer gets reset
  // if hero is asleep he'll wake up
  hero.resetTimer();
  hero.inactivityCountdown = true;

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
    left = false;
    right = false;
    down = false;
    up = false;
 } 

void mousePressed() {
  // When mouse is pressed inactivity timer gets reset
  // if hero is asleep he'll wake up
  hero.resetTimer();
  hero.inactivityCountdown = true;
  
  // When hive is clicked it rotates slightly 
  if (dist(mouseX, mouseY, hiveX, hiveY) < hiveSize/2) {
    hiveRot = random(-0.2, 0.2);
  } 
  // when the rock is clicked it lifts up
  else if (dist(mouseX, mouseY, stoneX, stoneY) < stoneHeight) {
    stoneLift = -10;
  }
}
// When mouse on hive is released bees are spawnd and hive returns to its normal position. Can only work when there are no other bees on screen
void mouseReleased() {
  if (dist(mouseX, mouseY, hiveX, hiveY) < hiveSize/2) {
    if (bees.size() == 0) {
      for(int b = 0; b < 10; b++) {
        bees.add(new Bee());
      }
    }
    hiveRot = 0;
  }
  // Same for scorpions
  else if (dist(mouseX, mouseY, stoneX, stoneY) < stoneHeight) {
    if (scorpios.size() == 0) {
      for(int s = 0; s < 5; s++) {
        scorpios.add(new Scorpio());
      }
    }
    stoneLift = 0;
  }
  
  // if user wants to play a game
  if (state == 1 && dist(mouseX, mouseY, stats.playX, stats.playY) < stats.statsHeight / 2) {
    state = 2;
  }
}
