import java.util.*;
public class Tabs {
  public static final int ROW = 10;
  public static final int COLUMN = 7;
  public static final int COLORS = 6;
  public final color[] COLOR_ARR = {#FF0000, #1000FF, #00FF0E, #FFEA00, #FF00FB,#00FFF9};
  public color quiz;
  public Tab[][] tabs = new Tab[COLUMN][ROW];


  public Tabs() {
    Random random = new Random();
    for (int i=0; i<COLUMN; i++) {
      for (int j=0; j<ROW; j++) {
        tabs[i][j] = new Tab(i, j, COLOR_ARR[random.nextInt(COLORS)], Stats.READY);
      }
    }
    quiz = COLOR_ARR[random.nextInt(COLORS)];
  }
  
  public void drawing(){
    for (int i=0; i<COLUMN; i++) {
      for (int j=0; j<ROW; j++) {
        Tab tab = tabs[i][j];
        
        tab.drawingRunning();
      }
    }
  }
  
  public boolean show(int n){
    if(n<0||n>ROW){
      return false;
    }
    for (int i=0; i<ROW; i++) {
      for (int j=0; j<COLUMN; j++) {
        Tab tab = tabs[j][i];
        if(n==i){
          tab.drawingRes();
        }else{
          tab.drawingRunning();
        }
       }
       
    }
    
    return n!=ROW;
  }
}
