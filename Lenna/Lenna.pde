import java.util.*;
PImage img;
ArrayList<Pair[]> list = new ArrayList<Pair[]>();
ArrayList<PShape> list1 = new ArrayList<PShape>();
boolean[] sh = {true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true};
Pair[] pairs = {new Pair(70, 45, 0), new Pair(250, 55, 0), new Pair(455, 55, 0), new Pair(30, 160, 0), 
  new Pair(190, 145, 0), new Pair(355, 110, 0), new Pair(60, 285, 0), new Pair(140, 220, 0), 
  new Pair(250, 270, 0), new Pair(335, 220, 0), new Pair(430, 295, 0), new Pair(485, 340, 0), 
  new Pair(50, 440, 0), new Pair(200, 450, 0), new Pair(330, 375, 0), new Pair(445, 445, 0)};
void setup() {
  size(512, 512);
  img = loadImage("Lenna.png");  // Load an image into the program
  Pair a = new Pair(0, 0, 0);
  Pair b = new Pair(0, 512, 0);
  Pair c = new Pair(512, 512, 0);
  Pair d = new Pair(512, 0, 0);
  Pair e = new Pair(235, 0, 0);
  Pair f = new Pair(350, 0, 0);
  Pair g = new Pair(0, 85, 0);
  Pair h = new Pair(0, 260, 0);
  Pair i = new Pair(0, 380, 0);
  Pair j = new Pair(100, 512, 0);
  Pair k = new Pair(360, 512, 0);
  Pair l = new Pair(512, 235, 0);
  Pair m = new Pair(512, 400, 0);
  Pair n = new Pair(162, 82, 0);
  Pair o = new Pair(191, 326, 0);
  Pair p = new Pair(55, 200, 0);
  Pair q = new Pair(102, 148, 0);
  Pair r = new Pair(284, 136, 0);
  Pair s = new Pair(239, 230, 0);
  Pair t = new Pair(328, 287, 0);
  Pair u = new Pair(444, 357, 0);
  Pair[] p1 = {a, g, q, n, e};
  Pair[] p2 = {n, r, f, e};
  Pair[] p3 = {f, l, d};
  Pair[] p4 = {g, h, p, q};
  Pair[] p5 = {q, s, r, n};
  Pair[] p6 = {f, r, l};
  Pair[] p7 = {h, i, o, p};
  Pair[] p8 = {p, q, s, o};
  Pair[] p9 = {s, o, t};
  Pair[] p10 = {s, t, l, r};
  Pair[] p11 = {t, u, l};
  Pair[] p12 = {l, u, m};
  Pair[] p13 = {i, b, j, o};
  Pair[] p14 = {j, k, o};
  Pair[] p15 = {o, k, u, t};
  Pair[] p16 = {k, c, m, u};
  list.add(p1);
  list.add(p2);
  list.add(p3);
  list.add(p4);
  list.add(p5);
  list.add(p6);
  list.add(p7);
  list.add(p8);
  list.add(p9);
  list.add(p10);
  list.add(p11);
  list.add(p12);
  list.add(p13);
  list.add(p14);
  list.add(p15);
  list.add(p16);
  for (int ind=0; ind<list.size(); ind++) {
    Pair[] sp = list.get(ind);

    PShape shape = createShape();
    shape.beginShape();
    for (int in = 0; in<sp.length; in++) {
      shape.vertex(sp[in].x, sp[in].y);
    }
    shape.endShape();
    list1.add(shape);
  }
  
}

void draw() { 
  image(img, 0, 0);  // Display at full opacity

  //line(0, 85, 512, 400);
  //line(235, 0, 0, 260);
  //line(350, 0, 100, 512);
  //line(350, 0, 512, 235);
  //line(0, 380, 512, 235);
  //line(360, 512, 512, 235);
  //line(162, 82, 512, 235);
  //line(191, 326, 360, 512);
  //line(55, 200, 191, 326);

  //for (int i=0; i<list.size(); i++) {
  //  show(list.get(i), sh[i]);
  //}

  for (int j=0; j<list1.size(); j++) {
    if (j%2==0) {
      PShape ss = list1.get(j);
      //ss.setVisible(false);
    }
    shape(list1.get(j));
  }
  for (int it = 0; it<pairs.length; it++) {
    fill(#1491cc);
    ellipse(pairs[it].x, pairs[it].y, 30, 30);
  }
  textSize(50);


  text(mouseX+","+mouseY, 200, 330);
}
void show(Pair[] p, boolean show) {  虐啦                                                                                                                                                                                                                      

  if (show) {
    fill(200);
  } else {
    noFill();
  }
  beginShape();
  for (int i=0; i<p.length; i++) {
    vertex(p[i].x, p[i].y);
  }
  endShape();
}
