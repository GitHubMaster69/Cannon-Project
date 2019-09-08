public class ButtonClass  {
  
boolean buttonOver = false;

int buttonX = width/20;
int buttonY = height/5;
int buttonSize = 50;


    ButtonClass(int bX,int bY,int bS, PVector bF){
         buttonX = bX;
         buttonY = bY;
         buttonSize = bS;
       }
       
       
  void buildAButton() {
    fill(255,255,255);
    rectMode(CORNER);
    rect(buttonX,buttonY,buttonSize,buttonSize);
    rectMode(CENTER);
  }
  
boolean overButton(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
  
  

void update() {
  if ( overButton(buttonX, buttonY, buttonSize, buttonSize) ) {
    buttonOver = true;
    } else {
      buttonOver = false;
    }
  if (buttonOver == true){                     //Toggle wind
    windState = !windState;
    println("wind" + windState);
    }
  }
}
