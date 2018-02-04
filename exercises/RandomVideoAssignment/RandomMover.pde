// RandomMover
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
  float size = 50;

  // The current fill colour of the RandomMover
  color fillColor;

  // The default fill colour of the RandomMover
  color defaultColor;
  
  float tx = random(0,10000);
  float ty = random(0,10000);
  float speed;
   color c;   

  // RandomMover(tempX,tempY,tempVX,tempVY,tempSize,tempDefaultColor)
  //
  // Creates a Bouncer with the provided values by remembering them.

  RandomMover(float tempX, float tempY, float tempVX, float tempVY, float tempSpeed) {
    x = tempX;
    y = tempY;
    vx = tempVX;
    vy = tempVY;
    fillColor = defaultColor;
    speed = tempSpeed;
  }

  // update()
  //
  // Adds the Bouncer's current velocity to its position
  // and checks for bouncing off the walls.
  void update() {
    float vx = speed * (noise(tx) * 2 - 1);
    float vy = speed * (noise(ty) * 2 - 1);
    x += vx;
    x = constrain(x, 0, width);
    y += vy;
    y = constrain(y, 0, height);
    
    // small time increments for smoother movements
    tx += 0.03;
    ty += 0.05;
    

    // if y is bigger than the height or smaller than 0, bounces off vertically
    if (y + size > height || y - size < 0) {
      vy = -vy;
    }
    
    // if x is bigger than the width or smaller than 0, bounces off horizontally
    if (x + size  > width || x - size < 0) {
      vx = -vx;
    }
  }

  // display()
  //
  // Draw an ellipse in the Bouncer's location, with its size
  // and with its fill
  void display() {
    
    
    
    
 
    noStroke();
    //fill(c);
    ellipse(x, y, size, size);
  }
}