// Based on Snake Game by Daniel Shiffman // https://youtu.be/AaGK-fj-BAM
// Class for Snake game that can be played to intertain the Tamagotchi. Every 10 points scored will add 1 point to levelUp in stats
  
class Snek {
  // Instance of snake from Snake class
  Snake snake;
  int size;
  PVector target;
  int total;
  int margin = 20;
  int screenWidth = 600;
  int screenHeight = 380;
  PFont font = loadFont("Orator.vlw");
  PImage jar = loadImage("jar.png");
  
  // Game constructor: an instance of Snake, place target, set size to 20
  Snek() {
    snake = new Snake();
    place();
    size = 20;
  }
  
  // Function to place target randomly within the window without touching its edges  
  void place() {
    target = new PVector(int(random(margin + size, margin + screenWidth - size)), int(random(margin + size, margin + screenHeight - size)));
  }
  
  void draw() {
    background(95, 135, 130);
    fill(0, 10, 45);
    rect(margin, margin, screenWidth, screenHeight);
    // When a target gets eaten, place another one randomly
    if (snake.eat(target)) {
      place();
    }
    // Update and show snake, draw a target at target location of size 20
    snake.update();
    snake.show();  
    imageMode(CENTER);
    image(snake.shine, target.x, target.y, size, size);
    
    // display game progress
    fill(50);  
    textAlign(LEFT);
    textFont(font, 17);
    text("level: " + int(total / 10), margin * 2 + screenWidth, height - margin);
    text("fireflies: " + total, margin * 2 + screenWidth, height - margin * 2.5);
    // display jar
    image(jar, margin * 4 + screenWidth, height / 2 - margin, 150, 150);
   
    // display hero sprite
    evolution.setXY(width - 70, height / 2 + margin);
    evolution.setFrameSequence(hero.growth, hero.growth + 3, 0.3);
    // We get the time elapsed since the last frame (the deltaTime)
    double deltaTime = timer.getElapsedTime();
    // We update the sprites in the program based on that delta
    S4P.updateSprites(deltaTime);
    // Then we draw them on the screen
    S4P.drawSprites();
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
