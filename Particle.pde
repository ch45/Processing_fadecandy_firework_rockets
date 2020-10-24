// Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain
// Code for:

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float burnRate;

  boolean seed = false;

  int hue;

  int particleWeight;

  Particle(float x, float y, int angle, float velocityY, int hue) {
    this.hue = hue;
    acceleration = new PVector(0, 0);
    float velocityX = tan(HALF_PI - TWO_PI * angle / 360) * velocityY;
    velocityX = min(velocityX, 2 * velocityYMin); // reign in the extremes at low angles
    velocity = new PVector(velocityX, velocityY);
    location =  new PVector(x, y);
    seed = true;
    lifespan = 255.0;
    burnRate = 0;
    particleWeight = seedWeight;
  }

  Particle(PVector l, int hue) {
    this.hue = hue;
    acceleration = new PVector(0, 0);
    velocity = PVector.random2D();
    velocity.mult(random(velocityYMin / 2, velocityYMax));
    location = l.copy();
    lifespan = 255.0;
    burnRate = random(3, 6);
    particleWeight = explodeeWeight;
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void applyWind(PVector wind) {
    velocity.x *= 1.0 - wind.x; // at present just a resistance
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
      lifespan -= burnRate;
      velocity.mult(0.95);
    }
    acceleration.mult(0);
  }

  // Method to display
  void display() {
    if (seed) {
      float brightness = 255 - (255 - 32) * (velocityYMax + velocity.y) / velocityYMax;
      stroke(hue, 0, brightness, lifespan);
    } else {
      stroke(hue, 255, 255, lifespan);
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
