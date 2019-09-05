Mover[] cannonBall = new Mover[9];
PVector gravity =  new PVector(0,1);
boolean gravityState = true;
PVector wind = new PVector(1,0);
boolean windState = false;
boolean fired = false;
int cannonBalls = 0;
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
}
 
void draw() {
  update(mouseX, mouseY);
  background(255);
  drawCannon();
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
  void drawCannon(){
    if(movedX > -50){
    movedX += movedXVelocity;
    } else {
      movedX = -49;
    }
    pushMatrix();
    translate(movedX, 0);
    fill(119,69,19);
    pushMatrix();
    noFill();
    stroke(119,69,19);
    strokeWeight(15);
    ellipse(80,height-60,90,90);
    strokeWeight(1);
    popMatrix();
    pushMatrix();
    translate(80,height-60);
    rotate(-radians(360*(movedX/60*PI)));
    fill(119,69,19);
    rect(0,0,80,15);
    rect(0,0,15,80);
    popMatrix();
    fill(100);
    pushMatrix();
    translate(120,height-100);
    rotate(radians((90-degrees(atan(float((height-mouseY))/float((mouseX+1)))))));
    if(millis()-firingTime < 300){
    pushMatrix();
    rotate(radians(-45));
    boom.resize(int(800*0.5),int(600*0.5)); //800x600
    image(boom,-90,-270);
    popMatrix();
    }
    ellipse(0,0,82,160);
    noStroke();
    rect(0,-60,80,80);
    popMatrix();
    fill(119,69,19);
    noFill();
    stroke(119,69,19);
    strokeWeight(15);
    ellipse(130,height-60,90,90);
    strokeWeight(1);
    translate(130,height-60);
    rotate(-radians(360*(movedX/60*PI)));
    fill(119,69,19);
    rect(0,0,80,15);
    rect(0,0,15,80);
    rotate(radians(360*(movedX/60*PI)));
    translate(-130,-(height-60));
    fill(100);
    popMatrix();
}

void cannonShot(){
  cannonBall[cannonBalls] = new Mover(thiccness,180.0+movedX,height-138.0,mouseX-100, -mouseY+540);
  fired = true;
  cannonBalls++;
  println(cannonBall[0].velocity, cannonBall[0].location);
}

void mouseClicked(){
  if (buttonOver) {
      windState = !windState;
    println("wind" + windState);
  } else if (buttonOver2) {
     gravityState = !gravityState;
     println("gravity" + gravityState);
  } else if (cannonBalls < 9){
  cannonShot();
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
