import toxi.math.noise.SimplexNoise;

float z = 0;
float zoom = 0.01;
float rate = 0.1;
float n;
float gap = 5;

void setup() {
  size(500, 500);
  strokeWeight(10);
  noFill();
}


void draw() {
  //println(SimplexNoise.noise(c,0,0));
  //c += 1;
  //}

  for (int y = 0; y < height; y++) {
    for (int x = 0; x<width; x++) {
      if (y%gap == 0 && x%gap == 0) {
        n = map((float)SimplexNoise.noise(x*zoom, y*zoom, z*rate), -1, 1, 0, 1);
        stroke(n*255);
        point(x, y);
      }
    }
  }
  z += 1;
}
