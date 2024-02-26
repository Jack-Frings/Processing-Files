void setup() {
  size(600,800);
}
void draw() {
  line(0,0,width,height);
  line(0,height,width,0);
  ellipse(width/2,height/2,width/2,height/2);
  rectMode(CENTER);
  rect(width/8,height/2,width/8,height/4);
  rect(width*7/8,height/2,width/8,height/4);
  rect(width/2,height/8,width/4,height/8);
  rect(width/2,height*7/8,width/4,height/8);
}
