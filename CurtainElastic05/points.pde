class Point {
  
    float pointX;
    float pointY;
    float anchor1x;
    float anchor1y;
    float anchor2x;
    float anchor2y;

   Point(float tempPointX,
         float tempPointY,
         float tempAnchor1x,
         float tempAnchor1y,
         float tempAnchor2x,
         float tempAnchor2y) {
    pointX = tempPointX;
    pointY = tempPointY;
    anchor1x = tempAnchor1x;
    anchor1y = tempAnchor1y;
    anchor2x = tempAnchor2x;
    anchor2y = tempAnchor2y;
    
    noStroke();
    fill(255,0,0);
    ellipse(pointX, pointY, 30, 30);
  }

  void draw() {

  }

}