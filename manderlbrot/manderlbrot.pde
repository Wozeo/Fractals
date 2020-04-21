void setup()
{
  size(200,200);
  background(0);
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
  
  void fractal(float left, float top, float xside, float yside) 
{ 
    float xscale, yscale, zx, zy, cx, tempx, cy; 
    int x, y; 
    int maxx, maxy, count; 
    maxx = width; 
    maxy = height; 
    xscale = xside / maxx; 
    yscale = yside / maxy;  
    rect(0, 0, maxx, maxy); 
    for (y = 1; y <= maxy - 1; y++) { 
        for (x = 1; x <= maxx - 1; x++) 
        { 
            cx = x * xscale + left;
            cy = y * yscale + top; 
            zx = 0; 
            zy = 0; 
            count = 0; 
            while ((zx * zx + zy * zy < 4) && (count < 30)) 
            { 
                tempx = zx * zx - zy * zy + cx; 
                zy = 2 * zx * zy + cy; 
                zx = tempx; 
                count = count + 1; 
            } 
            stroke(count);
            point(x,y);
        } 
    } 
} 
    float left = -1.75, top= -0.25, xside=0.25, yside=0.25;
    
void keyPressed() {
  if (key == CODED) {
    switch(keyCode)
    {
    case DOWN:
top-=0.01;
      break;
    case UP:
    top+=0.01;
      break;
   case LEFT:
    left+=0.05;
   break;
   case RIGHT:
    left-=0.05;
   break;
    }
  }
  else
  {
    switch(key)
    {
      case 'e':
      left-=0.1;
      top-=0.1;
      xside-=0.1;
      yside-=0.1;
      break;
      case 'q':
      left+=0.1;
      top+=0.1;
      xside+=0.1;
      yside+=0.1;
      break;
    }
  }
}
void draw()
{
    fractal(left, top, xside, yside); 
 }
