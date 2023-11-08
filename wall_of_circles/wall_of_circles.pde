void setup() 
{
  size(1200, 720);
  clear_canvas(255, 255, 255);
  stroke(0);
}

void clear_canvas(int r, int g, int b) 
{
  background(r, g, b); 
}

void draw() {
  int x = int(random(1) * width);
  int y = int(random(1) * height);
  int w = int(20 + random(1) * 100);
  int h = int(20 + random(1) * 100);
  int r = int(random(1) * 255);
  int g = int(random(1) * 255);
  int b = int(random(1) * 255);
  
  fill(r, g, b);
  ellipse(x, y, w, h);
  
  if (frameCount < 600) 
  {
      saveFrame("frames/####.tif");
  }
  else 
  {
    exit();
  }
}
