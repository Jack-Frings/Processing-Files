void setup() {
  size(600, 400);
}

void draw() {
  // Tell Processing you are going to begin working with the pixels of the window
  loadPixels();
  
  // Loop width number of times
  for (int x = 0; x < width; x++) {  
    // Loop height number of times
    // for a total of width * height iterations
    for (int y = 0; y < height; y++) {
      // getting a "2D" location from our 1D array of pixels
      int loc = x + y * width;
      // Makes where we are on the x-axis proportional to our amount of red
      float r = map(x, 0, width, 0, 255);
      // Makes where we are on the y-axis proportional to our amount of green
      float g = map(y, 0, height, 0, 255);
      // Makes where we are on the x-axis and y-axis proportional to our amount of blue
      float b = map(x + y, 0, width + height, 0, 255);
      // Update the color at the chosen location
      pixels[loc] = color(r, g, b);
    }
  }
  // Tell Processing you are done working with the pixels of the window
  updatePixels();
}
