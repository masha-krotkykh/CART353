// a class for artifacts to be collected by the Roller
class Artifact {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  boolean collide;
  int size = 16;
  PImage artImg;
  float rollerX = roller.location.x;
  float rollerY = roller.location.y;
  
  
  Artifact(PImage tempArtImg, float m, float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    mass = m;
    artImg = tempArtImg;
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  
  void update() {
    // we only want attraction to kick in when the Roller is closer than 150 px away
    if (dist(location.x, location.y, roller.location.x, roller.location.y) < 150 && dist(location.x, location.y, roller.location.x, roller.location.y) > roller.size / 2) {
      velocity.add(acceleration);
    }
    
    // if an artifact is inside the Roller, it begins to follow it (kinda)
    else if (dist(location.x, location.y, roller.location.x, roller.location.y) < roller.size / 2) {
      velocity = roller.velocity.get(); 
    }
    location.add(velocity);
    acceleration.mult(0);  
  }

  void display() {
  // displaaying artifacts as images
    image(artImg, location.x,location.y);
  }
  
  //Checking if an artifact collides with the Roller and 
    //boolean collide(Roller roller) {    
    //  boolean insideLeft = (location.x + size / 2 > roller.x - roller.size / 2);
    //  boolean insideRight = (location.x - size / 2 < roller.x + roller.size / 2);
    //  boolean insideTop = (location.y + size / 2 > roller.y - roller.size / 2);
    //  boolean insideBottom = (location.y - size / 2 < roller.y + roller.size / 2);
            
    //  // and returning the value of the boolean
    //  if (insideLeft && insideRight && insideTop && insideBottom) {
    //    collide = true;
    //  }
    //  else {
    //    collide = false;
    //  }
    //  return collide;      
    //}
  
  // make artifacts bounce off walls when they reach the edge of the window
  void checkEdges() {
    if (location.x <= 0 || location.x >= width || location.y <= 0 || location.y >= height) {
      velocity.mult(-1);
    }
  }

}