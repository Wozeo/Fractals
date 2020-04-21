void setup()
{
  fullScreen(P3D);
  background(0);
}
float turnX = 0.5;
float turnY = 0.5;
float transZ = 0;
int maxDepth = 2;
void recurs(int Width, int depth)
{
  if (depth==maxDepth) {
    box(Width+1);
    return;
  }
  for (int y = 0; y<3; y++)
  {
    for (int z = 0; z<3; z++)
    {
      for (int x = 0; x<3; x++)
      {
        pushMatrix();
        translate((-x+1)*(Width/3), (-y+1)*(Width/3), (-z+1)*(Width/3));
        if (!((x == 1 && y==1 && z==1) ||
          (x==1 && y==1)||
          (x==1 && z==1)||
          (y==1 && z==1)))
        {
          recurs(Width/3, depth+1);
        }
        popMatrix();
      }
    }
  }
}
void keyPressed() {
  if (key == CODED) {
    switch(keyCode)
    {
    case DOWN:
      maxDepth--;
      if (maxDepth == 0) maxDepth = 1;
      break;
    case UP:
      maxDepth++;
      if (maxDepth>7) maxDepth = 7;
      break;
    }
  } else
  {
    switch((key+"").toLowerCase())
    {
    case "w":
      turnX-=0.1;
      break;
    case "s":
      turnX+=0.1;
      break;
    case "a":
      turnY+=0.1;
      break;
    case "d":
      turnY-=0.1;
      break;
    case "e":
      transZ+=15;
      break;
    case "q":
      transZ-=15;
      break;
    }
  }
}
void draw()
{
  background(0);
  text("Up/Down arrows to change depth", 0, 15, 0);
  text("W/A/S/D keys to move around and Q/E to zoom in and out", 0, 30, 0);
  text("Depth: "+maxDepth, 0, 45, 0);

  translate(width/2, height/2, transZ);
  rotateX(turnX);
  rotateY(turnY);
  fill(255);
  stroke(125);
  //box(width/2);
  recurs(width/2, 1);
  fill(255);
}
