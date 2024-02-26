PImage sans;

void setup() {
  size(238, 212);
  sans = loadImage("sans.png");
}

void draw() {
  loadPixels();
  sans.loadPixels();
  
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int loc = x + y * width;
      float r = red(sans.pixels[loc]);
      float g = green(sans.pixels[loc]);
      float b = blue(sans.pixels[loc]);
      
      // grayscale: average the rgb content and set all three to that average
      float colorAvg = (r + g + b) / 3;
      float depth = 20;
      float intensity = 30;
      r = constrain(colorAvg * 2, 0, 255);
      g = constrain(colorAvg + depth, 0, 255);
      b = constrain(colorAvg - intensity, 0, 255);
      
      pixels[loc] = color(r, g, b);
    }
  }
  updatePixels();
}
