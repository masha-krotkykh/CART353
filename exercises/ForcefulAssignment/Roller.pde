
// class for the Roller that will be moved around the screen with arrow keys while rotating 
// some parts of code were borrowed from The Nature of Code by Daniel Shiffman

class Roller {
 
  // declaring variables for mass, size, position, as well as image, rotation, and PVectors
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  int size = 50;
  PImage rolloImg = loadImage("rollo.png");
  float rot;
  float x = width / 4;
  float y = height - 50;
  float G;
   
  Roller() {
    //defining starting state for the Roller
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    rot = 0.0;
    G = 1;
    mass = 20;
  }
 
 
  // Code to attract artifacts to the Roller
  // Borrowed from Daniel Shiffman
    PVector attract(Artifact artifact) {
    PVector attraction = PVector.sub(location, artifact.location);   // Calculate direction of force
    float d = attraction.mag();                              // Distance between objects
    d = constrain(d, 0, 150);                        // Limiting the distance to eliminate "extreme" results for very close or very far objects
    attraction.normalize();                                  // Normalize vector (distance doesn't matter here, we just want this vector for direction)
    float strength = (roller.G * mass * artifact.mass) / (d * d);      // Calculate gravitional force magnitude
    attraction.mult(strength);                                  // Get force vector --> magnitude * direction
    return attraction;
  }
  
  void update() {
    // trapping the Roller inside the window
    location.y = constrain(location.y, size / 2, height - size / 2);
    location.x = constrain(location.x, size / 2, width - size / 2);
    
    //defining controls for the Roller - will be moved around with arrow keys and rotate at the same time
    if (rollRight == true || rollUp == true) {
      rot += 0.09;
    } 
    else if (rollLeft == true || rollDown == true) {
      rot -=0.09;
    }
    
    // putting movement together : acceleration to define velocity, velocity to define position and resetting velocity so that it doesn't build up
    velocity.add(acceleration);
    location.add(velocity);
    velocity.mult(0);
} 

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  // displaying the Roller as an image, defining rotation for "rolling"
  void display() {
    pushMatrix();
    translate(location.x, location.y); 
    rotate(rot);
    imageMode(CENTER);
    image(rolloImg, 0, 0);
    popMatrix();
  }
}