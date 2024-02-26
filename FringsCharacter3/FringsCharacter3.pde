Suit suit;
Suit suit2;

void setup() {
  size(1400, 700);
  suit = new Suit(650, 340, 10, 20);
  suit2 = new Suit();
}

void draw() {
  suit.adjust();
  suit.display();
  suit2.name();
  suit2.display();
}
