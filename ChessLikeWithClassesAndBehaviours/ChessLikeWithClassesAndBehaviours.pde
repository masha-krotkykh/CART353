
GridSquare[][] grid;
WhiteSquare[][] white;
int rows;
int cols;
int gridSquareSize;

void setup() {

  size(400, 400);
  noStroke();
  rows = 8;
  cols = 8;
  gridSquareSize = 50;

  grid = new GridSquare[cols][rows];
  
  // do a double for loop to run through the grid 2D array
  // creating new alternating black and white GridSquare objects
  for (int i = 0; i < cols; i+=2) {
    for (int j = 0; j < rows; j+=2) {
      grid[i][j] = new GridSquare(i, j, gridSquareSize);
    }
  }

  for (int i = 1; i < cols; i+=2) {
    for (int j = 1; j < rows; j+=2) {
      grid[i][j] = new GridSquare(i, j, gridSquareSize);
    }
  }


  white = new WhiteSquare[cols][rows];
  
  // do a double for loop to run through the grid 2D array
  // creating new alternating black and white WhiteSquare objects
  for (int n = 0; n < cols; n+=2) {
    for (int m = 1; m < rows; m+=2) {
      white[n][m] = new WhiteSquare(n, m, gridSquareSize);
    }
  }

  for (int n = 1; n < cols; n+=2) {
    for (int m = 0; m < rows; m+=2) {
      white[n][m] = new WhiteSquare(n, m, gridSquareSize);
    }
  }
}

void draw() {
  
  // every time daw runs, we want to go through the grid 2d array and update and render each GridSquare object
  // update represents getting hungry
  // render takes care of drawing
  for (int i = 0; i < cols; i+=2) {
    for (int j = 0; j < rows; j+=2) {
      grid[i][j].update();
      grid[i][j].render();
    }
  }
   for (int i = 1; i < cols; i+=2) {
    for (int j = 1; j < rows; j+=2) {
      grid[i][j].update();
      grid[i][j].render();
    }
  }
  
   for (int n = 0; n < cols; n+=2) {
    for (int m = 1; m < rows; m+=2) {
      white[n][m].update();
      white[n][m].render();
    } 
  }
   for (int n = 1; n < cols; n+=2) {
    for (int m = 0; m < rows; m+=2) {
      white[n][m].update();
      white[n][m].render();
    } 
  }
  
  // determine which gid slot mouse is over
  int currentHorizSquare = mouseX / 50;
  int currentVertSquare = mouseY / 50;

  // do mouseOver-based feeding only on **valid** grid slots
  if ((currentHorizSquare >= 0 && currentHorizSquare <= 7 && currentVertSquare >= 0 && currentVertSquare <= 7)&&(grid[currentHorizSquare][currentVertSquare] != null)) {
      grid[currentHorizSquare][currentVertSquare].feed();
  }
  
    // do mousePressed-based calming only on **valid** grid slots
  if ((currentHorizSquare >= 0 && currentHorizSquare <= 7 && currentVertSquare >= 0 && currentVertSquare <= 7)&&(white[currentHorizSquare][currentVertSquare] != null)) {
      white[currentHorizSquare][currentVertSquare].calm();
  }
}