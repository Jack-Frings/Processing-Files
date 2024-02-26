//set the size of the window
size(360,640);
background(120);
strokeWeight(10);
stroke(255,0,0);
//draw the head
fill(0,255,255);
ellipse(width / 2, 100, 100, 100);

//draw the body
line(width / 2, 150, width / 2, 400);

//draw the arms
line(width / 2, 200, width / 4, 275);
line(width / 2, 200, width * 3/4, 275);

//draw the legs
line(width / 2, 400, width / 3, 600);
line(width / 2, 400, width *2/3, 600);
