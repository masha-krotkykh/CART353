// A class that defines the behaviour of two images
class Image {

  PImage dog1;      
  PImage dog2;
  
  int x;
  int y;
  //Not exactly an alfa transparency but persentage of one image present 
  float alfa = 0;
  //Increment for fading in/out
  float fade = 0.003;
 
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
  
  // Constructor for the merged image
  Image(String first, String second, int tempX, int tempY) {
    dog1 = loadImage(first);
    dog2 = loadImage(second);
    x = tempX;
    y = tempY;
  }  
  
  void display() {
    loadPixels();
    // Retrieving pixel information of both images
    dog1.loadPixels();
    dog2.loadPixels();
  
    for (int x = 0; x < width; x++ ) {
      for (int y = 0; y < height; y++ ) {
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

        // Combine RGB values of two images in different proportions to achieve crossfade effect
        // when image "fades in", the other one "fades out" at the same rate
        r = alfa*r1+(1.0-alfa)*r2;
        g = alfa*g1+(1.0-alfa)*g2;
        b = alfa*b1+(1.0-alfa)*b2;
        // Setting the new color
        pixels[loc] = color(r, g, b);
      }
    }
    
    updatePixels();
    }
  
  // The crossfade only occures when the mouse is pressed. When the value of alfa reaches 
  // 1, instead of going down, it starts going up because fade variable changes its value
  // to opposite. Same happens when alfa reaches 0.
  void checkMouse() {
    if(mousePressed) {
      alfa = alfa + fade;
    }
    if (alfa >= 1 || alfa < 0) {
      fade = -fade;
    }
  }

}