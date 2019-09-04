Mover[] cannonBall = new Mover[9];
PVector gravity =  new PVector(0,1);
boolean gravityState = true;
PVector wind = new PVector(1,0);
boolean windState = false;
boolean fired = false;
int cannonBalls = 0;
float thiccness = 8.0;
int movedX = 0;
int movedXVelocity = 0;

void setup() {
  size(1000,800);
  background(255);
  frameRate(48);
  rectMode(CENTER);
}
 
void draw() {
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
}
  void drawCannon(){
    if(movedX > -10){
    movedX += movedXVelocity;
    }
    pushMatrix();
    translate(movedX, 0);
    noStroke();
    fill(119,69,19);
    ellipse(80,height-60,60,60);
    fill(255);
    ellipse(80,height-60,40,40);
    fill(119,69,19);
    pushMatrix();
    translate(80,height-60);
    rotate(-radians(360*(movedX/30*PI)));
    rect(0,0,40,10);
    rect(0,0,10,40);
    popMatrix();
    fill(100);
    pushMatrix();
    translate(120,height-120);
    rotate(radians((90-2*degrees(atan(float((height-mouseY))/float((mouseX+1)))))));
    ellipse(0,0,82,160);
    noStroke();
    rect(0,-60,80,80);
    popMatrix();
    fill(119,69,19);
    ellipse(130,height-60,60,60);
    fill(255);
    ellipse(130,height-60,40,40);
    fill(119,69,19);
    translate(130,height-60);
    rotate(radians(360*(movedX/30*PI)));
    rect(0,0,40,10);
    rect(0,0,10,40);
    rotate(-radians(360*(movedX/30*PI)));
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
  if(cannonBalls < 9){
  cannonShot();
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
