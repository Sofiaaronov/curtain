class Curve{

  ArrayList<Point> points = new ArrayList<Point>();

     float stillPointX; // position of the middle vertex
     float stillPointY;
     float stillAnchor1x; // anchors of the first point making the curve
     float stillAnchor1y;
     float stillAnchor2x; // anchors of the second point making the curve (stillPoint)
     float stillAnchor2y;
     float stillAnchor3x; // anchors of the first point making the curve
     float stillAnchor3y;
     float stillAnchor4x; // anchors of the second point making the curve (stillPoint)
     float stillAnchor4y;
     float brightness;
     boolean drag = false;
     boolean released = false;
     float easing = 0.05;
     float distance00;
     float distance01;
     float distance02;
     float distance03;
     float distance04;
     float distance05;
     float distance06;
     float distance07;
     float underCurve01;
     float underCurve02;
     float underCurve03;
     float underCurve04;
     float upCurve01;
     float upCurve02;
     float upCurve03;
     boolean bounce00 = true;
     boolean bounce01 = false;
     boolean bounce02 = false;
     boolean bounce03 = false;
     boolean bounce04 = false;
     boolean bounce05 = false;
     boolean bounce06 = false;
     boolean bounce07 = false;
     boolean pressed;
     
   Curve(float PointX,float PointY,float Anchor1x,float Anchor1y,float Anchor2x,float Anchor2y, float Anchor3x, float Anchor3y,float Anchor4x,float Anchor4y, float brightness, boolean pressed){


   }
                         
  void addPoint(float PointX,float PointY,float Anchor1x,float Anchor1y,float Anchor2x,float Anchor2y, float Anchor3x, float Anchor3y,float Anchor4x,float Anchor4y,float brightness) {
  //get the color of the pixel where the mouse is: if it is different than white means 
  //it is touching the line and so a new point is generated

   
    // if cursor is touching the line then save those coordinates
    // and change values name to "still", so the line won't follow the cursor position
    // but get its coordinates only when mousePressed event happens
       stillPointX = PointX;
       stillPointY = PointY;
       stillAnchor1x = Anchor1x;
       stillAnchor1y = Anchor1y;
       stillAnchor2x = Anchor2x;
       stillAnchor2y = Anchor2y;
       stillAnchor3x = Anchor3x;
       stillAnchor3y = Anchor3y;
       stillAnchor4x = Anchor4x;
       stillAnchor4y = Anchor4y;
       
       
    
    //make a new point object
    points.add(0,new Point(stillPointX,
                           stillPointY,
                           stillAnchor1x,
                           stillAnchor1y,
                           stillAnchor2x,
                           stillAnchor2y));
                         
  
  }
  
  void dragPoint(){
    // when mouseDragged transform "still" back to the mouse position
   
       stillPointX = mouseX;
       stillPointY = mouseY;
       stillAnchor1x = 20+300;
       stillAnchor1y = 890;
       stillAnchor2x = mouseX-150;
       stillAnchor2y = mouseY;
       stillAnchor3x = mouseX+150;
       stillAnchor3y = mouseY;
       stillAnchor4x = 1420-300;
       stillAnchor4y = 890;
  }
  
  void released() {
   
    /* bounce01 = false;
     bounce02 = false;
     bounce03 = false;
     bounce04 = false;
     bounce05 = false;
     bounce06 = false;
     bounce07 = false;*/
    // facciamo che il massimo che la sotto curva raggiunge è meta dell'amount di raising, ossia di mouseY, 
    //ma dall'altra parte del piano ovviamente
   //-----------------------------------------------------------bounce00 
    easing = 0.07;
    underCurve01 = 890 + (890 - mouseY)/2;
    distance00 = underCurve01 - stillPointY;
    if (stillPointY <= underCurve01 && bounce00 == true) {
        stillPointY += distance00 * easing +2;
      }
      
      if (stillPointY >= underCurve01 && pressed == false) {  
        bounce00 = false;
        bounce01 = true;
    //-----------------------------------------------------------bounce01   
      }
      if (bounce01 == true) {
        upCurve01 = mouseY + (890-mouseY)/2;
        distance01 = underCurve01 - upCurve01;
        stillPointY -= distance01 * easing;
      }
      if (stillPointY <= upCurve01 && bounce01 == true && pressed == false) {
        bounce01 = false;
        bounce02 = true;
      }
     //-----------------------------------------------------------bounce02 
      if(bounce02 == true){
      underCurve02 = 890 + (890 - mouseY)/4;
      distance02 = underCurve02 - upCurve01;
      stillPointY += distance02 * easing;
      }
      if (stillPointY >= underCurve02 && bounce02 == true && pressed == false) {
        stillPointY = underCurve02;
        bounce03 = true;
        //bounce00 = true;
        bounce02 = false;
      //if mouse is pressed and then released > bounce == true)
      //println("bounce00"+bounce00);
      println("bounce00"+bounce00);
      println("bounce01"+bounce01);
      println("bounce02"+bounce02);      
    }
  }
  void resetBounce00(){
  bounce00 = true;
  }
  void removePoint(){
  points.remove(0);
  }
  
  void draw() {
    //print(stillAnchor1x);
    //print(stillAnchor4x);
    //print(stillAnchor2x);
    //print(stillAnchor3x);
    //print(stillPointX);
    //print(released);
    beginShape();
    fill(0,0,255,60);
    noStroke();
    rect(20,20,1400,870);
    endShape();
    //generate the curve made of 4 points, 3 of those are vertex one is bezierVertex 
    //to be able to add handles for the curve
    beginShape();
    stroke(0, 0, 0);
    strokeWeight(5);
    fill(255);
    //corner low left
     vertex(20, 890);
     //inizio curva
     vertex(20, 890);
     //punto centrale-alto di curva
    for ( int i =0; i< points.size(); i++) {
      bezierVertex(stillAnchor1x,
                   stillAnchor1y,
                   stillAnchor2x,
                   stillAnchor2y,
                   stillPointX,
                   stillPointY);
                   }
    // fine curva             
    bezierVertex(stillAnchor3x, //anchor 3
                 stillAnchor3y,
                 stillAnchor4x, //anchor 4
                 stillAnchor4y,
                 1420,
                 890);
    //corner low right
    vertex(1420, 890);
    //corner high right
    vertex(1420, 20);
    //corner high left
    vertex(20, 20);
    endShape(CLOSE);  
   
     stroke(255,0,0);
     //draw anchors lines
     stroke(255,0,0);
     line(20,890,stillAnchor1x,stillAnchor1y);
     line(stillPointX,stillPointY,stillAnchor2x,stillAnchor2y);
     stroke(0,255,0);
     line(stillPointX,stillPointY,stillAnchor3x,stillAnchor3y);
     line(1420,890,stillAnchor4x,stillAnchor4y);
     
    // points.draw();
    //print(points.size());
    //this to show if you are in the right area to be able to drag but doesn't show, 
    //must revise
    fill(0,0,255);
    ellipse(stillPointX, stillPointY, 20,20);
   }
  }
  