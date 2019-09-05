class CannonClass {
  
  int wheelSize;
  int speed ;
  int power;
  
  CannonClass(int wS, int s, int p){
    wheelSize = wS;
    speed = s;
    power = p;
  }
    
  void drawCannon(){
    if(movedX > -50){
    movedX += movedXVelocity;
    } else {
      movedX = -49;
    }
    pushMatrix();
    translate(movedX, 0);
    noStroke();
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
}
