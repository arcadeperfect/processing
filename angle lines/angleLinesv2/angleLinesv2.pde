import processing.svg.*;
  
boolean svg = false;



float x = 0;
float y = 0;
float gridCells = 100; // number of cells on each line
float angle = 0 ;


float gridWidth; // width of each cell
float total;      // total number of cells
float xh;          // half width of cell
float yh;        // half height of cell
float xhs;        // half width of scene
float yhs;        // half height of scene
int i;
float length;
float fWidth;
float fHeight;
float s;
float mult;





void setup() {

  size(800, 800);
  noLoop();
  if (svg == true) {
    beginRecord(SVG, "4.svg");
  }
  fWidth = float(width);
  fHeight = float(height);
  xhs = fWidth/2;
  yhs = fHeight/2;
  gridWidth = fWidth/gridCells;
  total = gridCells * (fHeight/gridWidth+1);

  length = 1;
  angle = 0.5;
  strokeWeight(0.002);


  for (i=1; i<=total; i+=1) {


    s = sin(i*0.5);
    //length = map(s,-1,1,1,50)+random(-20,20);
    //length = length*0.1;
    //length = 2;
    //length = (sin((i*0.1)+2)*100)*sin(i+5)*2;
    //length = length*map((1-(abs(xhs-x)*(1/xhs))),0,1,0.3,1);
    //length = length*(1-(abs(yhs-y)*(1/yhs)));

    //length = map(y, 0, fHeight, 1, 50);

    //length *= 20;
    //length = length*(random(3));
    //length =random(1,300);
    length = angle*500+random(-10,10);
    xh = x + gridWidth/2;
    yh = y + gridWidth/2;
    //text(i, xh, yh);
    //println(i, xh, yh);
    lineAngle(int(xh), int(yh), angle, length);

    x += gridWidth;

    if (i%gridCells == 0 && i != 0) {
      println(x, y);
      x = 0;
      y += gridWidth;

    angle += 0.001;
    if(angle >=1) {
      angle= angle-1;
    }

      //angle +=0.01;
    }
    /*
    angle += 0.001;
    if(angle >=1) {
      angle= angle-1;
    }
    */
    
    

    println(i, angle);
  }
  if (svg == true) {
    endRecord();
  }
}




void draw() {
}




void lineAngle(int x, int y, float angle, float length)
{
  line(x, y, x+cos(angle)*length, y-sin(angle)*length);
}
