// A crossfade of 2 images on mousePress
Image img;

void setup() {
  size(400, 400);
//Constructor for our merging image  
  img = new Image("dog1.jpg", "dog2.jpg", 0, 0); 
}

void draw() {
  //Calling functions from Image class
  img.checkMouse();
  img.display();  
}