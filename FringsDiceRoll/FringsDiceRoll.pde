int diameter;
char dice;
void setup() {
  size(400,400);
  diameter = width / 4;
}
void draw() {
  fill(0);
}
void keyPressed() {
  chooser(key);
}
void chooser(char choice) {
  if (choice == '1') {
    background(225,150,60);
    dice_one();
  }
  else if (choice == '2') {
    background(90,40,120);
    dice_two();
  }
  else if (choice == '3') {
    background(240,220,80);
    dice_three();
  }
  else if (choice == '4') {
    background(66,140,66);
    dice_four();
  }
  else if (choice == '5') {
    background(210,80,80);
    dice_five();
  }
  else if (choice == '6') {
    background(50,100,170);
    dice_six();
  }
  else if (choice == 'r') {
    dice = char(int(random(1,7)) + 48);
    chooser(dice);
  }
}
void dice_one() {
  circle(width / 2, height / 2,diameter);
}
void dice_two() {
  circle(width / 4, height / 4,diameter);
  circle(width * 3 / 4, height * 3 / 4, diameter);
}
void dice_three() {
  dice_one();
  dice_two();
}
void dice_four() {
  dice_two();
  circle(width * 3 / 4, height / 4, diameter);
  circle(width / 4, height * 3 / 4, diameter);
}
void dice_five() {
  dice_one();
  dice_four();
}
void dice_six() {
  dice_four();
  circle(width / 4, height / 2, diameter);
  circle(width * 3 / 4, height / 2, diameter);
}
