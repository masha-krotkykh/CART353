// Walker
//
// A class that defines a circle that can move around on the screen with nextGaussian() function 

class Walker {
  
  // Variables for position
  float x;
  float y;

  // The size of the Walker
  float size = 50;

  // Standard deviation
  int sd;

  // Creates a Walker with the provided values

  Walker(float tempX, float tempY, int tempSd) {
    x = tempX;
    y = tempY;
    sd = tempSd;
  }

  void update() {

    // Update Walker's position on X- and Y-axis
    // nextGaussian() returns a value between 0 and 1
    // get new position by multiplying this value by standard deviation
    float xdir = (float)generator.nextGaussian() * sd;
    float ydir = (float)generator.nextGaussian() * sd;

    // add xdir and yrid to current location to give us our new position
    x += xdir;
    y += ydir;

    // Constrain the Walker within the window
    x = constrain(x, 0, width-1);
    y = constrain(y, 0, height-1);
  }

  void display() {
    noStroke();
    ellipse(x, y, 50, 50);
  }
}