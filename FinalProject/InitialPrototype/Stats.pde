// class to register statistics
class Stats {
  // Level of hunger that will increase over time
  int fullness = 20;
  int startTime = 0;
  int timeElapsed;
  int countDown = 4;
  int r;
  int g;
  int b;
  
  void update() {
    timeElapsed = (millis() - startTime) / 1000;
    countDown = 4 - timeElapsed;
    if (countDown <= 0) {
      fullness = fullness - 1;
      startTime = millis();
      fullness = constrain(fullness, 0, 20);
    }
    if (fullness >= 12) {
      r = 0;
      g = 255;
      b = 0;
    }
    else if (fullness >= 6) {
      r = 255;
      g = 255;
      b = 0;
    }
    else {
      r = 255;
      g = 0;
      b = 0;
    }
  }
  
  void display() {
    noStroke();
    fill(r,g,b,100);
    rectMode(CENTER);
    rect(width - 10, height / 2, 20, height);
    println(fullness);
  }
}