// class to register statistics of the main program not mini-games
// current state of Tamagotchi

class Stats {
  // variables for stat bars 
  int rh = 0;
  int gh = 0;
  int bh = 0;
  int rb = 0;
  int gb = 0;
  int bb = 0;
  int statsHeight = 50;
  float jSize;
  float fSize;
  float barSize = 50;
  float playX = width - 50;
  float playY = statsHeight/2;
  
  // Current progress
  int foodEaten = 0;
  int level = 0;
  int levelUp;
  
  // UI images to illustrate progress
  PImage joyImg = loadImage("joy.png");
  PImage hungerImg = loadImage("hunger.png");
  PImage levelImg = loadImage("level.png");
  PImage playImg = loadImage("play.png");
  

// Function to track current progress 
// Every 10 bees lead to levelUp +1
  void progress() {
    if (foodEaten >= 10) {
      levelUp = levelUp + foodEaten / 10;
      foodEaten = 0;
    } 

    // Every 20 levelUps lead to level +
    if (levelUp >= 20) {
      level = level + levelUp / 20;
      levelUp = 0;
    }
  }
  
  void update() {
    // Colour and size of stat bars depending on hunger and boredom levels
    if (hero.fullness >= (hero.maxFullness / 3) * 2) {
      rh = 0;
      gh = 255;
      bh = 0;
      fSize = barSize;
    }
    else if (hero.fullness >= hero.maxFullness / 3) {
      rh = 255;
      gh = 255;
      bh = 0;
      fSize = (barSize / 3) * 2;
    }
    else if (hero.fullness < hero.maxFullness / 3 && hero.fullness > 0) {
      rh = 255;
      gh = 0;
      bh = 0;
      fSize = barSize / 3;
    }
    else {
      rh = 0;
      gh = 0;
      bh = 0;
      fSize = 0;
    }
    
    if (hero.joy >= (hero.maxJoy / 3) * 2) {
      rb = 0;
      gb = 255;
      bb = 0;
      jSize = barSize;
    }
    else if (hero.joy >= hero.maxJoy / 3) {
      rb = 255;
      gb = 255;
      bb = 0;
      jSize = (barSize / 3) * 2;
    }
    else if (hero.joy < hero.maxJoy / 3 && hero.joy > 0) {
      rb = 255;
      gb = 0;
      bb = 0;
      jSize = barSize / 3;
    }
    else {
      rb = 0;
      gb = 0;
      bb = 0;
      jSize = 0;
    }
    
    // Reset all progress if hero dies
    if (hero.deceased) {
      levelUp = 0;
      level = 0;
    }
  }
  
  void display() {
    // Joy level
    noStroke();
    fill(rb,gb,bb);
    rectMode(CORNER);
    rect(50, barSize - jSize, 5, jSize - 7); // give a little padding so that the bar doesn't touch the edge
    image(joyImg, 25, statsHeight/2, 35, 35);
    
    // Fullness level
    fill(rh,gh,bh);
    rect(125, barSize - fSize, 5, fSize - 7);
    image(hungerImg, 100, statsHeight/2, 35, 35);
    
    // Level
    textAlign(CENTER);
    fill(155);  
    textFont(snek.font, 30);
    text(level, width / 2 + 40, statsHeight - 15);
    image(levelImg, width / 2, statsHeight / 2, 50, 50);
    
    // Game center
    // kept in Stats instead UI for consistency 
    image(playImg, playX, playY, 35, 35);
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
