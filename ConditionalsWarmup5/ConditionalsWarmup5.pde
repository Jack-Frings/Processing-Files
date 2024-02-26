float number = 0;
float goUpSpeed = 0.01;
float goUpCost = 3.14;
float power = 1;

void setup() {
  size(500, 500);
}

void draw() {
  background(100);
  fill(255);
  
  textSize(42);
  textAlign(CENTER);
  text("NUMBER: ", width / 2, 50);
  text(nf(number, 0 , 2), width / 2, 100);
  text("NUMBER GO UP SPEED: ", width / 2, 200);
  text(nf(goUpSpeed, 0, 2), width / 2, 250);
  text("NUMBER GO UP COST: ", width / 2, 350);
  text(nf(goUpCost, 0 ,2), width /2, 400);
  
  number += goUpSpeed;
}
void mousePressed() {
  if (number > goUpCost) {
    number -= goUpCost;
    goUpSpeed += 0.01;
    power += 0.5;
    goUpCost = pow(3.14, power);
  }
}
void keyPressed() {
  if (key == ' ') {
    number += 1000;
  } else if (key == 'a') {
    number = 0;
  }
}
