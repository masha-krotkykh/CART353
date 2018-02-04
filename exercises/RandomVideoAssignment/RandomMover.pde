// Bouncer
//
// A class that defines a circle that can move around on the screen

class RandomMover {

  // Variables for position
  float x;
  float y;

  // Variables for velocity
  float vx;
  float vy;

  // The size of the RandomMover
  float size;

  // The current fill colour of the RandomMover
  color fillColor;

  // The default fill colour of the RandomMover
  color defaultColor;
  
  float tx = random(0,100);
  float ty = random(0,100);
  float speed = 3;


  // RandomMover(tempX,tempY,tempVX,tempVY,tempSize,tempDefaultColor)
  //
  // Creates a Bouncer with the provided values by remembering them.

  RandomMover(float tempX, float tempY, float tempVX, float tempVY, float tempSize, color tempDefaultColor) {
    x = tempX;
    y = tempY;
    vx = tempVX;
    vy = tempVY;
    size = tempSize;
    defaultColor = tempDefaultColor;
    fillColor = defaultColor;
  }

  // update()
  //
  // Adds the Bouncer's current velocity to its position
  // and checks for bouncing off the walls.
  void update() {
    float vx = speed * (noise(tx) * 2 - 1);
    float vy = speed * (noise(ty) * 2 - 1);
    x += vx;
    y += vy;
    
    // small time increments for smoother movements
    tx += 0.01;
    ty += 0.05;
    

    // if y is bigger than the height or smaller than 0, "wraps" around the window vertically
    if (y > height) {
      y = y - height;
    }
    else if (y < 0) {
      y = y + height;
    }
    
    // if x is bigger than the width or smaller than 0, "wraps" around the window horizontally
    if (x > width) {
      x = x - width;
    }
    else if (x < 0) {
      x = x + width;
    }
  }

  // display()
  //
  // Draw an ellipse in the Bouncer's location, with its size
  // and with its fill
  void display() {
    noStroke();
    fill(fillColor);
    ellipse(x, y, size, size);
  }
}