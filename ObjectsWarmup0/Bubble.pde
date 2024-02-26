class Bubble {
  float x;
  float y;
  float diameter;
  float ySpeed;
  
  Bubble(float tempX) {
    x = tempX;
    y = height;
    diameter = random(16, 96);
    ySpeed = map(diameter, 16, 96, 3, 1);
  }
  Bubble(float tempX, float tempY) {
    x = tempX;
    y = tempY;
    diameter = random(16, 96);
    ySpeed = map(diameter, 16, 96, 3, 1);
  }
  void ascend() {
    y-= ySpeed;
  } 
  
  void display() {
    noStroke();
    fill(255, y);
    ellipse(x, y, diameter, diameter);
  }
  
  void top() {
    if (y + diameter / 2 < 0) {
      x = random(width);
      y = height + diameter;
    }
  }
}
