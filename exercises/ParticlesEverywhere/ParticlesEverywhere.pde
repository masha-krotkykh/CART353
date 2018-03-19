// By default none of the particle systems is running
boolean volcano = false;
boolean waterfall = false;
boolean sandstorm = false;
PImage backgroundImage;

// Positions for specific particle systems
PVector eruption = new PVector(130, 120);

// All 3 systems are the parts of one ArrayList
ArrayList<ParticleSystem> systems;

void setup() {
  size(900,360, P2D);
  // an ArrayList that contains all particle systems
  systems = new ArrayList<ParticleSystem>();
  backgroundImage = loadImage("bg.jpg");
}

void mousePressed() {
  // Particle systems are activated depending on where the mouse has been clicked
  // if it's the first 1/3 of the screen, the volcano will be activated 
  if (mouseX <= width / 3) {
    volcano = true;
    waterfall = false;
    sandstorm = false;
    systems.add(new ParticleSystem());
  }
  // if it's the second 1/3 of the screen, waterfall gets activated
  else if (mouseX > width / 3 && mouseX <= (width / 3) * 2) {
    waterfall = true;
    volcano = false;
    sandstorm = false;
    systems.add(new ParticleSystem());
  }
  // otherwise, if it's the last 1/3 of the screen, the sandstorm gets activated
  else {
    sandstorm = true;
    volcano = false;
    waterfall = false;
    systems.add(new ParticleSystem());
  }
}

void draw() {
  background(backgroundImage);
  stroke(0);
  for (ParticleSystem ps: systems) {
    ps.run();
    ps.addParticle();
  }
}