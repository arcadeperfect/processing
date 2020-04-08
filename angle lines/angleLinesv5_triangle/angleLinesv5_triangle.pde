float x = 0;
float y = 0;
float x1;
float y1;
float x2;
float y2;
float gridCellsY;
float angle = 0;
float fWidth;
float fHeight;
float gridWidth;
float midX;
float midY;

float c = 0;
float length;

float gridCellsX = 800;
float s;


PShape circle;

void setup() {

  size(1000, 1000);
  noLoop();

  fWidth = float(width);
  fHeight = float(height);
  midX = fWidth/2;
  midY = fHeight/2;
  gridWidth = fWidth/gridCellsX;
  //println("gridWidth", gridWidth);
  gridCellsY = fHeight / gridWidth;
  println("gridCellsY", gridCellsY);

  circle = createShape(ELLIPSE, midX, midY, 100, 50);
  //textSize(10);
  //fill(0, 0, 0);
}


void draw() {
  background(255);

  //circle(midX, midY, 700);
  strokeWeight(0.01);
  stroke(0,0,0,50);
  for (float y=0; y < gridCellsY; y+=1) {
    for (float x=0; x < gridCellsX; x+=1) {
      x1 = x*gridWidth + gridWidth/2;
      y1 = y*gridWidth + gridWidth/2;
      x2 = x / gridCellsX;
      y2 = y / gridCellsY;

      //angle = noise(c*0.3)*2;
      //angle = 0.25/2;
      //circle(midX,midY,100);
      //point(x*gridWidth, y*gridWidth);
      //length = sin((c+3)/2);
      //length = map(length,-1,1,3,200);
      s = sin(c*0.5);
      //length = map(s, -1, 1, 1, 40)+random(-2, 2);
      length = y2;
      //length = 1-y2;
      length = length*(pow(length, 0.2));
      //length += 3;
      length = map(length, 0, 1, 50, -50);
      length = max(0, length);
      println(y2);
      //if (dist(x1, y1, midX, midY)<map(noise(c*0.03),0,1,150,550)) {
      if (dist(x1,y1,midX,y1) < y1*0.66666 && y2 < 0.6666){

        float distance = dist(x1, y1, midX, midY);

        float variance = pow(distance/800, 5)*50;
        //variance = 0;
        x1 = vary(x1, variance);
        y1 = vary(y1, variance)+100;
        lineAngle(x1, y1, angle, length);
      }
      angle += 0.1 + random(-0.1, 0.1);
      c += 1;
    }
    angle += 0.01;
  }
}

//void draw(){
//  float midX = fWidth/2;
//  float midY = fHeight/2;

//    background(255);
//    angle = noise(c*0.005)*2;
//    println(angle*TWO_PI);
//    lineAngle(midX, midY, angle, 60);

//    text(angle,midX,midY);
//    c += 1;
//}


void lineAngle(float x, float y, float angle, float length)
{
  //angle = angle*TWO_PI;
  //angle *= 1;
  line(x, y, x+cos(angle)*length, y-sin(angle)*length);
}

float vary(float i, float v)
{
  return(i+random(-v, v));
}
