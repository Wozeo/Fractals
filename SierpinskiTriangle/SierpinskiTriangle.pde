void setup()
{
 fullScreen();
 background(0);
}
class PointF
{
  float x, y;
  public PointF(float x, float y)
  {
    this.x = x;
    this.y = y;
  }
};
int maxDepth = 1;
void recurs(PointF a, PointF b, PointF c, int depth)
{
  if(depth==maxDepth)return;
  fill(0);
  triangle((a.x+b.x)/2,(a.y+b.y)/2,b.x,a.y,(b.x+c.x)/2,(b.y+c.y)/2);
  
  
  recurs(a,new PointF((a.x+b.x)/2,(a.y+b.y)/2), new PointF(b.x,a.y),depth+1);
  
  recurs(new PointF(b.x,a.y),new PointF((b.x+c.x)/2,(b.y+c.y)/2),c,depth+1);
  
  recurs(new PointF((a.x+b.x)/2,(a.y+b.y)/2),b, new PointF((b.x+c.x)/2,(b.y+c.y)/2),depth+1);

}
void keyPressed() {
  if (key == CODED) {
    switch(keyCode)
    {
      case DOWN:
      maxDepth--;
      if(maxDepth<0) maxDepth = 0;
      break;
      case UP:
      maxDepth++;
      if(maxDepth>10)maxDepth = 10;
      break;
    }
  }
}
void draw()
{
  background(0);
  fill(255);
  text("Up/Down arrows to change depth",0,15);
  text("Depth: "+maxDepth,0,30);
  fill(255);
  triangle(0,height,width/2,0,width,height);
  recurs(new PointF(0,height), new PointF(width/2,0), new PointF(width,height), 0);
}
