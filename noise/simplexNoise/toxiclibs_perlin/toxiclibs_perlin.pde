import toxi.math.noise.PerlinNoise;
import toxi.geom.Vec2D;
//import toxi.math.noise.SimplexNoise;

float z = 0;
float zoom = 0.01;
float rate = 0.1;
float n;
float gap = 5;
PerlinNoise nz;
Vec2D   p, pp, t;
//nz  = new PerlinNoise();
//p  = new Vec2D(0, height);
//pp = new Vec2D(p.x, p.y);
//t  = new Vec2D(width/2, height/2);

void setup() {
  size(500, 500);
  strokeWeight(10);
  noFill();

  //p  = new Vec2D(0, height);
  //pp = new Vec2D(p.x, p.y);
  //t  = new Vec2D(width/2, height/2);
  nz  = new PerlinNoise();
}


void draw() {
  //println(SimplexNoise.noise(c,0,0));
  //c += 1;
  //}

  //for (int y = 0; y < height; y++) {
  //  for (int x = 0; x<width; x++) {
  //    if (y%gap == 0 && x%gap == 0) {
  //      n = map((float)SimplexNoise.noise(x*zoom, y*zoom, z*rate), -1, 1, 0, 1);
  //      stroke(n*255);
  //      point(x, y);
  //    }
  //  }
  //}

  for (int y = 0; y < height; y++) {
    for (int x = 0; x<width; x++) {
      if (y%gap == 0 && x%gap == 0) {

        n = nz.noise(x*zoom, y*zoom, z*rate);
        //n = map(n, -1, 1, 0, 1);

        stroke(n*255);
        point(x, y);
      }
    }
  }

  z += 1;
}
