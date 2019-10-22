import de.bezier.guido.*;

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
void setup() {
  
  //fullScreen();
    
  size(1300, 750);
  Interactive.make( this ); // start GUIDO

  StarterButton sb = new StarterButton(this); // create an instance of your element
  
  ActionButton ab = new ActionButton(this); // create an instance of your element
  
  //ReplayButton rb = new ReplayButton(this); // create an instance of your element
  
  
  
  background(204);
  textSize(32);

  drawTabs();
    
}
void draw() {
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

void drawTabs(){
  
  tabs.drawing();  
}


void restart(){
  if(error){
    //playing = true;
    action = true;
    init = true;
    n=-1;
    error = false;
    fill(#990000);
    textSize(50);
    text("FAILED", 1100, 100);
  }
}

void go(){
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
void error(){
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
  
  fill(#990000);
  textSize(50);
  text("FAILED", 1100, 100);
}
void success(){
  success = true;
}
void mousePressed() {
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
