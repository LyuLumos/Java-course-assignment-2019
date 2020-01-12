import java.util.*;
import java.lang.*;
import java.io.*;
/********* VARIABLES *********/

float gravity = 0.3;
float airfriction = 0.00001;
float friction = 0.1;

/********** OBJECTS ***********/

Game g = new Game();
Screen s = new Screen();
Ball b = new Ball();
Racket r = new Racket();
Wall w = new Wall();
Node n = new Node(0);
TextBox t = new TextBox();
Out o = new Out();
In i = new In();
Save sa = new Save();

/********* SETUP BLOCK *********/

void setup() {
  size(500, 500);
  // set the initial coordinates of the ball
  b.ballX = width / 4;
  b.ballY = height / 5;
  smooth();
  i.read();
}

/********* DRAW BLOCK *********/
public void keyPressed() {
  t.commandParse();
}

void draw() {
  // Display the contents of the current screen
  if (s.gameScreen == 0) { 
    s.initScreen();
  } else if (s.gameScreen == 1) { 
    s.gameScreen();
  } else if (s.gameScreen == 2) {
    s.gameOverScreen();
  }
  t.draw();
}

/********* INPUTS *********/

public void mousePressed() {
  // if we are on the initial screen when clicked, start the game 
  n.k++;
  s.flag = 1;
  if (s.gameScreen==0 ) { 
    g.startGame();
  }
  if(sa.startFromSave() == 1) { 
    g.restart(sa.grade[Integer.valueOf(playername)]);
  }
  else if (s.gameScreen==2) {
    g.restart(0);
  }
  
}
