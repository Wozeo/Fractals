void setup()
{
  fullScreen();
}
class Point
{
  float x, y;
  public Point(float x, float y)
  {
    this.x = x;
    this.y = y;
  }
};
Point rotate_point(float cx,float cy,float angle,Point p)
{
  float s = sin(angle);
  float c = cos(angle);
  p.x -= cx;
  p.y -= cy;
  float xnew = p.x * c - p.y * s;
  float ynew = p.x * s + p.y * c;
  p.x = xnew + cx;
  p.y = ynew + cy;
  return p;
}
void branch(float x, float y, float size, float angleSum, float angle, int depth)
{
  Point p = new Point(x,y-size);
  Point left = rotate_point(x,y,angleSum-angle,p);
  line(x, y, left.x, left.y);
  recurs(angle/angleDivider,angleSum-angle, left.x, left.y, size/widthDivider,depth+1);
}
void recurs(float angle,float angleSum, float x, float y, float size, int depth)
{
  if (depth==maxDepth) return;
  branch(x,y,size,angleSum,-angle,depth);
  branch(x,y,size,angleSum,angle,depth);
}

void keyPressed() {
  if (key == CODED) {
    switch(keyCode)
    {
      case LEFT:
      angle--;
      break;
      case RIGHT:
      angle++;
      break;
      case DOWN:
      maxDepth--;
      if(maxDepth<0) maxDepth = 0;
      break;
      case UP:
      maxDepth++;
      if(maxDepth>20)maxDepth = 20;
      break;
    }
  }
  else
  {
    switch((key+"").toLowerCase()){
      case "e":
      initialWidth++;
      break;
      case "q":
      initialWidth--;
      break;
      case "t":
      widthDivider+=0.1;
      break;
      case "r":
      widthDivider-=0.1;
      if(widthDivider<0.1) widthDivider = 0.1;
      break;
      case "f":
      angleDivider-=0.05;
      if(angleDivider<0.1) angleDivider = 0.1;
      break;
      case "g":
      angleDivider+=0.05;
      break;
    }
  }
}
int angle = 1;
float maxDepth = 5;
int initialWidth = 100;
float widthDivider = 1.2;
float angleDivider = 1.2;
int counter = 0;
void draw()
{
  background(0);
  stroke(255);
  /*
  initialWidth = (int)random(100,200);
  maxDepth = (int)random(5,13);
  angle = (int)random(0,720);
  widthDivider = random(0.1,2.5);
  */
    text("Left/Right arrows to change angle",0,15);
    text("Up/Down arrows to change exit condition",0,30);
    text("Q/E keys to change width",0,45);
        text("R/T keys to change width divider",0,60);
        text("f/g keys to change angle divider",0,75);
    text("Angle:"+angle+" Depth:"+maxDepth+" Width:"+initialWidth+" Width Divider:"+widthDivider+" Angle Divider:"+angleDivider,0,90);
  strokeWeight(2);
  recurs(angle*(PI/180),0, width/2, height/2,initialWidth,0);
 //save(counter+++".png");
}
