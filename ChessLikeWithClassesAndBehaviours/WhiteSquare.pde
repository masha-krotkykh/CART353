class WhiteSquare {

  int x;
  int y;
  int size;
  float red;
  float otherColour;
  float colour;
  float angry;


  WhiteSquare(int x, int y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;


    // establish a random amount of food to start with
    this.angry = 0;
      this.otherColour = 255;
      this.colour = color(255, otherColour, otherColour);
    }


  void render() {

      // reflect the amount of food
      otherColour = (int)map(this.angry, 0, 1000, 255, 0);



    fill(255, otherColour, otherColour);
    rect(this.x * size, this.y * size, size, size);
  }

  void update() {
    if(this.angry < 1000) {
      this.angry++;
    }
  }

  void calm() {
    if (this.angry > 0 && mousePressed) {
      this.angry -= 100;
      
    }
  }
}