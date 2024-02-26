boolean original = true;
boolean sudoku = false;
boolean chess = false;
color chess_color = 255;
void setup() {
  size(600, 600);
}
void draw() {
  if (original == true) {
    stroke(1);
    strokeWeight(1);
    for (int y = 0; y < height; y += height / 20) {
      for (int x = 0; x < width; x += width / 20) {
        fill(random(0, 256), random(0, 256), random(0, 256));
        rect(x, y, width / 20, height / 20);
      }
    }
    original = false;
  } else if (sudoku == true) {
    background(255);
    strokeWeight(2);
    for (float x = 0; x < width; x += width / 9.0) {
      if (x == width / 3.0 || x > 399 && x < 401) {
        stroke(0);
        strokeWeight(4);
      }
      else {
        stroke(116);
        strokeWeight(2);
      }
      line(x, 0, x, height);
    }
    for (float y = 0; y < height; y += height / 9.0) {
      if (y == height / 3.0 || y > 399 && y < 401) {
        stroke(0);
        strokeWeight(4);
      } else {
        stroke(116);
        strokeWeight(2);
      }
      line(0, y, width, y);
    }
    sudoku = false;
  } else if (chess == true) {
    stroke(0);
    strokeWeight(1);
    background(0);
    for (int y = 0; y < height; y += height / 8) {
      for (int x = 0; x < width; x += width / 8) {
        if (chess_color == 255) {
          chess_color = 0;
        } else {
          chess_color = 255;
        }
        fill(chess_color);
        rect(x, y, width / 8, height / 8);
      }
      if (chess_color == 255) {
          chess_color = 0;
        } else {
          chess_color = 255;
        }
    }
  }
}
void keyPressed() {
  if (key == 'a') {
    original = true;
    sudoku = false;
    chess = false;
  } else if (key == 's') {
    original = false;
    sudoku = true;
    chess = false;
  }
}
void mousePressed() {
  original = false;
  sudoku = false;
  chess = true;
}
