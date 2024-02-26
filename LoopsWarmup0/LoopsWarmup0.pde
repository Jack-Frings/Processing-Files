int while_coordinate;

void setup() {
  size(400, 400);
  while_coordinate = 20;
}

void draw() {
  // Function Calls 
  
  /* 
  circle(20, 20, 40);
  circle(60, 60, 40);
  circle(100, 100, 40);
  circle(140, 140, 40);
  circle(180, 180, 40);
  circle(220, 220, 40);
  circle(260, 260, 40);
  circle(300, 300, 40);
  circle(340, 340, 40);
  circle(380, 380, 40);
  */
  
  // While Loop
  
  /* while (while_coordinate < width) {
    circle(while_coordinate, while_coordinate, 40);
    while_coordinate += 40;
  }
  */
  
  // For Loop
  
  for (int coordinate = 20; coordinate < width; coordinate += 40) {
    circle(coordinate, coordinate, 40);
  }
}
  
