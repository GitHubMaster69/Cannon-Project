ArrayList<Mover> cannonBalls = new ArrayList<Mover>();
CannonClass[] Cannon = new CannonClass[1];
PVector gravity =  new PVector(0,1);
boolean gravityState = true;
PVector wind = new PVector(1,0);
boolean windState = false;
boolean fired = false;
int firingTime;

boolean buttonOver = false;
boolean buttonOver2 = false;
int buttonX = width/20;
int buttonY = height/5;
int buttonX2 = width/20;
int buttonY2 = 100;
int buttonSize = 50;

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
  update(mouseX, mouseY);
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
      //buttons
    rect(buttonX,buttonY,buttonSize,buttonSize);
    rect(buttonX2,buttonY2,buttonSize,buttonSize);
<<<<<<< HEAD

    
    
=======
>>>>>>> 7ddd9cd18f655726d419e1384dbeace6e5f1d106
}

void mouseClicked(){
  if (buttonOver) {
      windState = !windState;
    println("wind" + windState);
  } else if (buttonOver2) {
     gravityState = !gravityState;
     println("gravity" + gravityState);
  } else if (cannonBalls.size() < 9){
  Cannon[0].cannonShot();
  firingTime = millis();
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


boolean overButton(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
boolean overButton2(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

void update(int x, int y) {
  if ( overButton(buttonX, buttonY, buttonSize, buttonSize) ) {
    buttonOver = true;
    buttonOver2 = false;
  } else if ( overButton2(buttonX2, buttonY2, buttonSize, buttonSize) ) {
    buttonOver = false;
    buttonOver2 = true;
  } else {
    buttonOver = buttonOver2 = false;
  }
}
