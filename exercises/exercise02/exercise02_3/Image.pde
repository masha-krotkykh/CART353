// A class that contains the image that will be manipulated by user
class Image {

  PImage dog1;      
  PImage dog2;
  
  int x;
  int y;
  
  // RGB colour values for the merged image 
  float r;
  float g;
  float b;
  // RGB colour values of each of the two source images
  float r1; 
  float g1; 
  float b1;
  float r2; 
  float g2; 
  float b2;

  // booleans that, if true, take RGB values from the first image, if false - from the second
  boolean redOne = true;
  boolean greenOne = true;
  boolean blueOne = true;

  
  //Constructor for the image
  Image(String first, String second, int tempX, int tempY) {
    x = tempX;
    y = tempY;
    dog1 = loadImage(first);
    dog2 = loadImage(second);
  }

  void display() {
    //loading image pixels for non-destructive editing
    loadPixels();
    dog1.loadPixels();
    dog2.loadPixels();
    
        for (int y = 0; y < height; y++) {
          for (int x = 0; x < width; x++) {
            int loc = x + y * width;
            
            // color1 and color2 to differenciate between two source images 
            color color1 = dog1.pixels[loc];
            color color2 = dog2.pixels[loc];
            
            // Retrieve and separate RGB values for both images
            r1 = red(color1); 
            g1 = green(color1); 
            b1 = blue(color1);
            r2 = red(color2); 
            g2 = green(color2); 
            b2 = blue(color2);

          // keyPressed function in the main program is responsible for changing value of these booleans
          // from true to false and back on pressing the corresponding key (1 - for red value, 2 - for green and 3 - for blue)
          // if the value of boolean == true, the color value is taken from the first image, if the boolean value == false, the 
          // colour value will be taken from the second image
          if(redOne) {
            r = r1;
          }
          else {
            r = r2;
          }
          
          if(greenOne) {
            g = g1;
          }
          else {
            g = g2;
          }
          if(blueOne) {
            b = b1;
          }
          else {
            b = b2;
          }
            // Setting the new color
            pixels[loc] = color(r, g, b);

          }
        }
 
    updatePixels();
  }
  
}