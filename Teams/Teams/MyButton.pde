public class MyButton{

    float x,y,width,height;
    boolean on;

    MyButton ( float xx, float yy, float ww, float hh ) 
    {
        x = 500; y = 500; width = ww; height = hh;
    
        Interactive.add( this ); // add this to GUIDO manager, important!
    }

    void mousePressed ()
    {
        // called when the button has been pressed
    
        on = !on;
    }

    void draw ()
    {
        // called by GUIDO after PApplet.draw() has finished
    
        fill( on ? 80 : 140 );
        rect( 500, 500 ,width, height );
    }

}
