import peasy.PeasyCam;
import java.util.*; 
class PointN
{
  public float x,y,z;
  public PointN(float x, float y,float z)
  {
    this.x = x;
    this.y = y;
    this.z = z;
  }
}
float x=0.01,y=0,z=0;

//Astea conteaza
float a=12,b=30,c=8.0/3.0;


PeasyCam cam;
void setup()
{
  size(1000,1000,P3D);
  colorMode(HSB);
    v.add(new PointN(x,y,z));
  v.add(new PointN(x,y,z));
  cam = new PeasyCam(this,5000);
}
Vector v = new Vector(); 
void draw()
{
  background(0);
  float dt = 0.01;
  float dx = (a *(y-x))*dt;
  float dy = (x*(b-z)-y)*dt;
  float dz = (x*y-c*z)*dt;
  x+=dx;
  y+=dy;
  z+=dz;
  translate(width/2,height/2);
  scale(5);
  noFill();
  
  float hu = 0.1;
  beginShape();
  for(Object p:v)
  {
      stroke(hu,255,255);
    vertex(((PointN)p).x,((PointN)p).y,((PointN)p).z);
    hu+=0.1;
    hu%=255;
  }
  endShape();
  
  v.add(new PointN(x,y,z));
}
