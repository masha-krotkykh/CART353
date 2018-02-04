
// Import the video library
import processing.video.*;

Capture video;

// An array of movers to display
RandomMover[] movers = new RandomMover[5];

// Create the movers and starts the webcam

void setup() {
  size(640, 480);
  for (int i = 0; i < movers.length; i++) {
    // Each RandomMover just starts with random values 
    movers[i] = new RandomMover(random(0,width),random(0,height),random(-10,10),random(-10,10),random(20,50),color(random(255)));
  }
  
  // Start up the webcam
  video = new Capture(this, 640, 480, 30);
  video.start();
}

// Processes the frame of video, draws the video to the screen, updates the RandomMovers

void draw() {
  // Processes the current frame of video
  handleVideoInput();

  // Draw the video frame to the screen
  image(video, 0, 0);
  
  // Loop through array of movers to update and display them
  for (int i = 0; i < movers.length; i++) {
   movers[i].update();
   movers[i].display();

  }

}

// handleVideoInput
//
// Checks for available video, reads the frame

void handleVideoInput() {
  // Check if there's a frame to look at
  if (!video.available()) {
    // If not, then just return, nothing to do
    return;
  }
  
  // If we're here, there IS a frame to look at so read it in
  video.read();

}