import processing.sound.*;

SoundFile click;
SoundFile background_track;
SoundFile screen_switch;

int x;
int y;
int d;

int clicks = 0;
float distance;

float cash;
float cash_per_click = 1;
float upgrade_cost = 32;
float cash_increase = 0.2;
int upgrades = 0;

PImage photo;
PImage bg;
PImage barracks;
PImage swords_menu;
PImage castle;
PImage arrow;

PFont title;

String state = "clicker";

PImage farmer;
PImage trader;
PImage warrior;
PImage wizard;
PImage hero;

int farmer_count = 0;
int trader_count = 0;
int warrior_count = 0;
int wizard_count = 0;
int hero_count = 0;

float farmer_cost = 15;
float trader_cost = 125;
float warrior_cost = 2400;
float wizard_cost = 15000;
float hero_cost = 50000;

float addend;

// Achievment Checks
int clicked = 0;
boolean bought = false;
boolean bought_hero = false;
boolean hundred_thousand = false;
int frames = 0;

// War
int[] war_count;
int  win_chances = 50;
float winnings = 0;
int odds;

void setup() {
  size(640, 640);
  x = width / 2;
  y = height * 7 / 16;
  d = 250;
  photo = loadImage("Orange_Sword.png");
  photo.resize(180,180);
  bg = loadImage("background.png");
  title = createFont("Civilization.otf", 1);
  barracks = loadImage("Barracks.jpeg");
  barracks.resize(100, 100);
  swords_menu = loadImage("Crossed_Swords.png");
  swords_menu.resize(100,100);
  //Character Portraits
  farmer = loadImage("Farmer.jpeg");
  farmer.resize(60,60);
  trader = loadImage("Trader.jpg");
  trader.resize(60, 60);
  warrior = loadImage("Warrior.jpeg");
  warrior.resize(60,60);
  wizard = loadImage("Wizard.png");
  wizard.resize(60,60);
  hero = loadImage("Hero.jpeg");
  hero.resize(60,60);
  frameRate(32);
  //Background Track
  background_track = new SoundFile(this, "Main_Track.mp3");
  background_track.loop();
  //Click Sound
  click = new SoundFile(this, "click.wav");
  //Screen Switch Sound
  screen_switch = new SoundFile(this, "Switch.mp3");
  // War
  castle = loadImage("castle.jpg");
  castle.resize(100, 100);
  arrow = loadImage("Arrow.png");
  arrow.resize(40,40);
  // War Count
  war_count = new int[5];
  war_count[0] = 0;
  war_count[1] = 0;
  war_count[2] = 0;
  war_count[3] = 0;
  war_count[4] = 0;
}

void draw() {
  background(bg);
  // Clicked Achievment Check
  if (clicked == 1) {
    rectMode(CENTER);
    fill(20, 30, 190, 200);
    rect(width /2, height * 5 / 32, width / 2, height / 16);
    textAlign(CENTER);
    textSize(32);
    fill(255);
    text("First Click!", width /2, height * 11 / 64);
    frames ++;
    if (frames == 96) {
      clicked = 2;
      frames = 0;
    }
  }
  // Bought Achievment
  if (farmer_count > 0 || trader_count > 0 || warrior_count > 0 || wizard_count > 0) {
    if (!bought) {
      clicked = 2;
      rectMode(CENTER);
      fill(20, 30, 190, 200);
      rect(width /2, height * 5 / 32, width * 9 / 16, height / 16);
      textAlign(CENTER);
      textSize(32);
      fill(255);
      text("Town Beginnings", width /2, height * 11 / 64);
      frames ++;
      if (frames == 96) {
        bought = true;
        frames = 0;
      }
    }
  }
  // Hero Achievment
  if (hero_count > 0) {
    if (!bought_hero) {
      rectMode(CENTER);
      fill(20, 30, 190, 200);
      rect(width /2, height * 5 / 32, width / 2, height / 16);
      textAlign(CENTER);
      textSize(32);
      fill(255);
      text("True Hero", width /2, height * 11 / 64);
      frames++;
      if (frames == 96) {
        bought_hero = true;
        frames = 0;
      }
    }
  }
  // 100K Achievment
  if (cash >= 100000 && !hundred_thousand) {
      rectMode(CENTER);
      fill(20, 30, 190, 200);
      rect(width /2, height * 5 / 32, width * 11 / 18, height / 16);
      textAlign(CENTER);
      textSize(32);
      fill(255);
      text("World Domination", width /2, height * 11 / 64);
      frames ++;
      if (frames == 96) {
        frames = 0;
        hundred_thousand = true;
      }
  }    
  //Adding Money
  if (frameCount % 32 == 0) {
    addend = (0.1 * float(farmer_count)) + (5 * trader_count) + (30 * warrior_count) + (200 * wizard_count) + (1000 * hero_count);
    cash += addend;
  }
  //Clicker
  if (state == "clicker") {
    fill(215,192,147);
    circle(x, y, d);
    fill(88,154,68);
    ///Swords
    imageMode(CENTER);
    image(photo,width/2,height/2-45);
    pushMatrix();
    scale(-1,1);
    image(photo,-width/2,height/2-45);
    popMatrix();
    // Text and Upgrades
    textFont(title);
    textSize(200);
    textAlign(CENTER);
    textSize(38);
    fill(0);
    rectMode(CORNER);
    rect(0, 480, width, width);
    rect(0, 0, width * 4 / 5, 60);
    fill(220,200,80);
    text("Ultimate Civilization", width * 19 / 48, 45);
    textSize(24);
    if (cash >= upgrade_cost) {
      fill(97, 197, 84);
    } else {
      fill(255);
    }
    text("Power: " + nf(cash,0,2), width / 2, 520);
    text("Power Per Click (PPC): " + nf(cash_per_click,0,2), width / 2, 550);
    text("Power Per Click After Upgrade: " + nf(cash_increase + cash_per_click,0,2), width / 2, 580);
    text("Upgrade Cost: " + nf(upgrade_cost,0,2), width / 2, 610);
    //Transition To Shop Symbol
    fill(253,253,163);
    rect(width * 5 / 6,0, width / 6, height / 6);
    image(barracks,width * 5 / 6 + width / 12, height / 12);
    stroke(0);
    //Shop
  } else if (state == "shop") {
    // Transition  To Home
    rectMode(CORNER);
    fill(253, 253, 163);
    rect(0, 0, width / 6, height / 6);
    imageMode(CENTER);
    image(swords_menu, width / 12, height / 12);
    fill(0);
    rectMode(CENTER);
    rect(width / 2, 30, width / 2, 45);
    textFont(title);
    textSize(38);
    textAlign(CENTER);
    fill(220, 200, 80);
    text("The Barracks", width / 2, 45);
    // Transition To War
    rectMode(CORNER);
    fill(253,253,163);
    rect(width * 5 / 6,0, width / 6, height / 6);
    image(castle,width * 5 / 6 + width / 12, height / 12);
    stroke(0);
    //Power Display
    rectMode(CORNER);
    fill(0);
    rect(0, height * 2 / 9 + 430, width, height / 9);
    textAlign(CENTER);
    textSize(20);
    fill(255);
    text("Power: " + nf(cash, 0, 2), width / 2, height / 3 + 380);
    text("Power Per Second (PPS): " + nf(addend, 0, 2), width / 2, height / 3 + 410);
    // Automatics
    rectMode(CORNER);
    imageMode(CORNER);
    fill(255, 255, 255, 200);
    //Automatic Layouts
    rect(0, height * 2/ 9, width, 60);
    image(farmer, 0, height * 2/ 9);
    rect(0, height * 2 / 9 + 80, width, 60);
    image(trader, 0, height * 2 / 9 + 80);
    rect(0, height * 2 / 9 + 160, width, 60);
    image(warrior, 0, height * 2 / 9 + 160);
    rect(0, height * 2 / 9 + 240, width, 60);
    image(wizard, 0, width * 2 / 9 + 240);
    rect(0, height * 2 / 9 + 320, width, 60);
    image(hero, 0, height * 2 / 9 + 320);
    //Automatics Text
    fill(0);
    textSize(20);
    textAlign(LEFT);
    text("Farmers: " + farmer_count + "    Cost: " + nf(farmer_cost, 0, 2) + " power" + "    PPS: 0.1", 70, height * 2 / 9 + 40);
    text("Traders: " + trader_count + "    Cost: " + nf(trader_cost, 0, 2) + " power" + "    PPS: 5", 70, height * 2 / 9 + 120);
    text("Warriors: " + warrior_count + "    Cost: " + nf(warrior_cost, 0, 2) + " power" + "    PPS: 30", 70, height * 2 / 9 + 200);
    text("Wizards: " + wizard_count + "    Cost: " + nf(wizard_cost, 0, 2) + " power" + "    PPS: 200", 70, height * 2 / 9 + 280);
    text("Heroes: " + hero_count + "    Cost: " + nf(hero_cost, 0, 2) + " power" + "    PPS: 1000", 70, height * 2 / 9 + 360);
  } else if (state == "war") {
    //Title
    fill(0);
    rectMode(CENTER);
    rect(width / 2, 30, width * 11 / 18,45);
    textSize(38);
    textAlign(CENTER);
    fill(220, 200, 80);
    text("Prepare For War", width / 2, 45);
    // Transition to Shop
    rectMode(CORNER);
    imageMode(CENTER);
    fill(253,253,163);
    rect(0, 0, width / 6, height / 6);
    image(barracks, width / 12, height / 12);
    //War Troops
    fill(107, 107, 107, 200);
    rectMode(CENTER);
    imageMode(CENTER);
    rect(width / 6, height / 2, 80, 400);
    rect(width / 3, height / 2, 80, 400);
    rect(width / 2, height / 2, 80, 400);
    rect(width * 2 / 3, height / 2, 80, 400);
    rect(width * 5 / 6, height / 2, 80, 400);
    stroke(250, 210, 20);
    noFill();
    strokeWeight(2);
    square(width / 6, height * 3 / 8, 40);
    square(width / 3, height * 3 / 8, 40);
    square(width / 2, height * 3 / 8, 40);
    square(width * 2 / 3, height * 3 / 8, 40);
    square(width * 5 / 6, height * 3 / 8, 40);
    image(arrow, width / 6, height * 3 / 8);
    image(arrow, width / 3, height * 3 / 8);
    image(arrow, width / 2, height * 3 / 8);
    image(arrow, width * 2 / 3, height * 3 / 8);
    image(arrow, width * 5 / 6, height * 3 / 8);
    square(width / 6, height / 2, 40);
    square(width / 3, height / 2, 40);
    square(width / 2, height / 2, 40);
    square(width * 2 / 3, height / 2, 40);
    square(width * 5 / 6, height / 2, 40);
    pushMatrix();
    scale(1, -1);
    image(arrow, width / 6, -height / 2); 
    image(arrow, width / 3, -height / 2);
    image(arrow, width / 2, -height / 2);
    image(arrow, width * 2 / 3, -height / 2);
    image(arrow, width * 5 / 6, -height / 2);
    popMatrix();
    strokeWeight(1);
    stroke(0);
    image(farmer, width / 6, height / 4);
    image(trader, width / 3, height / 4);
    image(warrior, width / 2, height / 4);
    image(wizard, width * 2 / 3, height / 4);
    image(hero, width * 5 / 6, height / 4);
    // War Troops Text
    textAlign(CENTER);
    textSize(32);
    fill(255);
    stroke(255);
    strokeWeight(5);
    text(war_count[0], width / 6, height * 2 / 3 + 10);
    text(war_count[1], width / 3, height * 2 / 3 + 10);
    text(war_count[2], width / 2, height * 2 / 3 + 10);
    text(war_count[3], width * 2 / 3, height * 2 / 3 + 10);
    text(war_count[4], width * 5 / 6, height * 2 / 3 + 10);
    line(width / 6 - 30, height * 2 / 3 + 20, width / 6 + 30, height * 2 / 3 + 20);
    line(width / 3 - 30, height * 2 / 3 + 20, width / 3 + 30, height * 2 / 3 + 20);'
    line(width / 2 - 30, height * 2 / 3 + 20, width / 2 + 30, height * 2 / 3 + 20);
    line(width * 2 / 3 - 30, height * 2 / 3 + 20, width * 2 / 3 + 30, height * 2 / 3 + 20);
    line(width * 5 / 6 - 30, height * 2 / 3 + 20, width * 5 / 6 + 30, height * 2 / 3 + 20);
    text(farmer_count, width / 6, height * 2 / 3 + 60);
    text(trader_count, width / 3, height * 2 / 3 + 60);
    text(warrior_count, width / 2, height * 2 / 3 + 60);
    text(wizard_count, width * 2 / 3, height * 2 / 3 + 60);
    text(hero_count, width * 5 / 6, height * 2 / 3 + 60);
    stroke(0);
    strokeWeight(1);
    //Battle Start
    fill(0);
    rectMode(CORNER);
    rect(0, height * 9 / 10, width, height / 10);
    fill(255);
    textSize(16);
    win_chances = 50 + int(war_count[0] / 2);
    if (win_chances > 90) {
      win_chances = 90;
    }
    winnings = (20.0 * float(war_count[0])) + (float(war_count[1])) + (2000.0 * float(war_count[2])) + (float(war_count[3]) * 7500.0) + (float(war_count[4]) * 50000.0);
    text("Winning Chances: " + win_chances + "%    " + "Possible Winnings: " + nf(winnings, 0, 2), width / 2, height * 19 / 20);
    stroke(0);
    strokeWeight(2);
    fill(255, 0, 0);
    rectMode(CENTER);
    rect(width / 2, height * 4 / 5 + 36, 200, 50);
    fill(0);
    textSize(30);
    text("Risk War!", width / 2, height * 4 / 5 + 50);
  }
}

void mousePressed() {
  if (state == "clicker") {
    distance = dist(mouseX,mouseY,x,y);
    if (distance < d / 2) {
      clicks ++;
      cash += cash_per_click;
      click.play();
      // Clicked Achievment
      if (clicked == 0) {
        clicked = 1;
      }
    } else if (mouseY > 480 && cash >= upgrade_cost) {
      cash -= upgrade_cost;
      cash_per_click += cash_increase;
      upgrades ++;
      upgrade_cost = 32 * pow(1.05, upgrades);
      click.play();
    } else if (mouseX > width * 5 / 6 && mouseY < height / 6) {
      state = "shop";
      screen_switch.play();
    }
  } else if (state == "shop") {
      if (mouseX < width / 6 && mouseY < height / 6) {
        state = "clicker";
        screen_switch.play();
      } else if (mouseY > width * 2 / 9 && mouseY < width * 2 / 9 + 60) {
        if (cash >= farmer_cost) {
          cash -= farmer_cost;
          farmer_count += 1;
          farmer_cost = 15 * pow(1.15, farmer_count + 1);
          click.play();
        }
      } else if (mouseY > height * 2 / 9 + 80 && mouseY < height * 2 / 9 + 140) {
        if (cash >= trader_cost) {
          cash -= trader_cost;
          trader_count += 1;
          trader_cost = 125 * pow(1.15, trader_count + 1);
          click.play();
        }
      } else if (mouseY > height * 2 / 9 + 160 && mouseY < height * 2 / 9 + 200) {
        if (cash >= warrior_cost) {
          cash -= warrior_cost;
          warrior_count += 1;
          warrior_cost = 1200 * pow(1.15, warrior_count + 1);
          click.play();
        }
      } else if (mouseY > height * 2 / 9 + 240 && mouseY < height * 2 / 9 + 300) {
        if (cash >= wizard_cost) {
          cash -= wizard_cost;
          wizard_count += 1;
          wizard_cost = 15000 * pow(1.15, wizard_count + 1);
          click.play();
        }
      } else if (mouseY > height * 2 / 9 + 320 && mouseY < height * 2 / 9 + 380) {
        if (cash >= hero_cost) {
          cash -= hero_cost;
          hero_count += 1;
          hero_cost = 50000 * pow(1.15, hero_count + 1);
          click.play();
        }
      } else if (mouseX > width * 5 / 6 && mouseY < height / 6) {
        state = "war";
        screen_switch.play();
      }
  } else if (state == "war") {
    if (mouseX < width / 6 && mouseY < height / 6) {
      state = "shop";
      screen_switch.play();
      // Up Arrows
    } else if (mouseY > height * 3 / 8 - 20 && mouseY < height * 3 / 8 + 20) {
      if (mouseX > width / 6 - 20 && mouseX < width / 6 + 20 && war_count[0] != farmer_count) {
        war_count[0] ++;
        click.play();
      } else if (mouseX > width / 3 - 20 && mouseX < width / 3 + 20 && war_count[1] != trader_count) {
        war_count[1] ++;
        click.play();
      } else if (mouseX > width / 2 - 20 && mouseX < width / 2 + 20 && war_count[2] != warrior_count) {
        war_count[2] ++;
        click.play();
      } else if (mouseX > width * 2 / 3 - 20 && mouseX < width * 2 / 3 + 20 && war_count[3] != wizard_count) {
        war_count[3]++;
        click.play();
      } else if (mouseX > width * 5 / 6 - 20 && mouseX < width * 5 / 6 + 20 && war_count[4] != hero_count) {
        war_count[4] ++;
        click.play();
      }
    //Down Arrows
    } else if (mouseY < height / 2 + 20 && mouseY > height / 2 - 20) {
      if (mouseX > width / 6 - 20 && mouseX < width / 6 + 20 && war_count[0] != 0) {
        war_count[0] --;
        click.play();
      } else if (mouseX > width / 3 - 20 && mouseX < width / 3 + 20 && war_count[1] != 0) {
        war_count[1] --;
        click.play();
      } else if (mouseX > width / 2 - 20 && mouseX < width / 2 + 20 && war_count[2] != 0) {
        war_count[2] --;
        click.play();
      } else if (mouseX > width * 2 / 3 - 20 && mouseX < width * 2 / 3 + 20 && war_count[3] != 0) {
        war_count[3] --;
        click.play();
      } else if (mouseX > width * 5 / 6 - 20 && mouseX < width * 5 / 6 + 20 && war_count[4] != 0) {
        war_count[4] --;
        click.play();
      }
    } else if (mouseX < width / 2 + 100 && mouseX > width / 2 - 100 && mouseY > height * 4 / 5 + 11 && mouseY < height * 4 / 5 + 61) {
      odds = int(random(0, 101));
      if (win_chances >= odds) {
        cash += winnings;
          
      } else {
        farmer_count -= war_count[0];
        trader_count -= war_count[1];
        warrior_count -= war_count[2];
        wizard_count -= war_count[3];
        hero_count -= war_count[4];
      }
      war_count[0] = 0;
      war_count[1] = 0;
      war_count[2] = 0;
      war_count[3] = 0;
      war_count[4] = 0;
      farmer_cost = 15 * pow(1.15, farmer_count + 1);
      trader_cost = 125 * pow(1.15, trader_count + 1);
      warrior_cost = 1200 * pow(1.15, warrior_count + 1);
      wizard_cost = 15000 * pow(1.15, wizard_count + 1);
      hero_cost = 50000 * pow(1.15, hero_count + 1);
    }
  }
}
void keyPressed() {
  if (state == "war" && key == 'a' && mouseY > height / 2 - 200 && mouseY < height / 2 + 200) {
    if (mouseX > width / 6 - 40 && mouseX < width / 6 + 40) {
      war_count[0] = farmer_count;
    } else if (mouseX > width / 6 - 40 && mouseX < width / 6 + 40) {
      war_count[1] = trader_count;
    } else if (mouseX > width / 2 - 40 && mouseX < width / 2 + 40) {
      war_count[2] = warrior_count;
    } else if (mouseX > width * 2 / 3 - 40 && mouseX < width * 2 / 3 + 40) {
      war_count[3] = wizard_count;
    } else if (mouseX > width * 5 / 6 - 40 && mouseX < width * 5 / 6 + 40) {
      war_count[4] = hero_count;
    }
  }
}
