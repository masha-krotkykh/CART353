// class to register statistics
class Stats {
  // Colours for stat bars 
  int rh = 0;
  int gh = 0;
  int bh = 0;
  int rb = 0;
  int gb = 0;
  int bb = 0;
  // Current progress
  int beesEaten = 0;
  int level = 0;
  int levelUp;
  int gamesWon;


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
    // Colour of stat bars depending on hunger and boredom levels
    if (hero.fullness >= 14000) {
      rh = 0;
      gh = 255;
      bh = 0;
    }
    else if (hero.fullness >= 7000) {
      rh = 255;
      gh = 255;
      bh = 0;
    }
    else {
      rh = 255;
      gh = 0;
      bh = 0;
    }
    
    if (hero.joy >= 18000) {
      rb = 0;
      gb = 255;
      bb = 0;
    }
    else if (hero.joy >= 9000) {
      rb = 255;
      gb = 255;
      bb = 0;
    }
    else {
      rb = 255;
      gb = 0;
      bb = 0;
    }
  }
  
  void display() {
    // Display stats bars
    noStroke();
    fill(rh,gh,bh,100);
    rectMode(CENTER);
    rect(width - 10, height / 2, 20, height);
    textAlign(CENTER);
    text(levelUp, width / 2 - 20, 20);
    text(level, width / 2 + 20, 20);
    
    fill(rb,gb,bb,100);
    rect(width - 30, height / 2, 20, height);
    textAlign(CENTER);
    text(levelUp, width / 2 - 20, 20);
    text(level, width / 2 + 20, 20);
  }
 
  // Saving current stats into JSON object
  void saveProgress() {
    JSONObject currentStats = new JSONObject();
    currentStats.setInt("currentLevelUp", levelUp);
    currentStats.setInt("currentLevel", level);
    currentStats.setInt("currentFullness", hero.fullness);
    currentStats.setInt("currentJoy", hero.joy);
    saveJSONObject(currentStats, "data/stats.json");
  }
  
  // Function to load saved progress from JSON file
  void loadProgress() {
    JSONObject savedStats = loadJSONObject("data/stats.json");
    levelUp = savedStats.getInt("currentLevelUp"); 
    level = savedStats.getInt("currentLevel");
    hero.fullness = savedStats.getInt("currentFullness");
    hero.joy = savedStats.getInt("currentJoy");
  }
}
