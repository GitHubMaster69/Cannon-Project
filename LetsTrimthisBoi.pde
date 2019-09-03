//Mover[] ball = new Mover[0];
Mover[] cannonBall = new Mover[9];
PVector gravity =  new PVector(0,1);
boolean gravityState = true;
PVector wind = new PVector(1,0);
boolean windState = false;
boolean fired = false;
int cannonBalls = 0;

void setup() {
  size(1000,800);
  background(255);
  frameRate(144);
  rectMode(CENTER);
/*  for(int i = 0; i < ball.length; i++){
    ball[i] = new Mover(random(3.2,8.2),random(50,width),random(50,height));
}*/
}
 
void draw() {
  background(255);
  /*for(int i = 0; i < ball.length; i++){
    if(gravityState){
    ball[i].applyForce(gravity);
    }
    if(windState){
    ball[i].applyForce(wind);
    }
    ball[i].checkEdges();
    ball[i].update();
    ball[i].checkEdges();
    ball[i].display();
    //println(float(frameCount)/(float(millis()/1000)));
  }*/
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
    //println(float(frameCount)/(float(millis()/1000)));
  }
  }
  
    //Cannon
    translate(frameCount,0);
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
    //rotate(-45);
    ellipse(100,height-60,60,60);
    fill(100);
    translate(-frameCount,0);
}

void cannonShot(){
  int i = cannonBall.length;
  fill(100);
  cannonBall[cannonBalls] = new Mover(3.0,180.0,height-138.0,mouseX-100, -mouseY+540);
  fired = true;
  cannonBalls++;
  i++;
  println("FIRE");
  println(cannonBall[0].velocity, cannonBall[0].location);
}

void mouseClicked(){
  if(cannonBalls < 9){
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
