// Class that will be responsible for user interface and different screens depending on game states

class UI {

  // Screen for picking a game to play 
  void gamesScreen() {
    background(0);
    textAlign(CENTER);
    text("1. <s> Snake  2. <b> Bubbles 3. <w> Shuffle 4. <0> Home", width/2, height/2);
    // Keys to press to pick a specific game
    if(key == 's') {
      state = 21;
    }
    else if(key == 'b') {
      state = 22;
    }
    else if(key == 'w') {
      state = 23;
    }
    else if(key == '0') {
      state = 1;
    }
  }
  
  // Screen for snake game
  void snakeScreen() {
    snek.draw();
    snek.keyPressed();
  }
  
  void bubblesScreen() {
    bubbles.draw();
    bubbles.updatePaddle();
    bubbles.keyPressed();
    bubbles.handleEndGame();
  }
}
