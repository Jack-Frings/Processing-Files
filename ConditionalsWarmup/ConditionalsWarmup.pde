void setup() {
  size(700, 600);
}
int counter = 0;
void draw() {
  background(50, 80, 160);
  ellipseMode(CORNER);
  for (float y = height / 48; y < height; y += height / 6) {
    for (float x = width / 48; x < width; x += width / 7) {
      if (counter % 2 == 0) {
        fill(255, 0, 0);
        counter ++;
      } else {
        fill(220, 240, 90);
        counter ++;
      }
      circle(x, y, width / 12);
    }
    counter += 1;
  }
}
