import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class see_it extends PApplet {




String mainString = "see it, say it, sorted";
String option1 = "could you just";
String option2 = "please";
String option3 = "perhaps you could";
String option4 = "if you could just";
String option5 = "that would be great";

String option6 = "SEE IT \nSAY IT\nSORTED";

int randomize;

String s;

int counter = 0;
int posRand = 30;
float x;
float y;
float sx = random(width);
float sy = random(height);
float rx = random(width);
float ry = random(height);
float sx2 = random(width);
float sy2 = random(height);
float sx3 = random(width);
float sy3 = random(height);
float sx4 = -100;

public void setup() {
  background(255);
  
  //PFont comic;
  //comic = createFont("font.ttf", 32);
  //textFont(comic);
  

}

public void draw() {
  println(counter);
  text(mainString, sx, sy);
  sx = sx+1;
  
  if(counter > 1000) {
    text(mainString, sx2, sy2);
    sx2 += 1;
  }
    if(counter > 2000) {
    textSize(100);
    text(mainString, width/2, 600);
    sx2 += 1;
  }
      if(counter > 3000) {
    textSize(500);
    text(mainString, 800, 700);
    sx2 += 1;
  }
        if(counter > 4000) {
    textSize(700);
    text(mainString, 500, sx4);
    sx4 += 1;
  }
}


public void mouseMoved() {

  if (counter % 4 == 0) {

    s = mainString;
    
    x = mouseX + random(-posRand, posRand);
    y = mouseY + random(-posRand, posRand);

    randomize = (int) random(300);
    textSize(random(10, 30));
    fill(random(0, 255), random(0, 255), random(0, 255));

    if (randomize == 1) {
      s = option1;
      textSize(random(60, 100));
      fill(PApplet.parseInt(round(random(1)))*255); 
     
    }

    if (randomize == 2 || randomize == 20) {
      s = option2;
      textSize(random(60, 100));
      fill(PApplet.parseInt(round(random(1)))*255);
    }

    if (randomize == 3) {
      s = option3;
      textSize(random(60, 100));
      fill(PApplet.parseInt(round(random(1)))*255);
    }
    if (randomize == 4) {
      s = option4;
      textSize(random(60, 100));
      fill(PApplet.parseInt(round(random(1)))*255);
    }
    if (randomize == 5) {
      s = option5;
      textSize(random(60, 100));
      fill(PApplet.parseInt(round(random(1)))*255);
    }
    
    if (randomize >= 6 && randomize <10) {
      s = option6;
      textSize(160);
      x = 600;
      y = 180;
    }

    textAlign(CENTER);
    text(s, x, y);
  }

  counter = counter + 1;
}
  public void settings() {  size(1200, 800); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "see_it" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
