public class ButtonClass  {
  
boolean buttonOver = false;

int buttonX = width/20;
int buttonY = height/5;
int buttonSize = 50;


    ButtonClass(int bX,int bY,int bS){
         buttonX = bX;
         buttonY = bY;
         buttonSize = bS;
       }
       
       
  void buildAButton() {
    rect(buttonX,buttonY,buttonSize,buttonSize);
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
}
}
}
