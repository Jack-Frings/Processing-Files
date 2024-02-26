int x;
int y;
int spacing;
int length;

void setup() {
  size(400, 400);
  background(255);
  x = 50;
  y = 50;
  spacing = 50;
  length = 200;
}

void draw() {
  for (int x = 50; x <= 350; x += spacing) {
    line(x, y, x, y + length);
  }
}
