// Swapping parts of the image to another and back by clicking on correspondant quarter
// of the screen

// An image that will be used as a background
PImage bg;

// Calling for one object from the Image class
Image front;

//Setting up a 400x400 canvas
void setup() {
  size(400, 400);
  //loading a background image
  bg  = loadImage("dog2.jpg");
  
  //Constructor for the image that will appear on top of the background
  front = new Image("dog1.jpg", 0, 0);
}

void draw() {
  //setting up background
  background(bg);
  //and calling for Image class functions 
  front.display();
}

//A function to switch Clicked state on corresponding part of the image
void mouseClicked() {
  if(mouseX > 0 && mouseX <= width / 2 && mouseY > 0 && mouseY <= height / 2) { 
    front.firstClicked = !front.firstClicked; 
  }
  if(mouseX > width / 2 && mouseX <= width && mouseY > 0 && mouseY <= height / 2){ 
    front.secondClicked = !front.secondClicked; 
  } 
  if(mouseX > 0 && mouseX <= width / 2 && mouseY > height / 2 && mouseY <= height){ 
    front.thirdClicked = !front.thirdClicked; 
  } 
  if(mouseX > width / 2 && mouseX <= width && mouseY > height / 2 && mouseY <= height){ 
    front.fourthClicked = !front.fourthClicked; 
  } 
}

void keyPressed() {
  if(key == 's' || key == 'S') {
    save("image.jpg");
  }
}