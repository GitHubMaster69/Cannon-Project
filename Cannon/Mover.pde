class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  // The object now has mass!
  float mass;
  float size;
/*  Mover(float m, float x, float y) {
    mass = m;
    size = m*16;
    location = new PVector(x,y);
    velocity = new PVector(random(-2,2),random(-2,2));
    acceleration = new PVector(random(0,0),random(0,0));
  }*/
  Mover(float m, float x, float y, float xVel, float yVel){
    mass = m;
    size = m*16;
    location = new PVector(x,y);
    velocity = new PVector(xVel/20,-yVel/15);
    acceleration = new PVector(0,0);
  }

  // Newton’s second law.
  void applyForce(PVector force) {
    //[full] Receive a force, divide by mass, and add to acceleration.
    //PVector f = PVector.div(force,mass);
    PVector f = force;
    velocity.add(f);
    //[end]
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    velocity.mult(0.99);
    //println(velocity.x, "  " , velocity.y, "   ", acceleration.x, "   ", acceleration.y);
  }

  void display() {
    stroke(0);
    fill(175);
    //[offset-down] Scaling the mass according to mass.
    ellipse(location.x,location.y,mass*16,mass*16);
  }

  // Somewhat arbitrarily, we are deciding that an object bounces when it hits the edges of a window.
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
      // Even though we said we shouldn't touch location and velocity directly, there are some exceptions.
      // Here we are doing so as a quick and easy way to reverse the direction of our object when it reaches the edge.
      velocity.y *= -0.85;
      location.y = height-(size/4);
      acceleration.y = 0;
    } else if (location.y < 0) {
      velocity.y *= -0.85;
      location.y = 0+size/2;
      acceleration.y = 0;
    }
/*    if((width/2)-100 <= location.x &&  location.x <= (width/2)+100 && location.y > height-100){
      acceleration.y = acceleration.y - 5;
    }*/
  }
}
