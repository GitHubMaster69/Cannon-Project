Mover[] cannonBall = new Mover[9];
PVector gravity =  new PVector(0,1);
boolean gravityState = true;
PVector wind = new PVector(1,0);
boolean windState = false;
boolean fired = false;
int cannonBalls = 0;
<<<<<<< HEAD
boolean buttonOver = false;
boolean buttonOver2 = false;
int buttonX = width/20;
int buttonY = height/5;
int buttonX2 = width/20;
int buttonY2 = 100;
int buttonSize = 50;
=======

>>>>>>> 44bf0cf5f2e23a9ea99f3146f7f64913b91e4771
void setup() {
  size(1000,800);
  background(255);
  frameRate(60);
  rectMode(CENTER);
}
 
void draw() {
  update(mouseX, mouseY);
  background(255);
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
  
    //Cannon
    fill(119,69,19);
    ellipse(50,height-60,60,60);
    ellipse(100,height-60,60,60);
    fill(100);
    pushMatrix();
    translate(120,height-120);
    rotate(45);
    ellipse(0,0,80,160);
    noStroke();
    rect(0,-60,80,70);
    popMatrix();
    fill(119,69,19);
    stroke(0.5);
    ellipse(100,height-60,60,60);
    fill(100);
    resetMatrix();
    
    //buttons
    rect(buttonX,buttonY,buttonSize,buttonSize);
    rect(buttonX2,buttonY2,buttonSize,buttonSize);
 
    
}

void cannonShot(){
  cannonBall[cannonBalls] = new Mover(8.0,180.0,height-138.0,mouseX-100, -mouseY+540);
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
  }
}

void keyPressed(){
  if(key == '1'){
    windState = !windState;
    println("wind" + windState);
  } else if(key == '2'){
    gravityState = !gravityState;
    println("gravity" + gravityState);
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
