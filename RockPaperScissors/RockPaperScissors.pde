final int ROCK = 1;
final int PAPER = 2;
final int SCISSORS = 3;
final int LIZARD = 4;
final int SPOCK = 5;

int userChoice;
int cpuChoice;


int userScore = 0;
int cpuScore = 0;


boolean gameOver = false;


boolean scoreCounted = false;


boolean userSelected = false;

void setup() {
  size(720, 460);
  cpuChoice = int(random(ROCK, SCISSORS + 1));
}

void draw() {
  background(200);
  textSize(40);
  textAlign(CENTER);
  if (!gameOver) {
    if (!userSelected) {
      text("Welcome to RPSLS!", width / 2, 50);
      text("Press 1 to choose Rock", width / 2, 100);
      text("Press 2 to choose Paper", width / 2, 150);
      text("Press 3 to choose Scissors", width / 2, 200);
      text("Press 4 to choose Lizard", width / 2, 250);
      text("Press 5 to choose Spock", width / 2, 300);
      text("USER", width / 3, 350);
      text("CPU", width * 2 / 3, 350);
      text(userScore, width / 3, 400);
      text(cpuScore, width * 2 / 3, 400);
    } else {
      if (userChoice == ROCK) {
        text("USER: ROCK", width / 2, height / 2);
        if (cpuChoice == ROCK) {
          text("CPU: ROCK", width / 2, height / 2 + 50);
          text("DRAW", width / 2, height / 2 + 100);
        } else if (cpuChoice == PAPER || cpuChoice == SPOCK) {
          if (cpuChoice == PAPER) {
            text("CPU: PAPER", width / 2, height / 2 + 50);
          } else {
            text("CPU: PAPER", width / 2, height / 2 + 50);
          }
          text("CPU WINS!", width / 2, height /2 + 100);
          if (!scoreCounted) {
            cpuScore ++;
            scoreCounted = true;
          }
        } else if (cpuChoice == SCISSORS || cpuChoice == LIZARD) {
          if (cpuChoice == SCISSORS) {
            text("CPU: SCISSORS", width /2, height / 2 + 50);
          } else {
            text("CPU: LIZARD", width /2, height / 2 + 50);
          }
          text("USER WINS!", width / 2, height / 2 + 100);
          if (!scoreCounted) {
            userScore ++;
            scoreCounted = true;
          }
        }
      } else if (userChoice == PAPER) {
        text("USER: PAPER", width / 2, height / 2);
        if (cpuChoice == ROCK || cpuChoice == SPOCK) {
          if (cpuChoice == ROCK) {
            text("CPU: ROCK", width / 2, height / 2 + 50);
          } else {
            text("CPU: SPOCK", width / 2, height / 2 + 50);
          }
          text("USER WINS!", width / 2, height / 2 + 100);
          if (!scoreCounted) {
            userScore ++;
            scoreCounted = true;
          }
        } else if (cpuChoice == PAPER) {
          text("CPU: PAPER", width / 2, height / 2 + 50);
          text("DRAW", width / 2, height /2 + 100);
        } else if (cpuChoice == SCISSORS || cpuChoice == LIZARD) {
          if (cpuChoice == SCISSORS) {
            text("CPU: SCISSORS", width /2, height / 2 + 50);
          } else {
            text("CPU: LIZARD", width /2, height / 2 + 50);
          }
          text("CPU WINS!", width / 2, height / 2 + 100);
          if (!scoreCounted) {
            cpuScore ++;
            scoreCounted = true;
          }
        }
      } else if (userChoice == SCISSORS) {
        text("USER: SCISSORS", width / 2, height / 2);
        if (cpuChoice == ROCK || cpuChoice == SPOCK) {
          if (cpuChoice == ROCK) {
            text("CPU: ROCK", width / 2, height / 2 + 50);
          } else {
            text("CPU: SPOCK", width / 2, height / 2 + 50);
          }
          text("CPU WINS!", width / 2, height / 2 + 100);
          if (!scoreCounted) {
            cpuScore ++;
            scoreCounted = true;
          }
        } else if (cpuChoice == PAPER || cpuChoice == LIZARD) {
          if (cpuChoice == PAPER) {
            text("CPU: PAPER", width / 2, height / 2 + 50);
          } else {
            text("CPU: LIZARD", width / 2, height / 2 + 50);
          }
          text("USER WINS!", width / 2, height /2 + 100);
          if (!scoreCounted) {
            userScore ++;
            scoreCounted = true;
          }
        } else if (cpuChoice == SCISSORS) {
          text("CPU: SCISSORS", width /2, height / 2 + 50);
          text("DRAW", width / 2, height / 2 + 100);
        }
      }
    }
  }
  if (userScore == 4) {
    gameOver = true;
    text("USER WINS!", width /2, height / 2);
    text("USER", width / 3, 350);
    text("CPU", width * 2 / 3, 350);
    text(userScore, width / 3, 400);
    text(cpuScore, width * 2 / 3, 400);
  } else if (cpuScore == 4) {
    gameOver = true;
    text("CPU WINS!", width /2, height / 2);
    text("USER", width / 3, 350);
    text("CPU", width * 2 / 3, 350);
    text(userScore, width / 3, 400);
    text(cpuScore, width * 2 / 3, 400);
  }
}

void keyPressed() {
  if (!userSelected) {
    if (key == '1') {
      userChoice = ROCK;
      userSelected = true;
    } else if (key == '2') {
      userChoice = PAPER;
      userSelected = true;
    } else if (key == '3') {
      userChoice = SCISSORS;
      userSelected = true;
    } else if (key == '4') {
      userChoice = LIZARD;
      userSelected = true;
    } else if (key == '5') {
      userChoice = SPOCK;
      userSelected = true;
    }
  } else if (key == 'r') {
      userSelected = false;
      cpuChoice = int(random(ROCK, SPOCK + 1));
      scoreCounted = false;
  }
}
