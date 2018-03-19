
// Need to use iterator...
import java.util.*;

// create new particle system depending on where mouse is clicked
class ParticleSystem {
  ArrayList<Particle> particles;
 
  ParticleSystem() {
    particles = new ArrayList<Particle>();
  }
 
 // if volcano is true (i.e. mouse is clicked in the first 1/3 of the screen)
  void addParticle() {
    if (volcano) {
      // create some ash standard particles in 30% (10 instances per loop)
      float r = random(1);
      if (r < 0.3) {
        for(int i = 0; i < 10; i++) {
          particles.add(new Particle(eruption));
        }
      } 
      // In other 70% create lava sparkles (10 instances per loop)
      else {
        for(int i = 0; i < 10; i++) {
          particles.add(new Sparkle(eruption));
        }
      }
    }
    // if waterfall is true (i.e. mouse is clicked in the second 1/3 of the screen)
    else if (waterfall) {
      // Create bubbles at the faterfall location (10 instances per loop)
      PVector water = new PVector(random(300,600),160);
      for(int i = 0; i < 10; i++) {
        particles.add(new Splash(water));
      }
    }
    // if sandstorm is true (i.e. mouse is clicked in the third 1/3 of the screen)
    else if (sandstorm) {
      // create some sand particles in the upper part of the screen in 30% (5 instances per loop)
      float r = random(1);
      if (r < 0.3) {
        PVector sand = new PVector((width/3)*2, random(height));
        for(int i = 0; i < 5; i++) {
          particles.add(new Sand(sand));
        }
      }
      else {
        // and some sand particles in the bottom part of the screen in 70% (20 instances per loop)
        PVector sand = new PVector((width/3)*2, random(height/2, height));
        for(int i = 0; i < 20; i++) {
          particles.add(new Sand(sand));
        }
      }
    }
  } 
  void run() {
    //use iterator when removing particles from the arrayList
    Iterator<Particle> it = particles.iterator();
    while (it.hasNext()) {
      Particle p = it.next();
      p.run();
      if (p.isDead()) {
        it.remove();
      }
    }
  }
}