import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import de.bezier.guido.*; 
import java.util.*; 
import java.util.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Teams extends PApplet {



Timer timer = new Timer();
Tabs tabs = new Tabs();
boolean init = false;
boolean action = false;
boolean playing = false;
boolean success = false;
boolean error = false;
long curr = System.currentTimeMillis();
long n = 0;
int total = 0;
public void setup() {
  
  //fullScreen();
    
  
  Interactive.make( this ); // start GUIDO

  StarterButton sb = new StarterButton(this); // create an instance of your element
  
  ActionButton ab = new ActionButton(this); // create an instance of your element
  
  //ReplayButton rb = new ReplayButton(this); // create an instance of your element
  
  
  
  background(204);
  textSize(32);

  drawTabs();
    
}
public void draw() {
  //background(204);
  //textSize(32);
  //fill(250);
  //fill(tabs.quiz);
  //rect(1000, 400, 300, 300);
  if(action){
    timer.drawTiming(550,600,204,0);
    
  }
  if(playing){
    tabs.drawing();
    fill(tabs.quiz);
    rect(550, 400, 150, 150);
  }else{
    fill(255);
    rect(550, 400, 150, 150);
  }
  if(success){
    action = false;
    playing = false;
  }
  
  if(init){
    init = tabs.show(n);
    if(System.currentTimeMillis()-curr>300){
      n++;
      curr = System.currentTimeMillis();
    }
    if(!init){
      playing = true;
    }
    
  }
}

public void drawTabs(){
  
  tabs.drawing();  
}


public void restart(){
  if(error){
    //playing = true;
    action = true;
    init = true;
    n=-1;
    error = false;
    fill(0xff990000);
    textSize(50);
    text("FAILED", 1100, 100);
  }
}

public void go(){
  timer.reset();
  tabs.reset();
  action = true;
  drawTabs();
  init = true;
  playing = false;
  success = false;
  curr = System.currentTimeMillis();
  n = 0;
  total = 0;
}
public void error(){
  error = true;
  tabs.reset();
  
  playing = false;
  //action = false;
  success = false;
  drawTabs();
  curr = System.currentTimeMillis();
  n = 0;
  total = 0;
  init = false;
  fill(255);
  rect(550, 400, 150, 150);
  
  fill(0xff990000);
  textSize(50);
  text("FAILED", 1100, 100);
}
public void success(){
  success = true;
}
public void mousePressed() {
  if(playing){
    int flag = tabs.click(mouseX, mouseY);
    if(flag==0){
      error();
    }
    if(flag==1){
      total++;
      if(total==tabs.total){
        success();
      }
    }
  }
}
public class ActionButton {

  float x, y, width, height;
  boolean on;
  Teams teams;

  ActionButton ( float xx, float yy, float ww, float hh ) 
  {
    x = xx; 
    y = yy; 
    width = ww; 
    height = hh;

    Interactive.add( this ); // add this to GUIDO manager, important!
  }
  
  ActionButton (Teams teams) 
  {
    x = 1000; 
    y = 200; 
    width = 200; 
    height = 100;
    this.teams = teams;

    Interactive.add( this ); // add this to GUIDO manager, important!
  }
 
  public void mousePressed ()
  {
    teams.go();
  }

  public void draw ()
  {
    // called by GUIDO after PApplet.draw() has finished

    fill(140 );
    rect( x, y, width, height );
    fill(255);
    textSize(40);
    text("GO!!!",x+20, y+60);
  }
}

public class MyButton{

    float x,y,width,height;
    boolean on;

    MyButton ( float xx, float yy, float ww, float hh ) 
    {
        x = 500; y = 500; width = ww; height = hh;
    
        Interactive.add( this ); // add this to GUIDO manager, important!
    }

    public void mousePressed ()
    {
        // called when the button has been pressed
    
        on = !on;
    }

    public void draw ()
    {
        // called by GUIDO after PApplet.draw() has finished
    
        fill( on ? 80 : 140 );
        rect( 500, 500 ,width, height );
    }

}
public class ReplayButton {

  float x, y, width, height;
  boolean on;
  Teams teams;

  ReplayButton ( float xx, float yy, float ww, float hh ) 
  {
    x = xx; 
    y = yy; 
    width = ww; 
    height = hh;

    Interactive.add( this ); // add this to GUIDO manager, important!
  }
  
  ReplayButton (Teams teams) 
  {
    x = 1000; 
    y = 200; 
    width = 200; 
    height = 100;
    this.teams = teams;

    Interactive.add( this ); // add this to GUIDO manager, important!
  }
 
  public void mousePressed ()
  {
    teams.go();
  }

  public void draw ()
  {
    // called by GUIDO after PApplet.draw() has finished

    fill(140 );
    rect( x, y, width, height );
    fill(255);
    textSize(40);
    text("GO!!!",x+20, y+60);
  }
}

public class StarterButton {

  float x, y, width, height;
  boolean on;
  Teams teams;

  StarterButton ( float xx, float yy, float ww, float hh ) 
  {
    x = xx; 
    y = yy; 
    width = ww; 
    height = hh;

    Interactive.add( this ); // add this to GUIDO manager, important!
  }
  
  StarterButton (Teams teams) 
  {
    x = 1000; 
    y = 400; 
    width = 200; 
    height = 100;
    this.teams = teams;

    Interactive.add( this ); // add this to GUIDO manager, important!
  }
 
  public void mousePressed ()
  {
    teams.restart();
  }

  public void draw ()
  {
    // called by GUIDO after PApplet.draw() has finished

    fill(140 );
    rect( x, y, width, height );
    fill(255);
    textSize(40);
    text("RESTART",x+20, y+60);
  }
}

public enum Stats{

  READY,CLICK,OPEN,ERROR
  
}
class Tab{
  public static final int WIDTH = 40;
  public static final int HEIGHT = 60;
  public static final int SPAN_Y = 60;
  public static final int SPAN_X = 200;
  public final int def = 0xff505050;
  public int xx;
  public int yy;
  public int c;
  public volatile Stats stat;
  

  public Tab(int x,int y,int c,Stats stat){
    this.xx = x;
    this.yy = y;
    this.c = c;
    this.stat = stat;
  }


  public void drawingDef(){
    fill(def);
    rect(xx*WIDTH+xx*5+SPAN_X, yy*HEIGHT+yy*5+SPAN_Y, WIDTH, HEIGHT);
   
  }
  
  public void drawingRunning(){
    switch(stat) {
      case READY: 
        fill(def);
        break;
      case OPEN: 
        fill(c);
        break;
      default: break;
    }
    
    rect(xx*WIDTH+xx*5+SPAN_X, yy*HEIGHT+yy*5+SPAN_Y, WIDTH, HEIGHT);
   
  }
  
  public void drawingRes(){
    fill(c);
    rect(xx*WIDTH+xx*5+SPAN_X, yy*HEIGHT+yy*5+SPAN_Y, WIDTH, HEIGHT);
   
  }
}

public class Tabs {
  public static final int ROW = 10;
  public static final int COLUMN = 7;
  public static final int COLORS = 6;
  public final int[] COLOR_ARR = {0xffFF0000, 0xff1000FF, 0xff00FF0E, 0xffFFEA00, 0xffFF00FB, 0xff00FFF9};
  public int quiz;
  public Tab[][] tabs = new Tab[COLUMN][ROW];
  public int total = 0;



  public Tabs() {
    Random random = new Random();
    quiz = COLOR_ARR[random.nextInt(COLORS)];
    for (int i=0; i<COLUMN; i++) {
      for (int j=0; j<ROW; j++) {
        tabs[i][j] = new Tab(i, j, COLOR_ARR[random.nextInt(COLORS)], Stats.READY);
        if(quiz==tabs[i][j].c){
          total++;
        }
      }
    }
    
  }

  public void drawing() {
    for (int i=0; i<COLUMN; i++) {
      for (int j=0; j<ROW; j++) {
        Tab tab = tabs[i][j];

        tab.drawingRunning();
      }
    }
  }

  public boolean show(long n) {
    if (n>ROW) {
      return false;
    }
    if (n<0) {
      n=0;
    }
    if (n<=ROW) {
      for (int i=0; i<ROW; i++) {
        for (int j=0; j<COLUMN; j++) {
          Tab tab = tabs[j][i];
          if (n==i) {
            tab.drawingRes();
          } else {
            tab.drawingRunning();
          }
        }
      }
    }
    return true;
  }

  public int click(int mx, int my) {
    if (mx<Tab.SPAN_X||my<Tab.SPAN_Y||mx>(COLUMN-1)*Tab.WIDTH+(COLUMN-1)*5+Tab.SPAN_X+Tab.WIDTH||my>(ROW-1)*Tab.HEIGHT+(ROW-1)*5+Tab.SPAN_Y+Tab.HEIGHT) {
      return -1;
    }
    int indx = (mx-Tab.SPAN_X)/(Tab.WIDTH+5);
    int indy = (my-Tab.SPAN_Y)/(Tab.HEIGHT+5);

    if(tabs[indx][indy].stat==Stats.READY){
      tabs[indx][indy].stat = Stats.OPEN;
    }else{
      return -1;
    }

    return tabs[indx][indy].c!=quiz?0:1;
  }
  
  public void reset(){
    Random random = new Random();
    quiz = COLOR_ARR[random.nextInt(COLORS)];
    total = 0;
    for (int i=0; i<COLUMN; i++) {
      for (int j=0; j<ROW; j++) {
        tabs[i][j] = new Tab(i, j, COLOR_ARR[random.nextInt(COLORS)], Stats.READY);
        if(quiz==tabs[i][j].c){
          total++;
        }
      }
    }
    
  }
}


class Timer {
  public long start;
  public long end;
  public volatile boolean running = true;

  public Timer() {
    this.start = System.currentTimeMillis();
  }

  public void drawTiming(int x, int y, int def, int time) {

    if(running){

      long span = System.currentTimeMillis()-start;
      long mill = span%1000;
      long senc = ((span-mill)/1000)%60;
      long min = ((span-mill)/1000-senc)/60;
  
      
      fill(def);
      rect(x, y, 300, 150);
      fill(time);
      textSize(30);
      text(min+"min"+senc+"."+mill, x+20, y+100);
    }
    
  }


  public void drawRes(int x, int y, int def, int time) {
    if(running){
      end = System.currentTimeMillis();
      running = false; 
      long span = end-start;
      long mill = span%1000;
      long senc = ((span-mill)/1000)%60;
      long min = ((span-mill)/1000-senc)/60;
  
  
      fill(def);
      rect(x, y, 300,150);
      fill(time);
      textSize(30);
      text(min+"min"+senc+"."+mill, x+20, y+100);
    }
    
  }
  
  
  public void reset() {
    start = System.currentTimeMillis();
    end = System.currentTimeMillis();
    running = true;    
  }
}

  public void settings() {  size(1300, 750); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Teams" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
