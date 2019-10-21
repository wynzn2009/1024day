import java.util.*;
ArrayList<Pair> particles = new ArrayList<Pair>();
HashSet<Pair> set = new HashSet<Pair>();
int col = 200;
color bl = #FFFFFF;//white
color c2 = #63488B;
color c1 = #D364AB;
boolean black = true;
boolean reset = false;
boolean back = false;
int baseD = 140;
void setup() {
  size(1000, 600);
}

void draw() {
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
  fill(#1c661e);
  rect(100, 500, 100, 40);
  fill(250);
  textSize(16);
  text("reset", 130, 525); 
  fill(#14397a);
  rect(100, 450, 100, 40);
  fill(250);
  text("withdraw", 115, 475);
  printCir();
  hint();
}
void hint() {
  int a = available(mouseX, mouseY);
  color cc = 0;
  if (a==-1) {
    cc = #ffff00;
  } else if (a==1) {
    cc = #de0000;
  } else if (a==0) {
    cc = #00cc07;
  }
  stroke(cc);
  strokeWeight(3);
  fill(255, 0);
  ellipse(mouseX, mouseY, baseD, baseD);
}
void mouseClicked() {
  printCir();
  stroke(0);
  boolean fl = true;
  color point = get(mouseX, mouseY);
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
void mousePressed() {
  if (reset) {
    particles.clear();
  }
  if (back && !particles.isEmpty()) {
    black = !black;
    particles.remove(particles.size()-1);
  }
}
int available(int x, int y) {
  color point = get(x, y);
  if (dist(x, y, 500, 300)>250) {
    return -1;
  }
  if (point!=bl&&!particles.isEmpty()) {
    return 1;
  } else {
    return 0;
  }
}
void printCir() {
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
boolean overResetBtn(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width && 
    mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
void update() {
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
