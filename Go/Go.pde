import java.util.*;
ArrayList<Pair> particles = new ArrayList<Pair>();
HashSet<Pair> set = new HashSet<Pair>();
int col = 200;
color bl = #FFFFFF;
color c2 = #552299;
color c1 = #AA1973;
boolean black = true;
void setup() {
  size(1000, 600);
  background(51);

  fill(255);
  ellipse(500, 300, 500, 500);
  fill(0);
  ellipse(500, 300, 3, 3);
  
}

void draw() {
  fill(51);
  rect(750, 400, 500, 500);
  textSize(32);
  int x = mouseX - 500;
  int y = 300-mouseY;
  fill(col);
  text("X="+x, 800, 500); 
  text("Y="+y, 800, 550); 
  fill(150);
  ellipse(mouseX,mouseY, 100, 100);
}
void mouseClicked() {
  boolean fl = true;
  color point = get(mouseX, mouseY);
  if(point!=bl){
    fl = false;
  }else{
    fl = dist(mouseX, mouseY, 500, 300)<=250;
  }
  if(fl){
    noStroke();
    col = 100;
    particles.add(new Pair(mouseX,mouseY));
    fill(200,3);
    ellipse(mouseX,mouseY, 200, 200);
    if(black){
      fill(c1);
    }else{
      fill(c2);
    }
    black = !black;
    ellipse(mouseX,mouseY, 100, 100);
  }else{
    col = 200;
  }
}
