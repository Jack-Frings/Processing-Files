//Setup
//Dimensions
int w = 20;
int h = 40;
int x = 650;
int y = 340;
//Hat Values
int hat_x;
int hat_y;
//Colors
int r = 255;
int g = 0;
int b = 0;
// Graivty
float speed = 0;
float gravity = 0.2;
// Movement
float side_speed;
boolean[] keys;
boolean jumping;
float jump_height;
float jump_divisor;
float move_value;
void setup() {
  size(1400,700);
  keys = new boolean[2];
  keys[0] = false;
  keys[1] = false;
  jump_height = height / 100;
  jump_divisor = 100;
}
void draw() {
  for (int y = 0; y < height; y += width / 16) {
    for (int x = 0; x < width; x += width / 8) {
      strokeWeight(3);
      stroke(0,255,0);
      fill(0,120,0);
      rect(x, y, width / 8, height / 8);
      fill(0, 255, 0);
      circle(x + width / 16, y + height / 16, height / 8);
      fill(255, 0, 0);
      textAlign(CENTER);
      textSize(64);
      text("$", x + width / 16, y + height * 3 / 32); 
    }
  }
  jump_height = height / jump_divisor;
  if (jumping) {
    y -= jump_height;
    move_value = 5;
  } else {
    move_value = 8;
  }
  if ((y + h * 7 / 4) >= height) {
    y = height - (h * 7 / 4);
    speed = 0;
    jumping = false;
    jump_divisor = 100;
    jump_height = height / jump_divisor;
  } else {
    y += speed;
    if (gravity < jump_height) {
      speed += gravity;
    }
  }
  if (keys[0]) {
    x -= move_value;
  }
  if (keys[1]) {
    x += move_value;
  }
  draw_man(x, y);
}
void mousePressed() {
  r = int(random(0,256));
  g = int(random(0,256));
  b = int(random(0,256));
}
void keyPressed() {
  if (key == 'a') {
    keys[0] = true;
  } else if (key == 'd') {
    keys[1] = true;
  } 
  if (key == ' ' && !jumping) {
    jumping = true;
  } if (key == ' ' && jumping && jump_divisor > 75) {
    jump_divisor -= 20;
  }
}
void keyReleased() {
  if (key == 'a') {
    keys[0] = false;
  } else if (key == 'd') {
    keys[1] = false;
  }
}
void draw_man(int x, int y) {
  textAlign(CORNER);
  strokeWeight(1);
  stroke(1);
  hat_x = x;
  hat_y = y;
  //Name
  fill(r,g,b);
  textSize(104);
  text("Professor Layton",325,100);
  //Shirt
  fill(255,255,255);
  rect(x,y,w,h);
  //Jacket
  fill(64,54,52);
  arc(x,y+h/2,w/2,h,radians(270),radians(450));
  arc(x+w,y+h/2,w/2,h,radians(90),radians(270));
  //Tie
  beginShape();
  vertex(x+w*2/5,y);
  vertex(x+w*3/5,y);
  vertex(x+w*3/5,y+h*7/8);
  vertex(x+w/2,y+h*15/16);
  vertex(x+w*2/5,y+h*7/8);
  endShape();
  //Legs
  quad(x,y+h+(h/40),x+w/3,y+h+(h/40),x+w/3,y+h+h*3/4,x,y+h+h*3/4);
  quad(x+w,y+h+(h/40),x+w*2/3,y+h+(h/40),x+w*2/3,y+h+h*3/4,x+w,y+h+h*3/4);
  //Belt
  fill(0,0,0);
  quad(x,y+h,x+w,y+h,x+w,y+h+(h/40),x,y+h+(h/40));
  //Jacket Arms
  fill(64,54,52);
  quad(x,y,x-w/3,y,x-w/3,y+h,x,y+h);
  quad(x+w,y,x+w+w/3,y,x+w+w/3,y+h,x+w,y+h);
  //Shirt Arm
  fill(255,255,255);
  quad(x,y+h*7/8,x-w/3,y+h*7/8,x-w/3,y+h,x,y+h);
  quad(x+w,y+h*7/8,x+w+w/3,y+h*7/8,x+w+w/3,y+h,x+w,y+h);
  //Hands
  fill(203,165,130);
  quad(x,y+h*15/16,x-w/3,y+h*15/16,x-w/3,y+h,x,y+h);
  quad(x+w,y+h*15/16,x+w+w/3,y+h*15/16,x+w+w/3,y+h,x+w,y+h);
  //Shoes
  fill(0,0,0);
  quad(x,y+h+h*3/4,x,y+h+h*7/10,x+w/3,y+h+h*7/10,x+w/3,y+h+h*3/4);
  quad(x+w,y+h+h*3/4,x+w-w/3,y+h+h*3/4,x+w-w/3,y+h+h*7/10,x+w,y+h+h*7/10);
  //Neck
  fill(203,165,130);
  quad(x+w/6,y-h/4,x+w*5/6,y-h/4,x+w*5/6,y,x+w/6,y);
  //Head
  ellipse(x+w/2,y-h/4,w,h/2);
  //Eyes
  fill(0,0,0);
  ellipse(x+w/3,y-h/3.5,w/10,h/10);
  ellipse(x+w*2/3,y-h/3.5,w/10,h/10);
  //Smile
  noFill();
  arc(x+w/2,y-h/4,w/2,h/4,radians(60),radians(120));
  fill(64,54,52);
  rect(hat_x,hat_y-h/2,w,h/16);
  quad(hat_x+w*1/8,hat_y-h,hat_x+w*7/8,hat_y-h,hat_x+w*7/8,hat_y-h/2,hat_x+w*1/8,hat_y-h/2);
  fill(r,g,b);
  quad(hat_x+w*1/8,hat_y-h*10/16,hat_x+w*7/8,hat_y-h*10/16,hat_x+w*7/8,hat_y-h/2,hat_x+w*1/8,hat_y-h/2);
}
