// Class that will be responsible for user interface and different screens depending on game states

class UI {
  PImage bg = loadImage("gameMenu.jpg"); 

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
  
  void bubblesScreen() {
    bubbles.draw();
    bubbles.keyPressed();
    bubbles.handleEndGame();
  }
}
