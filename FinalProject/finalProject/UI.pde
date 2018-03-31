class UI {
  // startScreen before the game begins
  void startScreen() {
    background(0);
    //background(startImage);
    //timerRunning = false;
    textAlign(CENTER);
    text("press <s> to start", width/2, height/2);
    if(key == 's') {
      state = 1;
    }
  }
  
  void gamesScreen() {
    background(0);
    textAlign(CENTER);
    text("1. <s> Snake  2. <c> Cannon 3. <w> Shuffle", width/2, height/2);
    if(key == 's') {
      state = 22;
    }
    else if(key == 'c') {
      state = 21;
    }
    else if(key == 'w') {
      state = 23;
    }
  }
}
