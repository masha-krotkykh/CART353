// Main class for bubble game

class Bubbles {
  color backgroundColor = color(0);
  int lives = 5;
  boolean right = false;
  boolean left = false;
  ArrayList<Aim> aims;
  int aimSize = 32;
  
  // Instance of paddle and ball
  Paddle paddle;
  Ball ball;

  // Starting with setting up ball and paddle 
  Bubbles() {
    paddle = new Paddle();
    paddle.setupPaddle();
    ball = new Ball();
    ball.setupBall();
    
    // An arrayList of bubbles to hit
    aims = new ArrayList<Aim>();
    for (int a = 0; a < 25; a++) {
      aims.add(new Aim((aimSize/2 + aimSize*a), random(aimSize/2, height/2), 32));
    }
  }
 
  void draw() {
    background(backgroundColor); 
    fill(255, 255, 255, 50);
    pushStyle();
    textSize(450);
    textAlign(CENTER);
    text(lives, width / 2, height - paddle.paddleHeight * 3);
    popStyle();
    
    // Loop through arrayList to display bubbles, check for collisions and remove the ones that have been hit
    for (int i = aims.size() - 1; i >= 0; i--) { 
      // An ArrayList doesn't know what it is storing so we have to cast the object coming out
      Aim aim = aims.get(i);
      aim.display();
      // If collision is detected remove this aim from the arrayList
      if ((aim.x + aim.w / 2 > ball.ballX - ball.ballSize / 2) && (aim.x - aim.w / 2 < ball.ballX + ball.ballSize / 2) && (aim.y + aim.w / 2 > ball.ballY - ball.ballSize / 2) && (aim.y - aim.w / 2 < ball.ballY + ball.ballSize / 2)) {
      aims.remove(i);
      }
    }
    
    paddle.updatePaddle();
    ball.updateBall();
    paddle.drawPaddle();
    ball.drawBall();
    ball.handleBallHitPaddle(paddle);
  }
  
    // When all lives are used return to the main game menu, stop paddle and reset number of lives back to 5
  void handleEndGame() {
    if (lives <= 0) {
      lives = 5;
      left = false;
      right = false;
      paddle.paddleVX = 0;
      state = 2;
    }
  }
  
  //The paddle will move to the left if the left arrow key is pressed and to the right, if the right arrow key is pressed.
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
