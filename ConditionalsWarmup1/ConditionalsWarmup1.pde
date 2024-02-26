int grade;
int specification;
String letter;
float gpa;
void setup() {
  size(680, 400);
  grade = int(random(50,101));
}
void draw() {
  //Letter Grade
  if (grade >= 90) {
    background(0,255,0);
    letter = "A";
    gpa = 4.0;
  } else if (grade >= 80) {
    background(50,200,0);
    letter = "B";
    gpa = 3.0;
  } else if (grade >= 70) {
    background(255,255,0);
    letter = "C";
    gpa = 2.0;
  } else if (grade >= 60) {
    background(200,0,0);
    letter = "D";
    gpa = 1.0;
  } else {
    background(255,0,0);
    letter = "F";
    gpa = 0;
  }
  //determine pluses/minuses
  specification = grade % 10;
  if (specification > 6 && grade > 59 || grade == 100) {
    letter += "+";
    gpa += 0.3;
  } else if (specification < 3 && grade > 59) {
    letter += "-";
    gpa -= 0.3;
  }
  textSize(96);
  textAlign(CENTER);
  text("Percent: " + grade,width / 2, height / 2 - 50);
  text("Letter: " + letter, width / 2, height / 2 + 50);
  text("GPA: "  + gpa, width / 2, height / 2 + 150);
}
void keyPressed() {
  if (key == ' ') {
    grade = int(random(50,101));
  } else if (key == 'a') {
    grade = 100;
  }
}
