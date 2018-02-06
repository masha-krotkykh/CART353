// Based on
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com
// Example 16-3: Adjust video brightness
// And 
/* Rilla's solution to exercise I.5 of Daniel Shiffman's Nature of Code
A Gaussian random walk is defined as one in which the step size (how far the object moves in a 
given direction) is generated with a normal distribution. Implement this variation of our random walk.*/

// Import the video library
import processing.video.*;
import java.util.*;

Capture video;
RandomMover mover;
Walker walker;
Random generator;


// Create the mover and starts the webcam

void setup() {
  size(640, 480);
  colorMode(RGB);
// Constructing one instance of RandomMover that will move with noise()  
    mover = new RandomMover(random(0,width), random(0,height), random(-10,10), random(-10,10), 25);
// and one istance of Walker that will move with Gaussian distribution
    walker = new Walker(random(0,width), random(0,height), 20);
    generator = new Random();
    
    
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
    
    // Getting RGB values from the video feed
      float r = red(video.pixels[loc]);
      float g = green(video.pixels[loc]);
      float b = blue(video.pixels[loc]);
      
      // Calculate an amount to change red values based on proximity to the mover      
      float d = dist(x, y, mover.x, mover.y);      
      float adjustRed = map(d, 0, 30, 255, r); 
      // Calculate an amount to change blue values based on proximity to the walker 
      float d2 = dist(x, y, walker.x, walker.y);
      float adjustBlue = map(d2, 0, 50, 255, b);
      
      // Adjust corresponding values
      r *= adjustRed; 
      b *= adjustBlue;
      
      // Constrain red and blue values to make sure they are within 0-255 color range      
      r = constrain(r, 0, 255); 
      b = constrain(b, 0, 255);
    
      // Make a new color and set pixel in the window      
      color c = color(r, g, b);      
      pixels[loc] = c;    
    }  
  } 
 
 // Update the mover and the walker
 // We don't even need to display() them because they are not actually being drawn
   mover.update();
   walker.update();
  
  updatePixels();
}