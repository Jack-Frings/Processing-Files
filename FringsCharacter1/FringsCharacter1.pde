//Setup
void setup() {
  size(1400,700);
}
//Dimensions
int w = 100;
int h = 200;
int x = 650;
int y = 340;
//Hat Values
boolean animation = false;
boolean rising = false;
boolean rotating = false;
int hat_x;
int hat_y;
int counter = 0;
//Colors
int r = 150;
int g = 82;
int b = 78;
void draw() {
  background(204);
  x = mouseX;
  y = mouseY;
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
  //Hair
  fill(122,82,42);
  arc(x+w/2,y-h/2,50,20,radians(14),radians(166)); 
  //Top Hat
  if (animation == true && rising == true) {
    counter -= 2;
  }
  if (animation == true && rising == false) {
    counter += 2;
  }
  if (counter == -100) {
    rising = false;
  }
  if (rising == false && counter == 0) {
    animation = false;
  }
  hat_y = hat_y + counter;
  fill(64,54,52);
  rect(hat_x,hat_y-h/2,w,h/16);
  quad(hat_x+w*1/8,hat_y-h,hat_x+w*7/8,hat_y-h,hat_x+w*7/8,hat_y-h/2,hat_x+w*1/8,hat_y-h/2);
  fill(r,g,b);
  quad(hat_x+w*1/8,hat_y-h*10/16,hat_x+w*7/8,hat_y-h*10/16,hat_x+w*7/8,hat_y-h/2,hat_x+w*1/8,hat_y-h/2);
}
void mousePressed() {
  r = int(random(0,256));
  g = int(random(0,256));
  b = int(random(0,256));
}
void keyPressed() {
  if (animation == false) {
    animation = true;
    rising = true;
  }
}
