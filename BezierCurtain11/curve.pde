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
     
   Curve(float PointX,float PointY,float Anchor1x,float Anchor1y,float Anchor2x,float Anchor2y, float Anchor3x, float Anchor3y,float Anchor4x,float Anchor4y, float brightness){


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
       stillAnchor1x = 90+70;
       stillAnchor1y = 890;
       stillAnchor2x = mouseX-70;
       stillAnchor2y = mouseY;
       stillAnchor3x = mouseX+70;
       stillAnchor3y = mouseY;
       stillAnchor4x = 1420-140;
       stillAnchor4y = 890;
  }
  
  void released() {
 
    if (stillPointY < 890) {
        stillPointY += 10;
        stillAnchor2y += 10;
        stillAnchor3y += 10;
      }else if(stillPointY <= 890){
        stillPointY = 890;     
     }
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
     vertex(90, 890);
     //punto centrale-alto di curva
    for ( int i =0; i< points.size(); i++) {
      bezierVertex(-200,//stillAnchor1x,
                   890,//stillAnchor1y,
                   stillAnchor2x,
                   stillAnchor2y,
                   stillPointX,
                   stillPointY);
                   }
    // fine curva             
    bezierVertex(stillAnchor3x, //anchor 3
                 stillAnchor3y,
                 1420-200,//stillAnchor4x, //anchor 4
                 890,//stillAnchor4y,
                 1420-70,
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
     //line(20+70,890,stillAnchor1x,stillAnchor1y);
     line(20+70,890,90+70,890);
     line(stillPointX,stillPointY,stillAnchor2x,stillAnchor2y);
     stroke(0,255,0);
     line(stillPointX,stillPointY,stillAnchor3x,stillAnchor3y);
     //line(1420-70,890,stillAnchor4x,stillAnchor4y);
     line(1420-70,890,1420-140,890);
    // points.draw();
    //print(points.size());
    //this to show if you are in the right area to be able to drag but doesn't show, 
    //must revise
    fill(0,0,255);
    ellipse(stillPointX, stillPointX, 20,20);
   }
  }
  