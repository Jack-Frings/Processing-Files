int circleX = 0;
int circleY = 100;
int circleW = 50;
int increase = 1;
color rgb = color(175,175,175);
void setup() {
  fullScreen();
}
void draw() {
  circleX = mouseX;
  circleY = mouseY;
  background(175);
  stroke(0);
  fill(rgb);
  ellipse(circleX,circleY,circleW, circleW);
  if ((circleW + increase) > 0) {
    circleW += increase;
  }
}
void keyPressed() {
  if (key == 'w') {
    increase += 1;
  }
  if (key == 's' ) {
    increase -= 1;
  }
}
void mousePressed() {
  rgb = color(random(0,256),random(0,256),random(0,256));
}
