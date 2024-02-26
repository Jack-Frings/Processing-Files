Suit[] suits = new Suit[10];

void setup() {
  size(600, 600);
  for (int i = 0; i < suits.length; i++) {
    suits[i] = new Suit(random(10, width - 10), random(10, height - 10), 10.0, 20.0);
  }
}
void draw() {
  for (int i = 0; i < suits.length; i++) {
    suits[i].display();
  }
}
void mousePressed() {
  Suit suit = new Suit(mouseX, mouseY, 10.0, 20.0);
  suits = (Suit[]) append(suits, suit);
}
