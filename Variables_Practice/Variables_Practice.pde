int current_display;
int quarter;
int half;
int three_quarters;
int fifteen_sixteenths;
int dice_size;
void setup() {
  size(800,800);
  current_display = 0;
  quarter = width / 4;
  half = width / 2;
  three_quarters = width * 3 / 4;
  fifteen_sixteenths = width * 15 / 16;
  dice_size = width / 4;
}
void draw() {
  if (current_display == 1) {
    background(255);
    fill(140);
    circle(quarter,quarter,dice_size);
    circle(three_quarters,quarter,dice_size);
    circle(quarter,three_quarters,dice_size);
    circle(three_quarters,three_quarters,dice_size);
  }
  if (current_display == 2) {
    background(255);
    line(0,width,half,half);
    line(half,0,half,half);
    line(width,width,half,half);
  }
  if (current_display == 3) {
    background(255);
    fill(140);
    rectMode(CENTER);
    rect(half,half,fifteen_sixteenths,fifteen_sixteenths);
    fill(255);
    circle(half,half,half);
  }
}
void keyPressed() {
  if (key == '1') {
    current_display = 1;
  }
  if (key == '2') {
    current_display = 2;
  }
  if (key == '3') {
    current_display = 3;
  }
}
