Ball b1;
Ball b2;
Ball b3;

void setup() {
  size(640, 360);
  b1 = new Ball();
  b2 = new Ball(100, 100);
  b3 = new Ball(300, 300, 7, 7);
}

void draw() {
  background(100);
  
  // methods --> abstractions for more complex functionality
  b1.update();
  b1.display();
  
  b2.update();
  b2.display();
  
  b3.update();
  b3.display();
}
