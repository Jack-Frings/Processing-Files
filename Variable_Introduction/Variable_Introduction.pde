// variable declarations --> type + identifier
int x;
int y;
color c;
int w;
int xChange;
int yChange;
void setup() {
  fullScreen();
  // variable initializations
  x = width / 2;
  y = height / 2;
  c = #ffff00; // equivalent to color(255, 255, 0);
  w = 150;
  xChange = 100;
  yChange = 100;
}
void draw() {
  background(255-c);
  fill(c);
  ellipse(x, y, w, w);
  x += xChange;
  y += yChange;
  if (x > width - w/ 2|| x < w / 2) {
    xChange = -xChange;
  } else if (y > height - w / 2|| y < w / 2) {
    yChange = -yChange;
  }
}
void keyPressed() {
  if (key == 'w') {
    y -= 5;
  } else if (key == 'a') {
    x -= 5;
  } else if (key == 's') {
    y += 5;
  } else if (key == 'd') {
    x += 4;
  }
  }
void mousePressed() {
  c = color(random(256), random(256),random(256));
}
