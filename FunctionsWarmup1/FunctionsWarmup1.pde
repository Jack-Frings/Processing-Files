float x;
float y;

float xspeed;
float yspeed;

void setup() {
  size(640, 360);
  x = width / 2;
  y = height / 2;
  
  xspeed = random(-10, 10);
  yspeed = random(-10, 10);
}

void draw() {
  background(100);
  xMovement();
  yMovement();
  drawBall();
}

void xMovement() {
  x += xspeed;
  if (x < 20) {
    x = 20;
    xspeed *= -1;
  } else if (x > width - 20) {
    x = width - 20;
    xspeed *= -1;
  }
}

void yMovement() {
  y += yspeed;
  
  if (y < 20) {
    y = 20;
    yspeed *= -1;
  } else if (y > height - 20) {
    y = height - 20;
    yspeed *= -1;
  }
}

void drawBall() {
  noStroke();
  fill(240, 160, 30);
  ellipse(x, y, 40, 40);
}
