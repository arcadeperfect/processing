import toxi.math.noise.SimplexNoise;

float fw;
float fh;
float gap = 5;
float mult1 = 0.005;
float n;
float z = 0;

void setup(){
  size(1000,1000);
  fw = width;
  fh = height;
  stroke(0);
  //noLoop();
  println(fh,fw);
  strokeWeight(10);
}

void draw(){
  for (float y = 0; y < 1000; y+=1){
    for (float x = 0; x < 1000; x+=1){
      if (x%gap == 0 && y%gap == 0){
        n=(float)SimplexNoise.noise(x*mult1,y*mult1,z);
        n = map(n,-1,1,0,255);
        stroke(n);
        point(x,y);
        
      }
    }
  }
  z += 0.01;
}




void lineAngle(float x, float y, float angle, float length)
{
  //angle = angle*TWO_PI;
  //angle *= 1;
  line(x, y, x+cos(angle)*length, y-sin(angle)*length);
}
