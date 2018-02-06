// RandomMover
//
// A class that defines a circle that can move around on the screen with noise() function 

class RandomMover {

  // General variables to describe our RandomMover
  float x;
  float y;

  float vx;
  float vy;
  
  float tx = random(0,100);
  float ty = random(0,100);
  float speed;

  // Creates a RandomMover with the provided values
  RandomMover(float tempX, float tempY, float tempVX, float tempVY, float tempSpeed) {
    x = tempX;
    y = tempY;
    vx = tempVX;
    vy = tempVY;
    speed = tempSpeed;
  }

  // Adds the RandomMover's current velocity to its position
  // and checks for bouncing off the walls.
  void update() {
    float vx = speed * (noise(tx) * 2 - 1);
    float vy = speed * (noise(ty) * 2 - 1);
    x += vx;
    y += vy;
    
    // Constrain RandomMover's position within the window
    x = constrain(x, 0, width);
    y = constrain(y, 0, height);
    
    // small time increments for smoother movements
    tx += 0.03;
    ty += 0.05;
    

    // if y is bigger than the height or smaller than 0, bounces off vertically
    if (y > height || y < 0) {
      vy = -vy;
    }
    
    // if x is bigger than the width or smaller than 0, bounces off horizontally
    if (x  > width || x < 0) {
      vx = -vx;
    }
  }

  // Draw an ellipse in the Bouncer's location, with its size
  void display() {
    noStroke();
    ellipse(x, y, 50, 50);
  }
}