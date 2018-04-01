// Based on Snake Game by Daniel Shiffman // https://youtu.be/AaGK-fj-BAM

// Class for Snake game that can be played to intertain the Tamagotchi. Every 10 points scored will add 1 point to levelUp in stats
  
class Snek {
  // Instance of snake from Snake class
  Snake snake;
  int size;
  PVector target;
  int total;
  
  // Game constructor: an instance of Snake, place target, set size to 20
  Snek() {
    snake = new Snake();
    place();
    size = 20;
  }
  
  // Function to place target randomly within the window without touching its edges  
  void place() {
    target = new PVector(int(random(size, width - size)), int(random(size, height - size)));
  }
  
  void draw() {
    background(51);
    // When a target gets eaten, place another one randomly
    if (snake.eat(target)) {
      place();
    }
    // Update and show snake, draw a target at target location of size 20
    snake.update();
    snake.show();  
    fill(255, 0, 100);
    rect(target.x, target.y, size, size);
  }

  // Controlls to direct the snake in desired direction
  void keyPressed() {
    if (keyCode == UP) {
      snake.speedX = 0;
      snake.speedY = -1;
    } 
    else if (keyCode == DOWN) {
      snake.speedX = 0;
      snake.speedY = 1;
    } 
    else if (keyCode == RIGHT) {
      snake.speedX = 1;
      snake.speedY = 0;
    } 
    else if (keyCode == LEFT) {
      snake.speedX = -1;
      snake.speedY = 0;
    }
  }
}
