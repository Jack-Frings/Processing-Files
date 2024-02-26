int cols, rows;
int scl = 10;
int w = 4000;
int h = 6000;

float[][] terrain;

float flying = 0;
void setup() {
  fullScreen(P3D);

  cols = w / scl;
  rows = h / scl;
  terrain = new float[cols][rows];
}

void draw() {
  flying -= map(mouseX, 0, width, 0.05, 0.5);
  float yoff = flying;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);
      xoff += 0.1;
    }
    yoff += 0.1;
  }
  background(0);
  //stroke(255);
  //noFill();
  
  noStroke();
  
  translate(width / 2, height / 2);
  rotateX(PI / 3);
  translate(-w / 2, -h / 2);
  
  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      fill(map(terrain[x][y], -100, 100, 255, 0), 50, map(terrain[x][y], -100, 100, 0, 255));
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
    }
    endShape(TRIANGLE_STRIP);
  }
}
