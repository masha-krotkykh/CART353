class WhiteSquare {

  int x;
  int y;
  int size;
  float red;
  float angry;


  WhiteSquare(int x, int y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;


    // establish a random amount of food to start with
    this.angry = random(500, 1000);
      this.red = 0;
    }


  void render() {

      // reflect the amount of food
      red = (int)map(this.angry, 0, 1000, 255, 0);



    fill(red, 0, 0, 10);
    rect(this.x * size, this.y * size, size, size);
  }

  void update() {
    if(this.angry > 0) {
      this.angry--;
    }
  }

  void feed() {
    if (this.angry < 1000) {
      this.angry += 10;
      
    }
  }
}