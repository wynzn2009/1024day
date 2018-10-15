import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Go extends PApplet {


ArrayList<Pair> particles = new ArrayList<Pair>();
HashSet<Pair> set = new HashSet<Pair>();
int col = 200;
int bl = 0xffFFFFFF;//white
int c2 = 0xff63488B;
int c1 = 0xffD364AB;
boolean black = true;
boolean reset = false;
boolean back = false;
int baseD = 150;
public void setup() {
  
}

public void draw() {
  update();
  background(51);
  strokeWeight(1);
  fill(255);
  ellipse(500, 300, 500, 500);
  fill(0);
  point(500, 300);
  fill(51);
  rect(750, 400, 500, 500);
  textSize(32);
  int x = mouseX - 500;
  int y = 300-mouseY;
  fill(col);
  text("X="+x, 800, 500); 
  text("Y="+y, 800, 550); 
  noStroke();
  fill(0xff1c661e);
  rect(100, 500, 100, 40);
  fill(250);
  textSize(16);
  text("reset", 130, 525); 
  fill(0xff14397a);
  rect(100, 450, 100, 40);
  fill(250);
  text("withdraw", 115, 475);
  printCir();
  hint();
}
public void hint() {
  int a = available(mouseX, mouseY);
  int cc = 0;
  if (a==-1) {
    cc = 0xffffff00;
  } else if (a==1) {
    cc = 0xffde0000;
  } else if (a==0) {
    cc = 0xff00cc07;
  }
  stroke(cc);
  strokeWeight(3);
  fill(255, 0);
  ellipse(mouseX, mouseY, baseD, baseD);
}
public void mouseClicked() {
  printCir();
  stroke(0);
  boolean fl = true;
  int point = get(mouseX, mouseY);
  if (point!=bl&&!particles.isEmpty()) {
    fl = false;
  } else {
    fl = dist(mouseX, mouseY, 500, 300)<=250;
  }
  if (fl) {
    noStroke();
    col = 100;

    fill(200, 3);
    ellipse(mouseX, mouseY, 2*baseD, 2*baseD);
    if (black) {
      fill(c1);
      particles.add(new Pair(mouseX, mouseY, c1));
    } else {
      fill(c2);
      particles.add(new Pair(mouseX, mouseY, c2));
    }

    black = !black;
    ellipse(mouseX, mouseY, baseD, baseD);
  } else {
    col = 200;
  }
}
public void mousePressed() {
  if (reset) {
    particles.clear();
  }
  if (back && !particles.isEmpty()) {
    black = !black;
    particles.remove(particles.size()-1);
  }
}
public int available(int x, int y) {
  int point = get(x, y);
  if (dist(x, y, 500, 300)>250) {
    return -1;
  }
  if (point!=bl&&!particles.isEmpty()) {
    return 1;
  } else {
    return 0;
  }
}
public void printCir() {
  for (int i=0; i<particles.size(); i++) {
    Pair p = particles.get(i);
    noStroke();
    col = 100;
    fill(200, 3);
    ellipse(p.x, p.y, 2*baseD, 2*baseD);
    fill(p.c);
    ellipse(p.x, p.y, baseD, baseD);
    fill(250);
    textSize(16);
    text((i+1)+" ("+(p.x-500)+","+(300-p.y)+")", p.x-baseD/4, p.y);
  }
}
public boolean overResetBtn(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width && 
    mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
public void update() {
  if ( overResetBtn(100, 500, 100, 40) ) {
    reset = true;
    back = false;
  } else if ( overResetBtn(100, 450, 100, 40) ) {
    back = true;
    reset = false;
  } else {
    reset = back = false;
  }
}
class Pair{
  public int x;
  public int y;
  public int c;
  public Pair(int x , int y,int c){
    this.x = x ;
    this.y = y;
    this.c = c;
  }
  
  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + x;
    result = prime * result + y;
    return result;
  }
  @Override
  public boolean equals(Object obj) {
    if (this == obj)
      return true;
    if (obj == null)
      return false;
    if (getClass() != obj.getClass())
      return false;
    Pair other = (Pair) obj;
    if (x != other.x)
      return false;
    if (y != other.y)
      return false;
    return true;
  }

}
  public void settings() {  size(1000, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "Go" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
