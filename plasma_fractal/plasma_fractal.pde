void setup()
{
  fullScreen();
  background(0);
  frameRate(1);
}
  float displace(float num)
  {
    float max = num / (float)(width + height) * 3;
    return ((float)random(1) - 0.5f) * max;
  }
  
  color computeColor(float c)
  {    
    float red = 0;
    float green = 0;
    float blue = 0;
    
    if (c < 0.5) red = c * 2;
    else red = (1.0f - c) * 2;
    
    if (c >= 0.3 && c < 0.8) green = (c - 0.3) * 2;
    else if (c < 0.3) green = (0.3 - c) * 2;
    else green = (1.3 - c) * 2;
    
    if (c >= 0.5) blue = (c - 0.5) * 2;
    else blue = (0.5 - c) * 2;
    
    return color(red*255, green*255, blue*255);
  }
void DrawRect(float x, float y, float Width, float Height, float LUColor, float LDColor, float RUColor, float RDColor)
{
    float midPoint = ((LUColor+LDColor+RUColor+RDColor)/4+displace(Width/2+Height/2)), 
    midPointLeft = ((LUColor+LDColor)/2), 
    midPointDown = ((LDColor+RDColor)/2), 
    midPointUp = ((LUColor+RUColor)/2 ), 
    midPointRight = ((RUColor+RDColor)/2);

  if (!(Width>1 || Height>1)){ 
    set((int)x,(int)y,computeColor(midPoint));
  return;
}

  DrawRect(x, y, Width/2, Height/2, LUColor, midPointLeft, midPointUp, midPoint);
  DrawRect(x+Width/2, y, Width/2, Height/2, midPointUp, midPoint, RUColor, midPointRight);
  DrawRect(x+Width/2, y+Height/2, Width/2, Height/2, midPoint, midPointDown, midPointRight, RDColor);  
  DrawRect(x, y + Height/2, Width/2, Height/2, midPointLeft, LDColor, midPoint, midPointDown);
}
int counter = 0;
void draw()
{
  float LU = random(1), 
    LD = random(1), 
    RU = random(1), 
    RD = random(1);
  background(0);
  DrawRect(0, 0, width-1, height-1, LU, LD, RU, RD);
  //save(counter+++".png");
}
