// Main class for bubble game
// based on pong game from CART253 class

class Bubbles {
  color backgroundColor = color(0);
  int lives = 5;
  boolean right = false;
  boolean left = false;
  ArrayList<Aim> aims;
  int aimSize = 60;
  int level = 1;
  int aimNumber = 2;
  int currentSize = 60;
  PImage comb = loadImage("honeycomb.png");
  PImage livesImg = loadImage("lives.png");
  
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
    for (int a = 0; a < aimNumber; a++) {
      aims.add(new Aim(comb, random(currentSize/2, width - currentSize/2), random(currentSize/2, height/2), currentSize * 1.2, currentSize));
    }
  }
 
  void draw() {
    background(backgroundColor); 
    fill(255);
    textAlign(LEFT);
    textFont(snek.font, 20);
    text(lives, width - 30, 30);
    text(level, width - 80, 30);
    imageMode(CENTER);
    image(livesImg, width - 50, 25, 25, 25);
    image(comb, width - 100, 25, 25, 20);
    
    // Loop through arrayList to display bubbles, check for collisions and remove the ones that have been hit
    for (int i = aims.size() - 1; i >= 0; i--) { 
      // An ArrayList doesn't know what it is storing so we have to cast the object coming out
      Aim aim = aims.get(i);
      aim.display();
      // If collision is detected remove this aim from the arrayList
      if ((aim.x + aim.aimWidth / 2 > ball.ballX - ball.ballSize / 2) && (aim.x - aim.aimWidth / 2 < ball.ballX + ball.ballSize / 2) && (aim.y + aim.aimHeight / 2 > ball.ballY - ball.ballSize / 2) && (aim.y - aim.aimHeight / 2 < ball.ballY + ball.ballSize / 2)) {
      aims.remove(i);
      // and 300 points of joy are added
      hero.joy = hero.joy + 300;
      }
    }

    paddle.updatePaddle();
    ball.updateBall();
    paddle.drawPaddle();
    ball.drawBall();
    ball.handleBallHitPaddle(paddle);
  }
  
  void handleEndGame() {
    // If all bubbles are popped, new level starts
    // number of bubbles increases, level number increases, bubble size decreases.
    if (aims.size() <= 0) {
      level = level + 1;
      aimNumber = aimNumber + 3;
      currentSize = currentSize - 5;
      for (int a = 0; a < aimNumber; a++) {
        aims.add(new Aim(comb, random(currentSize/2, width - currentSize/2), random(currentSize/2, height/2), currentSize * 1.2, currentSize));
      }
    }
    // When all lives are used return to the main game menu, stop paddle and reset number of lives back to 5, as well as bubble size and bubble quantity
    if (lives <= 0) {
      lives = 5;
      level = 0;
      aimNumber = 2;
      currentSize = 60;
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
