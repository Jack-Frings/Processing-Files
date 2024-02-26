int x;
int y;
int d = 250;

float red = 0;
float green = 0;
float blue = 0;

float distance;

boolean cycle = true;
void setup() {
  size(500, 500);
  x = width / 2;
  y = height / 2;
}
void draw() {
  background(255);
  
  stroke(0);
  distance = dist(mouseX, mouseY, x, y);
  if (cycle == true) {
    if (distance < d/2) {
      red = 0;
      green = 122;
      blue = 0;
    } else {
      red = 122;
      green = 0;
      blue = 0;
    }
  }
  fill(red,green,blue);
  circle(x,y,d);
}
void mousePressed() {
  if (cycle == true) {
    cycle = false;
  } else if (cycle == false) {
    cycle = true;
  }
}
