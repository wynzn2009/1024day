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

public class Numbers extends PApplet {

int total = 19;
public void setup() {
  
  background(204);
  textSize(32);
  fill(250);
  rect(300, 150, 100, 40);
  fill(50);
  text("1", 340, 180);
  fill(250);
  rect(450, 150, 100, 40);
  fill(50);
  text("2", 490, 180);
  fill(250);
  rect(600, 150, 100, 40);
  fill(50);
  text("4", 640, 180);
}

public void draw() {
  background(204);
  textSize(32);
  fill(250);
  rect(300, 150, 100, 40);
  fill(50);
  text("1", 340, 180);
  fill(250);
  rect(450, 150, 100, 40);
  fill(50);
  text("2", 490, 180);
  fill(250);
  rect(600, 150, 100, 40);
  fill(50);
  text("4", 640, 180);
  if (total>0) {
    fill(0xff2743F0);
    textSize(160);
    text(total, 400, 400);
  } else {
    fill(0xffFF316F);
    textSize(160);
    text("You lose!", 200, 400);
  }
}
public void mouseClicked() {
  total -= pick();
}
public int pick() {
  if (mouseX>300&&mouseX<400&&mouseY>150&&mouseY<190) {
    return 1;
  } else if (mouseX>450&&mouseX<550&&mouseY>150&&mouseY<190) {
    return 2;
  } else if (mouseX>600&&mouseX<700&&mouseY>150&&mouseY<190) {
    return 4;
  } else {
    return 0;
  }
}
  public void settings() {  size(1000, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "Numbers" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
