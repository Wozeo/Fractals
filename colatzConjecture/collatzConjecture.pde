import java.util.*;
void setup()
{
  size(1000,1000);

}
long colats(long n)
{
  return ((n%2==1)?((n*3+1))/2:(n/2));
}
int len = 5;
float angle = PI/20;
void draw()
{
  background(0);
  translate(width/2,height);
  for(long i = 1;i<10000;i++)
  {
    long n = i;
    resetMatrix();
  translate(width/2,height);
    Vector v = new Vector();
    v.add(n);
    do{
      n = colats(n);
      v.add(n);
    }while(n!=1);
    
    Collections.reverse(v);
    for(int j = 0;j<v.size();j++)
    {
      if((long)(v.get(j))%2==1) rotate(-angle);
      else rotate(angle);
      
      strokeWeight(5);
      stroke(255,40);
      line(0,0,0,-len);
      translate(0,-len);
    }
  }
}
