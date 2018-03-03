// class do define the main character
class Hero {
  int x;
  int y;
  float vx;
  float vy;
  int hWidth = 40;
  int hHeight = 40;
  PImage hImage;
  int speed;
  float gravity = 1;
  float mass;
  
  Hero(int tempX, int tempY) {
    x = tempX;
    y = tempY;
    speed = 2;
    mass = 20;
  }
  
  void update() {
    x += vx;
    y += vy;
    
    y = constrain(y, hWidth / 2, height - hWidth / 2);
    x = constrain(x, hHeight / 2, width - hHeight / 2);
    
  if (right == true) {
    vx = speed;
  }
  else if (left == true) {
    vx = -speed;
  }
  else {
    vx = 0;
  }
  if (up == true) {
    vy = -speed;
  }
  else if (down == true) {
    vy = speed;
  } 
  else {
    vy = 0;
  }
 }
  
  void display() {
    noStroke();
    fill(155);
    ellipse(x, y, hWidth, hHeight);
  }
}