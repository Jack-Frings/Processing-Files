class Suit {
  float x, y, w, h;
  Suit() {
    x = 650;
    y = 340;
    w = 100;
    h = 200;
  }
  Suit(float tempX, float tempY, float tempW, float tempH) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
  }
  void name() {
    textSize(104);
    textAlign(CENTER);
    text("Professor Layton", width / 2, w);
  }
  void display() {
    //Shirt
    fill(255, 255, 255);
    rect(x, y, w, h);
    //Jacket
    fill(64, 54, 52);
    arc(x, y+h/2, w/2, h, radians(270), radians(450));
    arc(x+w, y+h/2, w/2, h, radians(90), radians(270));
    //Tie
    beginShape();
    vertex(x+w*2/5, y);
    vertex(x+w*3/5, y);
    vertex(x+w*3/5, y+h*7/8);
    vertex(x+w/2, y+h*15/16);
    vertex(x+w*2/5, y+h*7/8);
    endShape();
    //Legs
    quad(x, y+h+(h/40), x+w/3, y+h+(h/40), x+w/3, y+h+h*3/4, x, y+h+h*3/4);
    quad(x+w, y+h+(h/40), x+w*2/3, y+h+(h/40), x+w*2/3, y+h+h*3/4, x+w, y+h+h*3/4);
    //Belt
    fill(0, 0, 0);
    quad(x, y+h, x+w, y+h, x+w, y+h+(h/40), x, y+h+(h/40));
    //Jacket Arms
    fill(64, 54, 52);
    quad(x, y, x-w/3, y, x-w/3, y+h, x, y+h);
    quad(x+w, y, x+w+w/3, y, x+w+w/3, y+h, x+w, y+h);
    //Shirt Arm
    fill(255, 255, 255);
    quad(x, y+h*7/8, x-w/3, y+h*7/8, x-w/3, y+h, x, y+h);
    quad(x+w, y+h*7/8, x+w+w/3, y+h*7/8, x+w+w/3, y+h, x+w, y+h);
    //Hands
    fill(203, 165, 130);
    quad(x, y+h*15/16, x-w/3, y+h*15/16, x-w/3, y+h, x, y+h);
    quad(x+w, y+h*15/16, x+w+w/3, y+h*15/16, x+w+w/3, y+h, x+w, y+h);
    //Shoes
    fill(0, 0, 0);
    quad(x, y+h+h*3/4, x, y+h+h*7/10, x+w/3, y+h+h*7/10, x+w/3, y+h+h*3/4);
    quad(x+w, y+h+h*3/4, x+w-w/3, y+h+h*3/4, x+w-w/3, y+h+h*7/10, x+w, y+h+h*7/10);
    //Neck
    fill(203, 165, 130);
    quad(x+w/6, y-h/4, x+w*5/6, y-h/4, x+w*5/6, y, x+w/6, y);
    //Head
    ellipse(x+w/2, y-h/4, w, h/2);
    //Eyes
    fill(0, 0, 0);
    ellipse(x+w/3, y-h/3.5, w/10, h/10);
    ellipse(x+w*2/3, y-h/3.5, w/10, h/10);
    //Smile
    noFill();
    arc(x+w/2, y-h/4, w/2, h/4, radians(60), radians(120));
    //Top Hat
    fill(64, 54, 52);
    rect(x, y-h/2, w, h/16);
    quad(x+w*1/8, y-h, x+w*7/8, y-h, x+w*7/8, y-h/2, x+w*1/8, y-h/2);
    fill(150, 82, 78);
    quad(x+w*1/8, y-h*10/16, x+w*7/8, y-h*10/16, x+w*7/8, y-h/2, x+w*1/8, y-h/2);
  }
  void adjust() {
    background(204);
    x = mouseX;
    y = mouseY;
  }
}
