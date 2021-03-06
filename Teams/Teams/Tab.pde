class Tab{
  public static final int WIDTH = 40;
  public static final int HEIGHT = 60;
  public static final int SPAN_Y = 60;
  public static final int SPAN_X = 200;
  public final color def = #505050;
  public int xx;
  public int yy;
  public color c;
  public volatile Stats stat;
  

  public Tab(int x,int y,color c,Stats stat){
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
