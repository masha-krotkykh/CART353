// A class that contains the image that will be manipulated by user
class Image {

  
  PImage img;
  int x = 0;
  int y = 0;

  boolean firstClicked = false;

  //Constructor for the image
  Image(String tempImg, int tempX, int tempY) {
    x = tempX;
    y = tempY;
    img = loadImage(tempImg);
  }

  void display() {
    //loading image pixels for non-destructive editing
    loadPixels();
    img.loadPixels();
    
    
 //Checking if one of four squares has been clicked an if so, displaying corresponding
 // quarter of aan image
      if(firstClicked) {
        for (int y = 0; y < height/2; y++) {
          for (int x = 0; x < width/2; x++) {
            int loc = x + y * width;
      
          float r = red (img.pixels[loc]);
          float g = green (img.pixels[loc]);
          float b = blue (img.pixels[loc]);
          pixels[loc] = color(r,g,b);
          }
        }
      }

    updatePixels();
  }
  
}