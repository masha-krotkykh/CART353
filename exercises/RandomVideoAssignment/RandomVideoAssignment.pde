// Based on
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com
// Example 16-3: Adjust video brightness

// Import the video library
import processing.video.*;

Capture video;
RandomMover mover;


// Create the mover and starts the webcam

void setup() {
  size(640, 480);
  colorMode(HSB);
    mover = new RandomMover(random(0,width), random(0,height), random(-10,10), random(-10,10), 5);

  
  // Start up the webcam
  video = new Capture(this, 640, 480);
  video.start();
}
void captureEvent(Capture video) {  
  // Read the image from the camera.  
  video.read();
}

void draw() {
  loadPixels();
  video.loadPixels();  
  for (int x = 0; x < video.width; x++) {    
    for (int y = 0; y < video.height; y++) {      
      // Calculate the 1D location from a 2D grid
      int loc = x + y * video.width;      
    
      float h = hue(video.pixels[loc]);
      float s = saturation(video.pixels[loc]);
      float br = brightness(video.pixels[loc]);
      
      // Calculate an amount to change saturation based on proximity to the mover      
      float d = dist(x, y, mover.x, mover.y);      
      float adjustsaturation = map(d, 0, 100, 10, 0);   
      
      s *= adjustsaturation;      
      
      // Constrain RGB to make sure they are within 0-255 color range      
      s = constrain(s, 0, 255);          
    
      // Make a new color and set pixel in the window      
      color c = color(h, s, br);      
      pixels[loc] = c;    
    }  
  } 
 
   mover.update();
   mover.display();
  
  updatePixels();
}