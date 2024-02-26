int randint;
String odd_even;
String positive_negative;
void setup() {
  size(800,400);
  randint = int(random(0,51)) - 25;
}
void draw() {
  if ((randint % 2) == 0) {
    odd_even = "Even";
  }
  else {
    odd_even = "Odd";
  }
  
  if (randint > 0) {
    background(0,160,0);
    positive_negative = "Positive";
  } else if (randint < 0) {
    background(160,0,0);
    positive_negative = "Negative";
  } else {
    background(0);
    positive_negative = "Zero";
  }
  fill(255);
  textAlign(CENTER);
  textSize(40);
  text("Integer: " + randint, width/2,height/3);
  text(odd_even, width/2, height / 2);
  text(positive_negative, width / 2, height * 2 / 3);
}
void keyPressed() {
  randint = int(random(0, 51)) - 25;
  if (key == '0') {
    randint = 0;
  }
}
