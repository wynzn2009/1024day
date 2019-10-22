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
 
  void mousePressed ()
  {
    teams.go();
  }

  void draw ()
  {
    // called by GUIDO after PApplet.draw() has finished

    fill(140 );
    rect( x, y, width, height );
    fill(255);
    textSize(40);
    text("GO!!!",x+20, y+60);
  }
}
