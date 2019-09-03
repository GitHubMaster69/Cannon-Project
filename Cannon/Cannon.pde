Mover[] cannonBall = new Mover[9];
PVector gravity =  new PVector(0,1);
boolean gravityState = true;
PVector wind = new PVector(1,0);
boolean windState = false;
boolean fired = false;
int cannonBalls = 0;
float thiccness = 8.0;


void setup() {
  size(1000,800);
  background(255);
  frameRate(60);
  rectMode(CENTER);
}
 
void draw() {
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
    ellipse(80,height-60,60,60);
    fill(100);
    pushMatrix();
    translate(120,height-120);
    rotate(radians((90-degrees(atan(float((height-mouseY))/float((mouseX+1)))))));
    ellipse(0,0,80,160);
    noStroke();
    rect(0,-60,80,70);
    popMatrix();
    fill(119,69,19);
    stroke(0.5);
    ellipse(130,height-60,60,60);
    fill(100);
}

void cannonShot(){
  cannonBall[cannonBalls] = new Mover(thiccness,180.0,height-138.0,mouseX-100, -mouseY+540);
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
  if(key == '1'){
    windState = !windState;
    println("wind" + windState);
  } else if(key == '2'){
    gravityState = !gravityState;
    println("gravity" + gravityState);
  }
}
