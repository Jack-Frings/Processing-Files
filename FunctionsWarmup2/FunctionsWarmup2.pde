float player_x = 100;
float player_y = 100;
float chaser_x = 300;
float chaser_y = 300;
float radius = 50;
float player_movement_speed = 8;
float enemy_movement_speed = 6;
boolean[] keys;
void setup() {
  size(1400, 800);
  keys = new boolean[4];
  keys[0] = false;
  keys[1] = false;
  keys[2] = false;
  keys[3] = false;
}

void draw() {
  background(100);
  if (keys[0] && (player_x-radius/2>0)) {
    player_x -= player_movement_speed;
  }
  if (keys[1] && (player_y-radius/2>0)) {
    player_y -= player_movement_speed;
  }
  if (keys[2] && (player_y+radius/2<height)) {
    player_y += player_movement_speed;
  }
  if (keys[3] && (player_x+radius/2<width)) {
    player_x += player_movement_speed;
  }
  createObject(player_x, player_y, radius);
  createChaser(chaser_x, chaser_y, radius);
  chaser_x = moveChaserX(chaser_x, player_x);
  chaser_y = moveChaserY(chaser_y, player_y);
}

void createObject(float player_x, float player_y, float radius) {
  fill(0, 0, 255);
  ellipseMode(CENTER);
  circle(player_x, player_y, radius);
}

void createChaser(float chaser_x, float chaser_y, float radius) {
  fill(255, 0, 0);
  circle(chaser_x, chaser_y, radius);
}
float moveChaserX(float chaser_x, float player_x) {
  if (chaser_x < player_x) {
    chaser_x += enemy_movement_speed;
  } else if (chaser_x > player_x) {
    chaser_x -= enemy_movement_speed;
  }
  return chaser_x;
}

float moveChaserY(float chaser_y, float player_y) {
  if (chaser_y < player_y) {
    chaser_y += enemy_movement_speed;
  } else if (chaser_y > player_y) {
    chaser_y -= enemy_movement_speed;
  }
  return chaser_y;
}
void keyPressed() {
  if (key == 'a') {
    keys[0] = true;
  } else if (key == 'w') {
    keys[1] = true;
  } else if (key == 's') {
    keys[2] = true;
  } else if (key == 'd') {
    keys[3] = true;
  }
}
void keyReleased() {
  if (key == 'a') {
    keys[0] = false;
  } else if (key == 'w') {
    keys[1] = false;
  } else if (key == 's') {
    keys[2] = false;
  } else if (key == 'd') {
    keys[3] = false;
  }
}
