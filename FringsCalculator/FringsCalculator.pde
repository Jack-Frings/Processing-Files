void setup() {
  size(400, 400);
}
void draw() {
  background(60, 140, 240);
  textAlign(CENTER);
  textSize(40);
  float molarity = molarity_equation(8, 1);
  text(molarity, width / 2, height / 3);
  float answer = calculator(5, 5, '*');
  text(answer, width / 2, height / 2);
  String date = date_converter(5, 21, 2008);
  text(date, width / 2, height * 2 / 3);
  
}
float molarity_equation(float moles, float liters) {
  float molarity = moles / liters;
  return molarity;
}
float calculator(float x, float y, char operation) {
  if (operation == '+') {
    return x + y;
  } else if (operation == '-') {
    return x - y;
  } else if (operation == '*') {
    return x * y;
  } else if (operation == '/') {
    return x / y;
  }
  return 0;
}
String date_converter(int month, int day, int year) {
  return day + "/" + month + "/" + year;
}
