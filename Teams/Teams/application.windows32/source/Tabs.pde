import java.util.*;
public class Tabs {
  public static final int ROW = 10;
  public static final int COLUMN = 7;
  public static final int COLORS = 6;
  public final color[] COLOR_ARR = {#FF0000, #1000FF, #00FF0E, #FFEA00, #FF00FB, #00FFF9};
  public color quiz;
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
