import processing.svg.*;


float x = 0;
float y = 0;
float gridCells = 80; // number of cells on each line
float angle = 0 ;


float gridWidth; // width of each cell
float total;      // total number of cells
float xh;          // half width
float yh;
int i;
float length;
float fWidth;
float fHeight;
float s;

void setup() {
  
  size(800, 800);
  noLoop();
  
  fWidth = float(width);
  fHeight = float(height);
  gridWidth = fWidth/gridCells;
  total = gridCells * (fHeight/gridWidth+1);
  
  length = 1;
  strokeWeight(0.02);


  for (i=1; i<=total; i+=1) {
  
    
    s = sin(i*0.5);
    length = map(s,-1,1,1,50)+random(-20,20);
    //length =random(1,300);
    
    xh = x + gridWidth/2;
    yh = y + gridWidth/2;
    //text(i, xh, yh);
    //println(i, xh, yh);
    lineAngle(int(xh), int(yh), angle, length);

    x += gridWidth;

    if (i%gridCells == 0 && i != 0) {
              println(x,y);
      x = 0;
      y += gridWidth;

        println(i, "%", gridCells, i%gridCells);
        angle +=0.01;
    }
    angle += 0.1 + random(-0.1,0.1);
  }
  
}




void draw() {
}




void lineAngle(int x, int y, float angle, float length)
{
  line(x, y, x+cos(angle)*length, y-sin(angle)*length);
}
