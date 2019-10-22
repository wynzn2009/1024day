import java.util.*;
class Timer {
  public long start;
  public long end;
  public volatile boolean running = true;

  public Timer() {
    this.start = System.currentTimeMillis();
  }

  public void drawTiming(int x, int y, color def, color time) {

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


  public void drawRes(int x, int y, color def, color time) {
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
