// Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain
// Code for:

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  boolean seed = false;

  float hu;

  int particleWeight;

  Particle(float x, float y, float h, int seedWeight) {
    hu = h;

    acceleration = new PVector(0, 0);
    velocity = new PVector(0, random(-fireworkVelXMax, -fireworkVelXMin));
    location =  new PVector(x, y);
    seed = true;
    lifespan = 255.0;
    particleWeight = seedWeight;
  }

  Particle(PVector l, float h, int explodeeWeight) {
    hu = h;
    acceleration = new PVector(0, 0);
    velocity = PVector.random2D();
    velocity.mult(random(4, 8));
    location = l.copy();
    lifespan = 255.0;
    particleWeight = explodeeWeight;
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void run() {
    update();
    display();
  }

  boolean explode() {
    if (seed && velocity.y > 0) {
      lifespan = 0;
      return true;
    }
    return false;
  }

  // Method to update location
  void update() {

    velocity.add(acceleration);
    location.add(velocity);
    if (!seed) {
      lifespan -= 5.0;
      velocity.mult(0.95);
    }
    acceleration.mult(0);
  }

  // Method to display
  void display() {
    if (seed) {
      float brightness = 255 - (255 - 32) * (fireworkVelXMax + velocity.y) / fireworkVelXMax;
      stroke(hu, 0, brightness, lifespan);
    } else {
      stroke(hu, 255, 255, lifespan);
    }
    strokeWeight(particleWeight);
    point(location.x, location.y);
    //ellipse(location.x, location.y, 12, 12);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }

  void setWeight(int particleWeight) {
    this.particleWeight = particleWeight;
  }
}
