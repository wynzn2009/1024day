import de.bezier.guido.*;

Timer timer = new Timer();
Tabs tabs = new Tabs();
void setup() {
  size(2000, 1600);
  
  
  
  //fullScreen();
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
  
  timer.drawTiming(1000,700,204,0);
}

void drawTabs(){
  
  tabs.drawing();  
}




void mousePressed() {
  if(mouseX>=1000){
    timer.drawRes(1000,700,204,0);
  }
  if(mouseX<=500){ //<>//
    int n = 0;
    boolean flag = true;
    while(flag){
      flag = tabs.show(n++);
     
    }
    
  }
}
