/*
public class ButtonClass  {
  
boolean buttonOver = false;

int buttonX;
int buttonY;
int buttonSize;
boolean[] effects = new boolean[2];
effects[0] = windState;
effects[1] = gravityState;

    ButtonClass(int bX,int bY,int bS, int i) {
         buttonX = bX;
         buttonY = bY;
         buttonSize = bS;
         effects[i] = i;
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
    effects[i] = !effects[i];    }
  }
}

*/
