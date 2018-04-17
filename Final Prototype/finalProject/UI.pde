// Class that will be responsible for user interface and different screens depending on game states

class UI {
  PImage bg = loadImage("gameMenu.jpg"); 
  PImage end = loadImage("end.jpg");

  // Screen for picking a game to play 
  void gamesScreen() {
    background(bg);
    // To pick a specific game
    if (mousePressed) {
      if (mouseX < width / 2) {
        if(mouseY > 48 && mouseY < 95) {
          state = 21;
        }
        else if(mouseY > 140 && mouseY < 187) {
          state = 22;
        }
        else if(mouseY > 232 && mouseY < 280) {
          state = 23;
        }
      }  
      else if (mouseX > width/2 && mouseY > 330 && mouseY < 380) {
        state = 1;
      }
    } 
  }
  
  // Screen for snake game
  void snakeScreen() {
    snek.draw();
    snek.keyPressed();
  }
 
  // Screen for bubble game
  void bubblesScreen() {
    bubbles.draw();
    bubbles.keyPressed();
    bubbles.handleEndGame();
  }
  
  // Screen for the end
  void endScreen() {
    background(end);
    if (mousePressed && mouseY > height / 4 * 3) {
      hero.joy = hero.maxJoy;
      hero.fullness = hero.maxFullness;
      hero.deceased = false;
      stats.level = 0;
      state = 1;
    }
  }
}
