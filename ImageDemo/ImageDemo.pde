PImage dan;  // variable for image object
float x, y;  // variables for image location
float rot;   // variable for image rotation
float xSpeed, rotSpeed;

void setup() {
  size(400, 400);
  dan = loadImage("face.jpg");
  x = 0;
  y = height / 2;
  rot = 0;
  xSpeed = 1;
  rotSpeed = 0.01;
}

void draw() {
  background(255);
  
  fill(0, 0, 255);
  stroke(0);
  rect(100, 50, 200, 50);
  
  fill(255, 0, 0);
  stroke(0);
  ellipse(100, 300, 100, 100);
  
  fill(0, 255, 0);
  stroke(0);
  ellipse(300, 300, 100, 100);
  
  translate(x, y);
  rotate(rot);
  imageMode(CENTER);
  image(dan, 0, 0);
  
  x += xSpeed;
  rot += rotSpeed;
  if (x > width) {
    x = 0;
  }
}

void mousePressed() {
  if (mouseX >= 100 && mouseX <= 300 && mouseY >= 50 && mouseY <= 100) {
    println("Spinning faster...");
    rotSpeed += 0.01;
  }
  
  if (dist(100, 300, mouseX, mouseY) <= 100) {
    println("Slowing down...");
    xSpeed -= 0.1;
  }
  if (dist(300, 300, mouseX, mouseY) <= 100) {
    println("Speeding up...");
    xSpeed += 0.1;
    
  }
}
