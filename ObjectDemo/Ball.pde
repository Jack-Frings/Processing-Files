class Ball {
  // instance variables --> data for an object
  float x;
  float y;
  float xSpeed;
  float ySpeed;
  // constructor --> method to create (instantiate) an object
  Ball() {
    x = width / 2;
    y = height / 2;
    xSpeed = 3;
    ySpeed = 7;
  }
  Ball(int tempX) {
    x = tempX;
    y = height / 2;
    xSpeed = 3;
    ySpeed = 7;
  }
  Ball(int tempX, int tempY) {
    x = tempX;
    y = tempY;
    xSpeed = 3;
    ySpeed = 7;
  }
  Ball(int tempX, int tempY, int tempXSpeed, int tempYSpeed) {
    x = tempX;
    y = tempY;
    xSpeed = tempXSpeed;
    ySpeed = tempYSpeed;
  }
  void update() {
    x += xSpeed;
    y += ySpeed;

    if (x < 25) {
      x = 25;
      xSpeed *= -1;
    } else if (x > width - 25) {
      x = width - 25;
      xSpeed *= -1;
    }

    if (y < 25) {
      y = 25;
      ySpeed *= -1;
    } else if (y > height - 25) {
      y = height - 25;
      ySpeed *= -1;
    }
  }

  void display() {
    fill(255, 0, 128);
    stroke(0, 128, 255);
    ellipse(x, y, 50, 50);
  }
}
