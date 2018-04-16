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
  int beesEaten = 0;
  int level;
  int levelUp;

// Function to track current progress 
// Every 10 bees lead to levelUp +1
  void progress() {
    if (beesEaten >= 10) {
      levelUp = levelUp + beesEaten/10;
      beesEaten = 0;
    } 
    // Every 10 levelUps lead to level +
    if (levelUp >= 10) {
      level = level + levelUp/10;
      levelUp = 0;
    }
  }
  
  void update() {
    timeElapsed = (millis() - startTime) / 1000;
    countDown = 4 - timeElapsed;
    if (countDown <= 0) {
      fullness = fullness - 1;
      startTime = millis();
      fullness = constrain(fullness, 0, 20);
    }
    fullness = fullness + beesEaten;
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
    textAlign(CENTER);
    text(levelUp, width / 2 - 20, 20);
    text(level, width / 2 + 20, 20);
    println(levelUp, level);
  }
 
  // Saving current stats into JSON object
  void saveProgress() {
    JSONObject currentStats = new JSONObject();
    currentStats.setInt("currentLevelUp", levelUp);
    currentStats.setInt("currentLevel", level);
    saveJSONObject(currentStats, "data/stats.json");
  }
  
  // Function to load saved progress from JSON file
  void loadProgress() {
    JSONObject savedStats = loadJSONObject("data/stats.json");
    levelUp = savedStats.getInt("currentLevelUp"); 
    level = savedStats.getInt("currentLevel");
  }
}