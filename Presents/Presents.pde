int object_width = 100;
int object_height = 100;
float x;
float y;
boolean b;
void setup() {
  size(400, 400);
}

void draw() {
  background(255);
  drawPresents();
}
void drawPresents() {
  b = true;
  for (float y = mouseY - object_height * 4; y <= mouseY + object_height * 4; y += object_height) {
    for (float x = mouseX - object_width * 4; x <= mouseX + object_height * 4; x += object_height) {
      createPresent(x, y, b);
      b = !b;
    }
  }
}
void createPresent(float x, float y, boolean b) {
  rectMode(CENTER);
  strokeWeight(1);
  if (b) {
    fill(255, 0, 0);
  } else {
    fill(0, 255, 0);
  }
  rect(x, y, object_width, object_height);
  
  if (b) {
    fill(0, 255, 0);
  } else {
    fill(255, 0, 0);
  }
  noStroke();
  beginShape();
  vertex(x - object_width / 2, y - object_height / 2 + object_height / 10);
  vertex(x - object_width / 2, y - object_height / 2);
  vertex(x - object_width / 2 + object_width / 10, y - object_height / 2);
  vertex(x + object_width / 2, y + object_height / 2 - object_height / 10);
  vertex(x + object_width / 2, y + object_height / 2);
  vertex(x + object_width / 2 - object_width / 10, y + object_height / 2);
  endShape();
  beginShape();
  vertex(x + object_width / 2, y - object_height / 2 + object_height / 10);
  vertex(x + object_width / 2, y - object_height / 2);
  vertex(x + object_width / 2 - object_width / 10, y - object_height / 2);
  vertex(x - object_width / 2, y + object_height / 2 - object_height / 10);
  vertex(x - object_width / 2, y + object_height / 2);
  vertex(x - object_width / 2 + object_width / 10, y + object_height / 2);
  endShape();
  
}
