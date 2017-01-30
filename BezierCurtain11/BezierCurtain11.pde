Curve aCurve; // curve class
color c;
float bright;
int count = 0;
boolean pressed;
boolean dragged;

void setup() {

  size( 500, 1000 );  // good for an iPad horizontal
  //fullScreen();
  //rectMode(CENTER);
  strokeWeight(2);
  aCurve = new Curve(mouseX,mouseY,90+70,890,mouseX-70,mouseY,mouseX+70, mouseY, 1420-140,890,bright); //passing arguments
  pressed = false;
  dragged = false;
}
  void draw() {
  print(bright); 
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
    
    if(count != 0){ // keep the array containing only one point, so remove after the first time mouse is pressed
    aCurve.removePoint(); // keep only one point in array (for now)
      pressed = false;
    }
    if(bright <= 020){
    // PointX,PointY,Anchor1x,Anchor1y,Anchor2x,Anchor2y,Anchor3x,Anchor3y,Anchor4x,Anchor4y,brightness){
    aCurve.addPoint(mouseX,mouseY,90+70,890,mouseX-70,mouseY, mouseX+70, mouseY, 1420-140,890,bright);
    count++;
    pressed = true;
    return;
    }
  }
  void mouseDragged() {
    pressed = true;
   aCurve.dragPoint();
   }

  void mouseReleased(){
  pressed = false;
  }