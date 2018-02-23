
Roller roller;
boolean rollRight = false;
boolean rollLeft = false;
boolean rollUp = false;
boolean rollDown = false;
float moveRight = 0;

void setup(){
  size(640, 480);
  roller = new Roller();
}

void draw() {
  background(255);
 
  roller.update();
  roller.display();
  roller.checkEdges();

}

void keyPressed() {
  if (keyCode == RIGHT) {
    rollRight = true;
  }
  if (keyCode == UP) {
    rollUp = true;
  }
  if (keyCode == LEFT) {
    rollLeft = true;
  }
  if(keyCode == DOWN) {
    rollDown = true;
  }
}  

void keyReleased() {
  rollRight = false;
  rollLeft = false;
  rollUp = false;
  rollDown = false;
}  