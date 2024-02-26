int first_y;
int second_y;
float ball_x;
float ball_y;
float velocity;
float diameter;
float x_slope = 1;
float y_slope = 0.9;
boolean[] keys;
int score_1 = 0;
int score_2 = 0;
int impact = 2;
int stage = 0;
color mouse_color = #FFFFFF;
void setup() {
  fullScreen();
  background(0);
  first_y = height / 2;
  second_y = height / 2;
  ball_x = width / 2;
  ball_y = height / 2;
  diameter = width / 48;
  velocity = width / 300;
  keys = new boolean[4];
  keys[0] = false;
  keys[1] = false;
  keys[2] = false;
  keys[3] = false;
}
void draw() {
  background(0);
  textAlign(CENTER);
  if (stage == 0) {
    textSize(width/6);
    fill(255);
    text("Pong",width/2,height/2);
    if (mouseX > (width / 4) && mouseX < (width * 3 / 4) && mouseY > (height * 75 / 108 - height / 12) && mouseY < (height * 75 / 108 + height / 12)) {
      mouse_color = #FAE650;
    }
    else {
      mouse_color = #FFFFFF;
    }
    fill(mouse_color);
    stroke(mouse_color);
    textSize(width/12);
    text("Play",width/2,height*20/27);
    rectMode(CENTER);
    noFill();
    rect(width/2,height*75/108,width/2,height/6);
  }
  if (stage == 1) {
    //Score
    fill(255);
    stroke(255);
    textSize(width/12);
    if (score_1 == 7) {
      ball_x = width / 2;
      ball_y = height / 2;
      velocity = 0;
      text("Player 1 Wins!",width/2,height/8);
    }
    else if (score_2 == 7) {
      ball_x = width / 2;
      ball_y = height / 2;
      velocity = 0;
      text("Player 2 Wins!",width/2,height/8);
    }
    else {
      text(score_1 + "-" + score_2,width/2,height/8);
    }
    //Scoring
    if (ball_x <= 0) {
      score_2 ++;
      ball_x = width / 2;
      ball_y = height / 2;
      velocity = width / 300;
    }
    if (ball_x > width) {
      score_1 ++;
      ball_x = width / 2;
      ball_y = height / 2;
      velocity = width / 300;
    }
    //Paddles Movement
    stroke(0);
    if (keys[0] && (first_y-height/8) > 0) {
      first_y -= width / 120;
    }
    if (keys[1] && (first_y+height/8) < height) {
      first_y += width / 120;
    }
    if (keys[2] && (second_y-height/8) > 0) {
      second_y -= width / 120;
    }
    if (keys[3] && (second_y+height/8 < height)) {
      second_y += width / 120;
    }
    rect(width/32,first_y,width/48,height/4);
    rect(width*31/32,second_y,width/48,height/4);
    //Ball
    circle(ball_x,ball_y,diameter);
    ball_x += (velocity*x_slope);
    ball_y += (velocity*y_slope);
    //Bouncing Off Walls
    if ((ball_y - diameter / 2) <= 0) {
      y_slope *= -1;
    }
    else if ((ball_y + diameter / 2) >= height) {
      y_slope *= -1;
    }
    //Bouncing Off 1st Paddle
    if (ball_x <= (width/32+width/48) && impact == 1) {
      if ((first_y - height / 8) < ball_y && ball_y < first_y && keys[0]) { 
        x_slope *= -1;
        y_slope *= 0.5;
        velocity += width / 1200;
        impact = 2;
    } else if (first_y < ball_y && ball_y < (first_y + height / 8) && keys[1]) {
        x_slope *= -1;
        y_slope *= -0.5;
        velocity += width / 1200;
        impact = 2;
    } else if ((first_y - height / 8) < ball_y &&  ball_y < (first_y + height / 8)) {
        x_slope *= -1;
        velocity += width / 1200;
        impact = 2;
      }
    }
    //Bouncing Off 2nd Paddlee
    if ((second_y - height / 8) < ball_y &&  ball_y < (second_y + height / 8)) {
      if (ball_x >= (width*31/32-width/48) && impact == 2) {
        x_slope *= -1;
        velocity += width / 1200;
        impact = 1;
      }
    }
  }
}
void mousePressed() {
  if (stage == 0 && mouseX > (width / 4) && mouseX < (width * 3 / 4) && mouseY > (height * 75 / 108 - height / 12) && mouseY < (height * 75 / 108 + height / 12)) {
    stage = 1;
  }
}
//Paddles Movement
void keyPressed() {
  if (key == 'w') {
    keys[0] = true;
  }
  if (key == 's') {
    keys[1] = true;
  }
  if (keyCode == 38) {
    keys[2]= true;
  }
  if (keyCode == 40) {
    keys[3] = true;
  }
}
void keyReleased() {
  if (key == 'w') {
    keys[0] = false;
  }
  if (key == 's') {
    keys[1] = false;
  }
  if (keyCode == 38) {
    keys[2] = false;
  }
  if (keyCode == 40) {
    keys[3] = false;
  }
}
