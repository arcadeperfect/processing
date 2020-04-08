import toxi.math.noise.SimplexNoise;
import processing.svg.*;

float fw;
float fh;
float gap = 3;
float mult1 = 0.005;
float n;
float z = 0;
float l = 50;
float d;
float maxL;
float o;
boolean svg = true;

void setup(){
  
  if(svg){
  beginRecord(SVG, "1.svg");
  }
  
  size(1000,1000);
  fw = width;
  fh = height;
  //stroke(0,0,0,20);
  noLoop();
  println(fh,fw);
  strokeWeight(0.01);
  smooth(40);
  noiseDetail(40);
}

void draw(){
  background(255);
  for (float y = 0; y < fh; y+=1){
    for (float x = 0; x < fw; x+=1){
      if (x%gap == 0 && y%gap == 0){
        //n=(float)SimplexNoise.noise(x*mult1,y*mult1,z);
        //n = map(n,-1,1,0,1);
        //stroke(n);


        n = myNoise(x, y, z);
        point(x,y);
        //l = random(50);
        d = dist(x,y,500,500);
        
        //o = map(d,0,700,70,50);
        o = 100;
        stroke(0,0,0,o);
        
        //l = map(noise(d*0.01),0,1,4,50);
        //l = map(d,0,700,150,1);
        l = myNoise(x/2,y/2,1000);
        l = map(l,0,1,1,300);
        
        
        lineAngle(x,y,n,l);
        maxL = max(maxL, l);
        //println(x,y);
      }
    }
  }
  z += 0.01;
  println(maxL);
  if(svg){endRecord();}
  println("dun");
}

float myNoise(float x,float y, float z){
  
  //n = (float)SimplexNoise.noise(x*mult1,y*mult1,z);
  //n = map(n,-1,1,0,1);
  
  n = noise(x*mult1,y*mult1,z);
  
  return n;
}


void lineAngle(float x, float y, float angle, float length)
{
  angle = angle*TWO_PI;
  //angle *= 1;
  line(x, y, x+cos(angle)*length, y-sin(angle)*length);
}
