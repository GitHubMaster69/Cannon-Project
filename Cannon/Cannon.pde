Mover[] cannonBall = new Mover[9];
CannonClass[] Cannon = new CannonClass[1];
PVector gravity =  new PVector(0,1);
boolean gravityState = true;
PVector wind = new PVector(1,0);
boolean windState = false;
boolean fired = false;
int cannonBalls = 0;

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

void setup() {
  size(1000,800);
  background(255);
  frameRate(60);
  rectMode(CENTER);
  Cannon[0] = new CannonClass(3,3,3);
}
 
void draw() {
  update(mouseX, mouseY);
  background(255);
  Cannon[0].drawCannon();
  if(fired){
    for(int i = 0; i < cannonBalls; i++){
    if(gravityState && cannonBall[i].location.y < height-(cannonBall[i].size/2)){
    cannonBall[i].applyForce(gravity);
    }
    if(windState){
    cannonBall[i].applyForce(wind);
    }
    cannonBall[i].checkEdges();
    cannonBall[i].update();
    cannonBall[i].checkEdges();
    cannonBall[i].display();
  }
  }
      //buttons
    rect(buttonX,buttonY,buttonSize,buttonSize);
    rect(buttonX2,buttonY2,buttonSize,buttonSize);
}

void mouseClicked(){
  if (buttonOver) {
      windState = !windState;
    println("wind" + windState);
  } else if (buttonOver2) {
     gravityState = !gravityState;
     println("gravity" + gravityState);
  } else if (cannonBalls < 9){
  Cannon[0].cannonShot();
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
      cannonBall = new Mover[9];
      fired = false;
      cannonBalls = 0;
  }
}

void keyReleased(){
  if(keyCode == LEFT || keyCode == RIGHT){
    movedXVelocity = 0;
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
