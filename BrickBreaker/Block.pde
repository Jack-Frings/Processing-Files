class Block {
  float x;
  float y;
  Block(float temp_x, float temp_y) {
    x = temp_x;
    y = temp_y;
  }
  void show() {
    rectMode(CORNER);
    strokeWeight(5);
    fill(0,0,150);
    rect(x * 20, y * 20, 20, 20);
    strokeWeight(1);
    fill(255);
  }
}
