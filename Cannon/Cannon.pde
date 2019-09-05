ArrayList<Mover> cannonBalls = new ArrayList<Mover>();
CannonClass[] Cannon = new CannonClass[1];
PVector gravity =  new PVector(0,1);
boolean gravityState = true;
PVector wind = new PVector(1,0);
boolean windState = false;
boolean fired = false;
int firingTime;

float thiccness = 5.0;
int movedX = 0;
int movedXVelocity = 0;

PImage boom;

void setup() {
  size(1000,800);
  background(255);
  frameRate(60);
  rectMode(CENTER);
  boom = loadImage("cannonboom.png");
  Cannon[0] = new CannonClass(3,3,3);
}
 
void draw() {
  //update(mouseX, mouseY);
  background(255);
  Cannon[0].drawCannon();
  if(fired){
    for(int i = 0; i < cannonBalls.size(); i++){
      Mover cannonBall = cannonBalls.get(i);
    if(gravityState){
    cannonBall.applyForce(gravity);
    }
    if(windState){
    cannonBall.applyForce(wind);
    }
    cannonBall.checkEdges();
    cannonBall.update();
    cannonBall.checkEdges();
    cannonBall.display();
  }
  }
      

    
    


}


void keyPressed(){
  if(key == '1'){                          //Toggle wind
    windState = !windState;
    println("wind" + windState);
  } else if(key == '2'){                   //Toggle gravity
    gravityState = !gravityState;
    println("gravity" + gravityState);
  } else if(keyCode == LEFT){                   //Move cannon left
    movedXVelocity = -10;
  } else if(keyCode == RIGHT){                   //Move cannon right
    movedXVelocity = 10;
  } else if(key == '5'){                   //Remove cannonballs and reload
      cannonBalls.clear();
      fired = false;
  }
}

void mouseClicked(){
  if (cannonBalls.size() < 9){
  Cannon[0].cannonShot();
  firingTime = millis();
  }
}
