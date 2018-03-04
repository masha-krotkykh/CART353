boolean right = false;
boolean left = false;
boolean up = false;
boolean down = false;

Hero hero;
ArrayList bees = new ArrayList();

void setup() {
  size(800, 400);
  hero = new Hero();
  
  bees.add(new Bee());
  bees.add(new Bee());
  bees.add(new Bee());
  bees.add(new Bee());
  bees.add(new Bee());
}

void draw() {
  background(255);
 PVector gravity = new PVector(0,150);
    hero.applyForce(gravity);
  hero.update();
  hero.display();
  
  for (int b=0; b < bees.size(); b++) {
    Bee bee = (Bee)bees.get(b);
    bee.update();
    bee.display();
  }
}

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