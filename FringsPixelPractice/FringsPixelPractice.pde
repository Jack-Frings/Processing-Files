void setup() {
  size(600, 400);
  background(0);
}

//for (int x = 0; x < width; x++) {
//  set(x, 200, color(255, 0, 0));
//}
void draw() {
  loadPixels();
  for (int i = 0; i < pixels.length; i++) {
    pixels[i] = color(random(255), 0, random(50, 200));
  }
  
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      float d = dist(x, y, mouseX, mouseY);
      int loc = x+y*width;
      pixels[loc] = color(d, d-255, 255-d/2);
    }
  }
  
  updatePixels();
}
