float r;
float g;
float b;
float a;

int x;
int y;
int diam;

void setup() {
  background(255);
  size(480,270);
}

void draw() {
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  diam = int(random(20));
  x = int(random(width));
  y = int(random(height));
  
  noStroke();
  fill(r, g, b,a);
  ellipse(x,y,diam,diam);
}
