float x = 250;   // x position
float y = 13;     // y position

float speed = 0; // velocity
float gravity = 0.1; //acceleration

boolean[] keys;

void setup() {
  size(500, 500);
  keys = new boolean[2];
  keys[0] = false;
  keys[1] = false;
}
void draw() {
  background(255);
  
  //drw the ball
  fill(0);
  noStroke();
  ellipse(x, y, 30, 30);
  y += speed;
  speed += gravity;
  if (y > height - 15) {
    y = height - 15;
    speed *= -0.8;
  }
  if (y < 15) {
    y = 15;
    speed *= 0.8;
  }
  if (keys[0] == true) {
    x -= 4;
  }
  if (keys[1] == true) {
    x += 4;
  }
  if ((x - 15) < 0) {
    x = 15;
  } else if ((x + 15) > width) {
    x = width - 15;
  }
  textSize(24);
  text("Position: " + y, 20, 20);
  text("Speed: " + speed, 20, 50);
  text("Accleration: " + gravity, 20, 80);
}
void keyPressed() {
  if (key == ' ') {
    speed = -2;
  }
  if (key == 'a') {
    keys[0] = true;
  } else if (key == 'd') {
    keys[1] = true;
  }
}
void keyReleased() {
  if (key == 'a') {
    keys[0] = false;
  } else if (key == 'd') {
    keys[1] = false;
  }
}
