//declares array
Bubble[] bubbles;

void setup() {
  size(640, 360);
  bubbles = new Bubble[10000];
  for (int i = 0; i < bubbles.length; i++) {
    bubbles[i] = new Bubble(random(width));
  }
}

void draw() {
  background(65, 135, 245);
  for (int i = 0; i < bubbles.length; i++) {
    bubbles[i].ascend();
    bubbles[i].top();
    bubbles[i].display();
  }
}

void mousePressed() {
  bubbles = (Bubble []) append(bubbles, new Bubble(mouseX, mouseY));
}
