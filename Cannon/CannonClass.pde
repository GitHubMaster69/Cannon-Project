class CannonClass {
  
  int wheelSize;
  int speed ;
  int power;
  
  CannonClass(int wS, int s, int p){      //These variables aren't actually used at present
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
    if(movedX < 825){
    } else {
      movedX = 824;
    }
    
    pushMatrix();
    translate(movedX, 0);
    
    pushMatrix();                          //Left wheel
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
    rotate(radians((90-degrees(atan(float((height-mouseY))/float((mouseX+1)))))));      //Rotation of barrel according to mouse
    if(millis()-firingTime < 300){
    pushMatrix();
    rotate(radians(-45));
    boom.resize(int(800*0.5),int(600*0.5));               //800x600 Muzzle flash when firing
    image(boom,-90,-270);
    popMatrix();
    }
    noStroke();
    ellipse(0,0,82,160);        //Barrel+Fuse
    rect(0,-60,80,80);
    fill(119,69,19);
    rect(-30,40,45,5);
    fill(100);
    rect(-20,40,45,15);
    popMatrix();
    
    pushMatrix();
    noFill();                             //Right Wheel
    stroke(119,69,19);
    strokeWeight(15);
    ellipse(130,height-60,90,90);
    strokeWeight(1);
    translate(130,height-60);
    rotate(-radians(360*(movedX/60*PI)));
    fill(119,69,19);
    rect(0,0,80,15);
    rect(0,0,15,80);
    translate(-130,-(height-60));
    popMatrix();
    popMatrix();
    rectMode(CORNER);
    fill(0,mouseX,0);
    rect(200,10,min(mouseX, 600),10);    //powerthingy OwO
    rectMode(CENTER);
}
void cannonShot(){
  cannonBalls.add(new Mover(thiccness,180.0+movedX,height-138.0,mouseX-100, -mouseY+540));
  fired = true;
  }
}

void keyReleased(){
  if(keyCode == LEFT || keyCode == RIGHT){
    movedXVelocity = 0;
  }
}
