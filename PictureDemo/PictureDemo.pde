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
      float r = convert_color(red(sans.pixels[loc]));
      float g = convert_color(green(sans.pixels[loc]));
      float b = convert_color(blue(sans.pixels[loc]));
      pixels[loc] = color(r, g, b);
    }
  }
  updatePixels();
}

float convert_color(float c) {
  if (c < 64) {
    return 0.0;
  } else if (c >= 192) {
    return 255.0;
  } else {
    return 128.0;
  }
}
  
