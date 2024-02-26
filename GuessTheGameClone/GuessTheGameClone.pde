PImage[] carousel = new PImage[6];
int currentImage = 0;

Button[] buttons = new Button[6];

void setup() {
  size(800, 600);
  
  for (int i = 0; i < carousel.length; i++) {
    String filename = "wipeout" + (i + 1) + ".png";
    carousel[i] = loadImage(filename);
  }
  for (int i = 0; i < buttons.length; i++) {
    buttons[i] = new Button(270 + i*50, 400, "" + (i+1));
  }
}

void draw() {
  background(0);
  
  imageMode(CENTER);
  image(carousel[currentImage], width / 2, height / 2-100, carousel[0].width * 0.5, carousel[0].height * 0.5);
  
  for (int i = 0; i < buttons.length; i++) {
    buttons[i].display();
  }
}

void mousePressed() {
  for (int i = 0; i < buttons.length; i++) {
    if (buttons[i].wasClicked(mouseX, mouseY)) {
      currentImage = Integer.valueOf(buttons[i].label) - 1;
    }
  }
}
