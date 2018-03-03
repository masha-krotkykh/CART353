boolean right = false;
boolean left = false;
boolean up = false;
boolean down = false;

Hero hero;

void setup() {
  size(800, 600);
  hero = new Hero();
}

void draw() {
  background(255);

  hero.update();
  hero.display();
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