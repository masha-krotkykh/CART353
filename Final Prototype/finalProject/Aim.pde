// Class for targets in bubble game to populate the arrayList

class Aim {
  
  float x;
  float y;
  float aimHeight;
  float aimWidth;
  boolean collide;
  PImage comb;
  
  Aim(PImage tempImg, float tempX, float tempY, float tempAimWidth, float tempAimHeight) {
    x = tempX;
    y = tempY;
    aimHeight = tempAimHeight;
    aimWidth = tempAimWidth;
    comb = tempImg;
  }
  
  void display() {
    // Display the honeycomb
    imageMode(CENTER);
    image(comb, x, y, aimWidth, aimHeight);
  }
}
