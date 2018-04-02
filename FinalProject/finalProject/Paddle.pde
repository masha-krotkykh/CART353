// Class for paddle in bubbles game

class Paddle {
  // Main variables for position, size, speed, and velocity
  int paddleX;
  int paddleY;
  int paddleVX;
  int paddleSpeed = 5;
  int paddleWidth = 150;
  int paddleHeight = 16;
  
  Paddle(){
  }
  
   //Sets up padle at the bottom center of the window
  void setupPaddle() {
    paddleX = width/2;
    paddleY = height - paddleHeight;
    paddleVX = 0;
  }
  
    //Calls new instance of paddle at the new position which is starting position + velocity. Movement is constrained within the width of the window.
  void updatePaddle() {
    paddleX += paddleVX;  
    paddleX = constrain(paddleX, paddleWidth/2, width-paddleWidth/2);
    
    // Depending on what key is pressed, paddle moves to the right or to the left
    if (bubbles.right == true) {
      paddleVX = paddleSpeed;
    }
    else if (bubbles.left == true) {
      paddleVX = -paddleSpeed;
    }
    else {
      paddleVX = 0;
    }
  }
  
  //Loop draws paddle that now consists of smaller rectangles of random width between 25 and 100; Colour of the squares also changes randomly.
  
  void drawPaddle() {
    int squareWidth = floor(random(5, 60));
    int squareHeight = paddleHeight;
    int rightSquareX = paddleX;
    int leftSquareX = paddleX - squareWidth;
    int squareY = paddleY + paddleHeight/2;
   
    int r = floor(random(255));
    int g = floor(random(10));
    int b = floor(random(200));
    color squareColor = color(r, g, b);
  
    while (rightSquareX+squareWidth < paddleX + paddleWidth/2) {
      noStroke();
      fill(squareColor);
      rect(rightSquareX, squareY, squareWidth, squareHeight);
      rect(leftSquareX, squareY, squareWidth, squareHeight);
      rightSquareX = rightSquareX + squareWidth;
      leftSquareX = leftSquareX - squareWidth;
    }
  }
}
