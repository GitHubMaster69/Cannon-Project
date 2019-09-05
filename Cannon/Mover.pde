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
    translate(location.x, location.y);
    rotate(-velocity.x);
    fill(224,172,105);
    rect(50,10,30,10);
    fill(255,0,0);
    rect(60,10,5,10);
    fill(0);
    ellipse(0,0,mass*16,mass*16);;
    fill(50,50,50);
    ellipse(5,5,45,45);
    fill(240,240,240);
    ellipse(10,3,15,15);
    fill(175);
    rotate(velocity.x);
    translate(-location.x, -location.y);
  }

  void checkEdges() {
    if (location.x > width-size/2) {
      location.x = width-size/2;
      acceleration.x = 0;
      velocity.x *= -0.95;
    } else if (location.x < size/2) {
      velocity.x *= -0.95;
      location.x = size/2;
      acceleration.x = 0;
    }
    if (location.y > height-size/2) {
      velocity.y *= -0.80;
      location.y = height-(size/2);
      if(velocity.y > -3){
        velocity.y = 0;
      }
    } else if (location.y < size/2) {
      velocity.y *= -0.95;
      location.y = size/2;
      acceleration.y = 0;
    }
  }
}
