// Tamagotchi 2.0

boolean right = false;
boolean left = false;
boolean up = false;
boolean down = false;

// We'll be using one object from the Hero class
Hero hero;

// And an array list of bees (so that we can target them individually when necessary)
ArrayList bees = new ArrayList();

void setup() {
  size(800, 400);
  // Create an instance of Hero
  hero = new Hero();
  
  // Several bees
  bees.add(new Bee());
  bees.add(new Bee());
  bees.add(new Bee());
  bees.add(new Bee());
  bees.add(new Bee());
}

void draw() {
  background(255);
  
  // Apply gravity to the hero so that he doesn't float when jumps up
  PVector gravity = new PVector(0,150);
  hero.applyForce(gravity);
  
  // update and display hero
  hero.update();
  hero.display();
  
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