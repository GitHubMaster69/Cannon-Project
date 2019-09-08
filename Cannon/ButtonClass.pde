
public class ButtonClass  {
  
boolean buttonOver = false;

int buttonX;
int buttonY;
int buttonSize;
boolean effect;


    ButtonClass(int bX,int bY,int bS, boolean bE) {
         buttonX = bX;
         buttonY = bY;
         buttonSize = bS;
         effect = bE;
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
  
  

void update(int i) {
  if ( overButton(buttonX, buttonY, buttonSize, buttonSize) ) {
    buttonOver = true;
    } else {
      buttonOver = false;
    }
  if (buttonOver == true){                     //Toggle wind
    Button[i].effect = !Button[i].effect;    }
  }
}
