void setup() {
  size(1000,590);
}
boolean uk_start = true;
boolean france_start = true;
boolean south_africa_start = true;
boolean seychelles_start = true;
void draw(){
  fill(255);
  rectMode(CORNER);
  stroke(1);
  if (uk_start == true) {
    rect(50,50,400,200);
  }
  if (south_africa_start == true) {
    rect(50,300,400,240);
  }
  if (seychelles_start == true) {
    rect(550,50,400,240);
  }
  if (france_start == true) {
    rect(550,300,400,240);
  }
}
void keyPressed() {
  //United Kingdom Flag
  if (key == 'u') {
    uk_start = false;
    noStroke();
    rectMode(CENTER);
    //Blue Background
    fill(0,0,102);
    rect(250,150,400,200);
    //White Diagonols
    fill(255,255,255);
    quad(70,30,30,70,430,270,470,230);
    quad(30,230,70,270,470,70,430,30);
    //Red Diagonols
    fill(204,0,0);
    quad(463+1/3,236+2/3,450,250,250,150,263+1/3,136+2/3);
    quad(36+2/3,63+1/3,50,50,250,150,236+2/3,163+1/3);
    quad(63+1/3,263+1/3,50,250,250,150,263+1/3,163+1/3);
    quad(438+2/3,36+2/3,450,50,250,150,236+2/3,136+2/3);
    //White Cross
    fill(255,255,255);
    rect(250,150,66+2/3,200);
    rect(250,150,400,66+2/3);
    //Red Cross
    fill(204,0,0);
    rect(250,150,40,200);
    rect(250,150,400,40);
    //Removing Excess
    fill(204);
    rectMode(CORNER);
    rect(0,0,800,50);
    rect(450,0,50,400);
    rect(0,0,50,800);
    rect(50,240,400,50);
  }
  if (key == 's') {
    south_africa_start = false;
    //rect(50,300,400,240);
    noStroke();
    //Green Background
    fill(48,110,78);
    rect(50,300,400,240);
    //Yellow Triangle
    fill(244,188,80);
    triangle(210,420,50,319.2,50,520.8);
    //Black Triangle
    fill(0);
    triangle(50,333.6,50,506.4,186,420);
    //Blue Trapezoid Outline
    fill(255);
    beginShape();
    vertex(450,540);
    vertex(450,444);
    vertex(250,444);
    vertex(125,540);
    endShape();
    //Blue Trapezoid
    fill(2,12,132);
    beginShape();
    vertex(450,540);
    vertex(450,458.4);
    vertex(250,458.4);
    vertex(145,540);
    endShape();
    //Red Trapezoid Outline
    fill(255);
    beginShape();
    vertex(450,300);
    vertex(450,396);
    vertex(250,396);
    vertex(125,300);
    endShape();
    //Red Trapezoid
    fill(207,72,56);
    beginShape();
    vertex(450,300);
    vertex(450,380);
    vertex(250,380);
    vertex(145,300);
    endShape();
  }
  if (key == 'f') {
    france_start = false;
    noStroke();
    //Red
    fill(191,52,54);
    rect(550,300,400,240);
    //Blue
    fill(19,44,86);
    rect(550,300,133+1/3,240);
    fill(255);
    //White
    rect(683+1/3,300,133+1/3,240);
  }
}
void mousePressed() {
  seychelles_start = false;
  noStroke();
  //Seychelles Flag
  fill(197,58,50);
  rect(550,50,400,240);
  fill(25,61,130);
  triangle(550,50,550,290,683+1/3,50);
  fill(247,219,109);
  triangle(550,290,683+1/3,50,866+2/3,50);
  fill(255);
  triangle(550,290,950,130,950,210);
  fill(53,121,68);
  triangle(550,290,950,210,950,290);
}
