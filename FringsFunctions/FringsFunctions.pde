String equation = "";
boolean have_solved = false;
void setup() {
  size(500, 500);
}

void draw() {
  drawCalculator();
  display_equation(equation);
}
void mousePressed() {
  if (have_solved) {
    have_solved = false;
    equation = "";
  }
  collision_detection();
}
void drawCalculator() {
  background(200);
  rectMode(CORNER);
  textSize(60);
  textAlign(CORNER);
  int count = 14;
  for (int y = height * 5 / 18; y < height * 5 / 6; y += height / 4) {
    count -= 7;
    for (int x = width / 16; x < width; x += width / 4) {
      fill(0);
      rect(x, y, width / 6, height / 6);
      fill(255);
      if (count == 10) {
        text("+", (x + width / 12) - width / 40, (y + height / 12) + height / 30);
      } else if (count == 7 && x > width / 2) {
        text("-", (x + width / 12) - width / 40, (y + height / 12) + height / 30);
      } else if (!(count == 4 && x > width / 2)) {
        text(count, (x+width / 12)-width/40, (y + height / 12)+height/30);
      }
      count += 1;
    }
  }
  fill(60, 140, 80);
  rect(width * 13 / 16 + width / 12, height * 7 / 9, width / 12, height / 6);
  fill(255);
  text("0", width * 28 / 34, height * 65 / 72);
  text("=", width * 31 / 34, height * 65 / 72);
}
void display_equation(String equation) {
  rectMode(CENTER);
  fill(0);
  rect(width / 2, height / 8, width, height / 5);
  textAlign(CENTER);
  fill(255);
  textSize(60);
  text(equation, width / 2, height * 5 / 32);
}
 
  
void collision_detection() { 
  boolean can_add_operation = operation_in();
  if (height * 5 / 18 < mouseY && mouseY < height * 5 / 18 + height / 6) {
    if (width / 16 < mouseX && mouseX < width / 16 + width / 6) {
      equation  += "7";
    } else if (width / 16 + width / 4 < mouseX && mouseX < width / 16 + width / 4 + width / 6) {
      equation += "8";
    } else if (width / 16 + width / 2 < mouseX && mouseX < width / 16 + width / 2 + width / 6) {
      equation += "9";
    } else if (width * 13 / 16 < mouseX && mouseX < width * 13 / 16 + width / 6 && can_add_operation) {
      equation += "+";
    }
  } else if (height * 5 / 18 + height / 4 < mouseY && mouseY < height * 5 / 18 + height / 4 + height / 6) {
    if (width / 16 < mouseX && mouseX < width / 16 + width / 6) {
      equation  += "4";
    } else if (width / 16 + width / 4 < mouseX && mouseX < width / 16 + width / 4 + width / 6) {
      equation += "5";
    } else if (width / 16 + width / 2 < mouseX && mouseX < width / 16 + width / 2 + width / 6) {
      equation += "6";
    } else if (width * 13 / 16 < mouseX && mouseX < width * 13 / 16 + width / 6 && can_add_operation) {
      equation += "-";
    }
  } else if (height * 5 / 18 + height / 2 < mouseY && mouseY < height * 5 / 18 + height / 2 + height / 6) {
    if (width / 16 < mouseX && mouseX < width / 16 + width / 6) {
      equation  += "1";
    } else if (width / 16 + width / 4 < mouseX && mouseX < width / 16 + width / 4 + width / 6) {
      equation += "2";
    } else if (width / 16 + width / 2 < mouseX && mouseX < width / 16 + width / 2 + width / 6) {
      equation += "3";
    } else if (width * 13 / 16 < mouseX && mouseX < width * 13 / 16 + width / 12) {
      equation += "0";
    } else if (width * 13 / 16 + width / 12 < mouseX && mouseX < width * 13 / 16 + width / 6 && (can_add_operation == false)) {
      char operation = 'a';
      int index = -1;
      for (int i = 0; i < equation.length(); i++) {
        if (equation.charAt(i) == '+') {
          operation = '+';
          index = i;
          break;
        } else if (equation.charAt(i) == '-') {
          operation = '-';
          index = i;
          break;
        }
      }
      equation = solve_equation(operation, index);
    }
  }
}

boolean operation_in() {
  int plus_position = equation.indexOf("+");
  int minus_position = equation.indexOf("-");
  if (plus_position == -1 && minus_position == -1 && equation.length() != 0) {
    return true;
  }
  return false;
}

String solve_equation(char operation, int index) {
  int first = Integer.parseInt(equation.substring(0, index));
  int second = Integer.parseInt(equation.substring(index));
  have_solved = true;
  if (operation == '+') {
    return Integer.toString(first + second);
  } else if (operation == '-') {
    // Retains negative
    return Integer.toString(first + second);
  }
  return "filler";
}
