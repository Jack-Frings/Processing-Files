class Snake {
  // declare array of Point objects
  Point[] points;
  color c;

  Snake(int s) {
    // create array of Point objects
    points = new Point[s];
    // initialize data in each array
    for (int i = 0; i < points.length; i++) {
      points[i] = new Point(0, 0);
    }
    c = color(0);
  }
  void display() {
    //shift array values by one location
    for (int i = 0; i < points.length - 1; i++) {
      points[i] = points[i+1];
    }

    // add current mouse location to the end of the array
    points[points.length - 1] = new Point(mouseX, mouseY);
    // draw the array
    for (int i = 0; i < points.length - 1; i++) {
      noStroke();
      fill(c, i*3);
      ellipse(points[i].x, points[i].y, i, i);
    }

    ellipse(mouseX, mouseY, 20, 20);
  }
  void changeColor() {
    c = color(random(0, 256), random(0, 256), random(0, 256));
  }
}
