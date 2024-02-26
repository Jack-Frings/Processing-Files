class Button {
  int x, y, w, h;
  String label;
  
  Button(int tempX, int tempY, String tempLabel) {
    x = tempX;
    y = tempY;
    w = 30;
    h = 50;
    label = tempLabel;
  }
  
  void display() {
    fill(0, 255, 0);
    noStroke();
    rect(x, y, w, h);
    textSize(48);
    fill(255);
    text(label, x + 5, y + 40);
  }
  boolean wasClicked(int mX, int mY) {
    if (x <= mX && mX <= x + w && y <= mY && mY <= y + h) {
      return true;
    } else {
      return false;
    }
  }
}
