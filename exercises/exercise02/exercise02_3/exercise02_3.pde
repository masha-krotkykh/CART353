// Changing RGB channels separately from one or another image on pressing 1,2,3 keys

// Calling for one object from the Image class
Image merged;

//Setting up a 400x400 canvas
void setup() {
  size(400, 400);

  //Constructor for the image
  merged = new Image("dog1.jpg", "dog2.jpg", 0, 0);
}

void draw() {
  //and calling for Image class functions
  merged.display();
}

// A function that switches values of booleans on keyPress (to decide from which image a certain value of RGB will be taken)
void keyPressed() {
      if(keyCode == '1') {
        merged.redOne = !merged.redOne;
      }
      if(keyCode == '2') {
        merged.greenOne = !merged.greenOne;
      }
      if(keyCode == '3') {
        merged.blueOne = !merged.blueOne;
      }
      if(key == 's' || key == 'S') {
        save("image.jpg");
      }
}