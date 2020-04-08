
import processing.svg.*;

float fw;
float fh;
//float gap = 3;
float gap = 3;
float mult1 = 0.005;
float n;
float z = 0;
float l = 50;
float d;
float maxL;
float o;
boolean svg = true;
String name;
int c;
void setup() {
  //noiseSeed(8);
  //noiseSeed(15);

  name = str(1)+".svg";
  println(name);
  if (svg) {

    beginRecord(SVG, "3.svg");
  }

  size(1000, 1000);
  fw = width;
  fh = height;
  //stroke(0,0,0,20);
  noLoop();
  println(fh, fw);
  strokeWeight(0.01);
  smooth(40);
  noiseDetail(40);
  colorMode(HSB, 100);
}

void draw() {
  background(255, 0, 0);
  for (float y = 0; y < fh; y+=1) {

    for (float x = 0; x < fw; x+=1) {
      if (x%gap == 0 && y%gap == 0) {
        //n=(float)SimplexNoise.noise(x*mult1,y*mult1,z);
        //n = map(n,-1,1,0,1);
        //stroke(n);
        float mult2 = 0.005;
        float h = map(noise(x*mult2, y*mult2, z*0.01+100), 0, 1, 50, 90);
        mult2 = 0.001;
        //float s = map(noise(x*mult2, y*mult2, z*0.01+100), 0, 1, 0, 100);
        float s = 50;
        float b = 100;
        stroke(h, s, b, o);

        n = myNoise(x, y, z)*1.1;
        point(x, y);
        //l = random(50);
        d = dist(x, y, 500, 500);

        //o = map(d,0,700,70,50);
        o = 100;
        //stroke(0,0,0,o);

        //l = map(noise(d*0.01),0,1,4,50);
        //l = map(d,0,700,150,1);
        l = myNoise(x/2, y/2, 1000);
        l = map(l, 0, 1, 1, 300);


        lineAngle(x, y, n, l);
        maxL = max(maxL, l);
        //println(x,y);
      }
    }
  }
  z += 0.01;
  println(maxL);
  if (svg) {
    endRecord();
  }
  println("dun");
}

float myNoise(float x, float y, float z) {

  //n = (float)SimplexNoise.noise(x*mult1,y*mult1,z);
  //n = map(n,-1,1,0,1);

  n = noise(x*mult1, y*mult1, z);

  return n;
}


void lineAngle(float x, float y, float angle, float length)
{
  angle = angle*TWO_PI;
  //angle *= 1;
  line(x, y, x+cos(angle)*length, y-sin(angle)*length);
}
