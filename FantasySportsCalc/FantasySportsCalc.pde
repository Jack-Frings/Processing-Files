void setup() {
  size(640, 360);
}

void draw() {
  println("Russel Wilson: "  + calcQB(186, 1, 44, 1, 3, 0));
  println("Kyler Murray: " + calcQB(145, 1, 20, 0, 0, 0));
  println("Deebo Samuel: " + calcWR(4, 116, 2, 22, 1, 0));
  println("Tyreek Hill: " + calcWR(5, 157, 2, -4, 0, 0));
  noLoop();
}

float calcWR(int catches, int recYDs, int recTDs, int rushYDs, int rushTDs, int fumbles) {
  float score = 0;
  score += catches;
  score += (recYDs + rushYDs)/ 10.0;
  score += (recTDs + rushTDs) * 6;
  score += fumbles * -2;
  return score;
}
float calcQB(int passYds, int passTds, int rushYds, int rushTds, int INTs, int fumbles) {
  float score = 0;
  score += passYds * 0.04;
  score += passTds * 4;
  score += rushYds / 10.0;
  score += rushTds * 6;
  score += (INTs + fumbles) * -2;
  return score;
}
