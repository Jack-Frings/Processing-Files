void setup() {
  size(640, 360);
}

void draw() {
}

void keyPressed() {
  color r = color(random(256), random(256), random(256));
  drawSquare(r);
}

void mousePressed() {
  color r = color(random(256), random(256), random(256));
  drawCircle(r);
}

void drawSquare(color rgb) {
  fill(rgb);
  noStroke();
  rect(width / 2, height / 2, 50, 50);
}

void drawCircle(color rgb) {
  fill(rgb);
  noStroke();
  ellipse(100, 100, 40, 40);
}
