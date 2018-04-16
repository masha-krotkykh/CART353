// Class for ball in bubbles game

class Ball {
// variables for position, size, speed, and velocity
  int ballX;
  int ballY;
  int ballVX;
  int ballVY;
  int ballSpeed = 4;
  int ballSize = 22;
  color ballColor = color(255);
  PImage beeImg = loadImage("bee.png");
  
  Ball() {
  }
  
  void setupBall() {
    //Sets up the starting position of the ball in the center of the window
    ballX = width/2;
    ballY = height/2;
    ballVX = ballSpeed;
    ballVY = ballSpeed;
  }
  
  //Calls the new instance of the ball at the new position which is its starting poition + velocity
  //(ballVX) on X-axis and (ballVY) on Y-axis. By default both are equal 5 (ballSpeed). Calls functions handleBallHitPaddle(),
  //handleBallHitWall() and handleBallOffBottom().
  void updateBall() {
    ballX += ballVX;
    ballY += ballVY;

    handleBallHitWall();
    handleBallOffBottom();
    //bubbles.handleEndGame();
  }
  
  void drawBall() {
    imageMode(CENTER);
    image(beeImg, ballX, ballY, ballSize, ballSize);
  }
   
  //Returns a true or false value for ballOverlapsePaddle checking if the condition of the ball hitting the paddle is met. The condition is false by default
  boolean ballOverlapsPaddle(Paddle paddle) {
    if (ballX - ballSize/2 > paddle.paddleX - paddle.paddleWidth/2 && ballX + ballSize/2 < paddle.paddleX + paddle.paddleWidth/2) {
      if (ballY > paddle.paddleY - paddle.paddleHeight / 2) {
        return true;
      }
    }
    return false;
  }
  
  //If the ball hits the paddle, it changes its direction on Y-axis and its starting Y-position will be right above the paddle. 
  void handleBallHitPaddle(Paddle paddle) {
    if (ballOverlapsPaddle(paddle)) {
      ballY = paddle.paddleY - paddle.paddleHeight/2 - ballSize/2;
      ballVY = - ballVY;
    }
  }
  
  //If the ball misses the paddle and falls off the window, the new ball will appear at its starting position - cener of the window.
  void handleBallOffBottom() {
    if (ballOffBottom()) {
      ballX = width/2;
      ballY = height/2;
      //The score gets updated each time the ball misses the padle
      bubbles.lives = bubbles.lives - 1;
    }
  }
  
  //Returns a true or false value for ballOffBottom checking if the bottom of the ball reached the bottom of the window.
  boolean ballOffBottom() {
    return (ballY - ballSize/2 > height);
  }
  
  //If the ball side reaches the left or right side of the window, it changes its direction on X-axis. If it reaches the top of the window, it changes its direction on Y-axis.
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
}
