ArrayList<Mover> cannonBalls = new ArrayList<Mover>();
CannonClass[] Cannon = new CannonClass[1];
ButtonClass[] Button = new ButtonClass[2];
PVector gravity =  new PVector(0,1);
boolean gravityState = true;
PVector wind = new PVector(1,0);
boolean windState = false;
boolean fired = false;
int firingTime;

float thiccness = 5.0;
int movedX = 0;
int movedXVelocity = 0;
int ammo = 100;

PImage boom;
PImage world;
PImage gravityp;
PImage windp;

void setup() {
  size(1000,800);
  frameRate(60);
  rectMode(CENTER);
  boom = loadImage("cannonboom.png");
  world = loadImage("world.png");
  windp = loadImage("wind.png");
  gravityp = loadImage("gravity.png");
  Cannon[0] = new CannonClass(3,3,3);
  Button[0] = new ButtonClass(10,10,50,wind);
  Button[1] = new ButtonClass(10,80,50,gravity);
}
 
void draw() {
  image(world,0,0);    //Background image
  Cannon[0].drawCannon();
  Button[0].buildAButton();
  Button[1].buildAButton();
  if(fired){    //Check to avoid nullpointers
    for(int i = 0; i < cannonBalls.size(); i++){
      Mover cannonBall = cannonBalls.get(i);
    if(gravityState){
    cannonBall.applyForce(gravity);
    }
    if(windState){
    cannonBall.applyForce(wind);
    }
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
  } else if(keyCode == LEFT){              //Move cannon left
    movedXVelocity = -10;
  } else if(keyCode == RIGHT){             //Move cannon right
    movedXVelocity = 10;
  } else if(key == '5'){                   //Remove cannonballs and reload
      cannonBalls.clear();
      fired = false;
  }
}

void mousePressed(){
  Button[0].update();
  if (cannonBalls.size() < ammo){
  Cannon[0].cannonShot();
  firingTime = millis();
  }
}
