

int i;
int x;
int y = 10;
float angle = 0;
float length = 10;
int gridSize = 5;
float lengthMin = 5;
float lengthMax = 50;

void setup() {
  size(800, 600);
  strokeWeight(0.1);
  int total = (width/gridSize) * (height/gridSize);
  println(total);
  

  for (i=0; i<total; i+=1) {
  
    length = random(lengthMin, lengthMax); 
    lineAngle(x, y, angle, length);
    //line(x,y,x,y+5);
    //text(i,x,y);

    x += gridSize;
    
    if(x > width) {
      y += gridSize;
      x = 0;
      println(i);
      println("reset");
    }
    
      //angle = random(100);
      angle += 1;
      //println(i);
  }

}


void draw() {
}


void lineAngle(int x, int y, float angle, float length)
{
  line(x, y, x+cos(angle)*length, y-sin(angle)*length);
}
