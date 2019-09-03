class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float size;

  Mover(float m, float x, float y, float xVel, float yVel){
    mass = m;
    size = m*16;
    location = new PVector(x,y);
    velocity = new PVector(xVel/20,-yVel/15);
    acceleration = new PVector(0,0);
  }

  void applyForce(PVector force) {
    //[full] Receive a force, divide by mass, and add to acceleration.
    //PVector f = PVector.div(force,mass);
    PVector f = force;
    velocity.add(f);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    velocity.mult(0.99);
  }

  void display() {
    stroke(0);
    fill(175);
    translate(location.x, location.y);
    rotate(-velocity.x);
    ellipse(0,0,mass*16,mass*16);
    fill(255,0,0);
    rect(0, 0, 60,60);
    fill(175);
    rotate(velocity.x);
    translate(-location.x, -location.y);
  }

  void checkEdges() {
    if (location.x > width-size) {
      location.x = width-size;
      acceleration.x = 0;
      velocity.x *= -0.85;
    } else if (location.x < 0+size) {
      velocity.x *= -0.85;
      location.x = 0+size;
      acceleration.x = 0;
    }

    if (location.y > height) {
      velocity.y *= -0.85;
      location.y = height-(size/4);
      acceleration.y = 0;
    } else if (location.y < 0) {
      velocity.y *= -0.85;
      location.y = 0+size/2;
      acceleration.y = 0;
    }
  }
}
