class Bubbles {
  color backgroundColor = color(0);
  
  int paddleX;
  int paddleY;
  int paddleVX;
  int paddleSpeed = 5;
  int paddleWidth = 150;
  int paddleHeight = 16;
  color paddleColor = color(255);
  
  int ballX;
  int ballY;
  int ballVX;
  int ballVY;
  int ballSpeed = 5;
  int ballSize = 16;
  color ballColor = color(255);
  int lives = 3;
  boolean right = false;
  boolean left = false;
  Bubbles() {
    setupPaddle();
    setupBall();
  }
  
  //Sets up padle at the bottom center of the window
  void setupPaddle() {
    paddleX = width/2;
    paddleY = height - paddleHeight;
    paddleVX = 0;
  }
  
  //Sets up the starting position of the ball in the center of the window
  void setupBall() {
    ballX = width/2;
    ballY = height/2;
    ballVX = ballSpeed;
    ballVY = ballSpeed;
  }
  
  //Redraws the background to clean the window from previous instances of ball, paddle and static
  //Redraws new instance of the ball, paddle and static by calling their functions
  void draw() {
    background(backgroundColor); 
    fill(255, 255, 255, 50);
    pushStyle();
    textSize(500);
    textAlign(CENTER);
    text(lives, width / 2, height - paddleHeight * 3);
    popStyle();
    
    updatePaddle();
    updateBall();
  
    drawPaddle();
    drawBall();
  }
  
  //Calls new instance of paddle at the new position which is starting position + velocity
  //(paddleVX) which is 0 by default. The movement is constrained within the width of the window.
  void updatePaddle() {
    paddleX += paddleVX;  
    paddleX = constrain(paddleX, paddleWidth/2, width-paddleWidth/2);
    if (right == true) {
      paddleVX = paddleSpeed;
    }
    else if (left == true) {
      paddleVX = -paddleSpeed;
    }
  }
  
  //Calls the new instance of the ball at the new position which is its starting poition + velocity
  //(ballVX) on X-axis and (ballVY) on Y-axis. By default both are equal 5 (ballSpeed). Calls functions handleBallHitPaddle(),
  //handleBallHitWall() and handleBallOffBottom().
  void updateBall() {
    ballX += ballVX;
    ballY += ballVY;
  
    handleBallHitPaddle();
    handleBallHitWall();
    handleBallOffBottom();
    handleEndGame();
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
  
  //Draws white "ball" in the center of the window of the size defined earlier (16x16).
  void drawBall() {
    ellipseMode(CENTER);
    noStroke();
    fill(ballColor);
    ellipse(ballX, ballY, ballSize, ballSize);
    //*CHANGED* If the ball gets darker than its default colour (after hitting the paddle) it gets lighter gradually until it reaches the value 255
    if (ballColor < 255) {
      ballColor = ballColor + 2;
    } else {
      ballColor=(255);
    }
  }
  
  //Function that deals with the scenario where the ball hits the paddle. If condition of ballOverlapsePaddle is true,
  //the ball changes its direction on Y-axis and its starting Y-position will be right above the paddle. 
  void handleBallHitPaddle() {
    if (ballOverlapsPaddle()) {
      ballY = paddleY - paddleHeight/2 - ballSize/2;
      //Each time the ball hits the paddle it moves 1 increment faster.    
      ballVY = -ballVY -1;
    }
  }
  
  //Returns a true or false value for ballOverlapsePaddle checking if the condition of the ball hitting the paddle is met. The condition is false by default
  boolean ballOverlapsPaddle() {
    if (ballX - ballSize/2 > paddleX - paddleWidth/2 && ballX + ballSize/2 < paddleX + paddleWidth/2) {
      if (ballY > paddleY - paddleHeight/2) {
        return true;
      }
    }
    return false;
  }
  
  //Function that deals with the sceario where the ball misses the paddle and falls off the window.
  //If the condition is met the new ball will appear at its starting position - cener of the window.
  void handleBallOffBottom() {
    if (ballOffBottom()) {
      ballX = width/2;
      ballY = height/2;
      //The score gets updated each time the ball misses the padle
      lives = lives - 1;
    }
  }
  
  //Returns a true or false value for ballOffBottom checking if the bottom of the ball reached the bottom of the window.
  boolean ballOffBottom() {
    return (ballY - ballSize/2 > height);
  }
  
  void handleEndGame() {
    if (lives <= 0) {
      state = 2;
      lives = 3;
    }
  }
  
  //Function that deals with the scenario where the ball hits the wall. If the ball side reaches the "wall" (left or right side of the window),
  //it changes its direction on X-axis. If it reaches the top of the window, it changes its direction on Y-axis.
  void handleBallHitWall() {
    if (ballX - ballSize/2 < 0) {
      ballX = 0 + ballSize/2;
      ballVX = -ballVX;
    } else if (ballX + ballSize/2 > width) {
      ballX = width - ballSize/2;
      ballVX = -ballVX;
    }
  
    if (ballY - ballSize/2 < 0) {
      ballY = 0 + ballSize/2;
      ballVY = -ballVY;
    }
  }
  
  //If the arrow key is pressed the paddle will change its position with the velocity of 10 (paddleSpeed). It will "move" to the left
  //if the left arrow key is pressed and to the right, if the right arrow key is pressed.
  void keyPressed() {
    if (keyCode == LEFT) {
      left = true;
      right = false;
    } 
    else if (keyCode == RIGHT) {
      right = true;
      left = false;
    }
  }
}
