// Class for targets in bubble game to populate the arrayList

class Aim {
  
  float x;
  float y;
  float w;
  boolean collide;
  
  Aim(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
  }
  
  void display() {
    // Display the circle
    fill(255);
    stroke(100);
    ellipse(x, y, w, w);
  }
}
