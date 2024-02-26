float player_x;
float player_y;

float ball_x;
float ball_y;
float x_slope = 1;
float y_slope = 1;
float velocity = 2;
boolean last_collision = true;

boolean[] keys;

void setup() {
  size(600, 400);
  keys = new boolean[2];
  keys[0] = false;
  keys[1] = false;
  player_x = width / 2;
  player_y = int(height * 15 / 16);
  ball_x = width / 2;
  ball_y = height / 2;
}

void draw() {
  background(0);
  move_paddle();
  move_ball();
  if (boundary_collisions()) {
    textAlign(CENTER);
    textSize(24);
    text("Game Over", width / 2, height / 2);
  } else {
    paddle_collisions();
  }
}

void paddle_collisions() {
  if (ball_x + 5 > player_x - 20 && ball_x - 5 < player_x + 20 && ball_y - 5 < player_y + 5 && ball_y + 5 > player_y - 5 && last_collision) {
    y_slope *= -1;
    velocity += 0.1;
    last_collision = false;
  }
}

void move_paddle() {
  rectMode(CENTER);
  rect(player_x, player_y, 40, 10);
  if (keys[0] && player_x - 20 > 0) {
    player_x -= 5;
  }
  if (keys[1] && player_x + 20 < width) {
    player_x += 5;
  }
}

boolean boundary_collisions() {
  if (ball_y >= height) {
    return true;
  }
  if (ball_y - 5 <= 0) {
    y_slope *= -1;
    last_collision = true;
    velocity += 0.1;
  }
  if (ball_x - 5 <= 0 || ball_x + 5 >= width) {
    x_slope *= -1;
    last_collision = true;
    velocity += 0.1;
  }
  return false;
}

void move_ball() {
  ball_x += x_slope * velocity;
  ball_y += y_slope * velocity;
  circle(ball_x, ball_y, 10);
}

void keyPressed() {
  if (key == 'a') {
    keys[0] = true;
  }
  if (key == 'd') {
    keys[1] = true;
  }
}

void keyReleased() {
  if (key == 'a') {
    keys[0] = false;
  }
  if (key == 'd') {
    keys[1] = false;
  }
}
