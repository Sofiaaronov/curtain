Curve aCurve; // curve class
color c;
float bright;
int count = 0;
int countBounce = 0;
boolean pressed;
boolean dragged;
boolean bounce00;
float pointX;
float pointY;
float anchor1x;
float anchor1y;
float anchor2x;
float anchor2y;
float anchor3x;
float anchor3y;
float anchor4x;
float anchor4y;
void setup() {
    pointX = mouseX;;
    pointY = mouseY;
    anchor1x = 20+300;
    anchor1y = 890;
    anchor2x = mouseX-150;
    anchor2y = mouseY;
    anchor3x = mouseX+150;
    anchor3y = mouseY;
    anchor4x = 1420-300;
    anchor4y = 890;
  size( 500, 1000 );  // good for an iPad horizontal
  //fullScreen();
  //rectMode(CENTER);
  strokeWeight(2);
  
  aCurve = new Curve(pointX,pointY,anchor1x,anchor1y,anchor2x,anchor2y,anchor3x,anchor3y,anchor4x,anchor4y,bright,pressed); //passing arguments
  pressed = true;
  dragged = false;
  
}
  void draw() {
    
    pointX = mouseX;;
    pointY = mouseY;
    anchor1x = 20+150;
    anchor1y = 890;
    anchor2x = mouseX-150;
    anchor2y = mouseY;
    anchor3x = mouseX+150;
    anchor3y = mouseY;
    anchor4x = 1420-10;
    anchor4y = 890;
    
  //print(bright); 
  c = get(mouseX, mouseY);
  bright = brightness(c);
  //print(bright);
  background(255);
  aCurve.draw();
   if(pressed == false){
   aCurve.released();
   }
}

  void mousePressed() {
    
    //pressed = true;
    //println (pressed);
    if(count != 0){ // keep the array containing only one point, so remove after the first time mouse is pressed
    aCurve.removePoint(); // keep only one point in array (for now)
    //pressed = false;
    }
    if(bright <= 020){
    // PointX,PointY,Anchor1x,Anchor1y,Anchor2x,Anchor2y,Anchor3x,Anchor3y,Anchor4x,Anchor4y,brightness){
    aCurve.addPoint(pointX,pointY,anchor1x,anchor1y,anchor2x,anchor2y,anchor3x,anchor3y,anchor4x,anchor4y,bright);
    count++;
    aCurve.resetBounce00();
    
    //return;
    }
    pressed = true;
  }
  void mouseDragged() {
   aCurve.dragPoint();
   pressed = true;
   //println("dragged");
   //println (pressed);
   }

  void mouseReleased(){
  pressed = false;
  println (pressed);
  }