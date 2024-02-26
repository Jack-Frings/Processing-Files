Snake s;
void setup() {
  size(500, 500);
  frameRate = 120;
  s = new Snake(320);
}

void draw() {
  background(255);
  
  s.display();
}
void keyPressed() {
  s.changeColor();
}
