float G = 1;
//ArrayList<Planet> planetz = new ArrayList<Planet>();
//Planet p = new Planet(1,2,3,4);
//planetz.add(p);

//Planet p1 = new Planet(random(0, width), random(0,height), random(-1,1), random(-1,1));

ArrayList<Planet> planetz = new ArrayList<Planet>();

void setup() {
  size(500, 500);
  background(0);

  stroke(255);


  //Planet p = new Planet(1, 2, 3, 4);
  //planetz.add(p);

  for (int c=0; c<10; c++) {
    planetz.add(new Planet(random(0, width), random(0, height), random(-1, 1), random(-1, 1)));
  }
}



void draw() {

  background(0);

  for (Planet x : planetz) {

    x.update();
    x.show();
  }
}

class Planet {

  float xPos;
  float yPos;
  float xVel;
  float yVel;

  float mass;
  float radius;
  PVector pos;
  PVector vel;
  PVector acc;

  Planet(float xPos, float yPos, float xVel, float yVel) {
    pos = new PVector(xPos, yPos);
    vel = new PVector(xVel, yVel);
    acc = new PVector(0, 0);
    mass = 50;
    radius = 20;
  }

  void update() {

    for (int c=0; c<10; c++) {
      planetz.add(new Planet(random(0, width), random(0, height), random(-1, 1), random(-1, 1)));
    }

    pos.add(vel);
  }

  void show() {
    circle(pos.x, pos.y, radius/2);
  }

  PVector calc_grav(Planet planet1) {
    PVector force = PVector.sub(planet1.pos, pos);
    float distance = force.mag();
    force.normalize();
    float strength = (G * planet1.mass * mass) / (distance * distance);
    force.mult(strength);
    return force;
  }

  PVector calc_grav(Planet planet1, Planet planet2) {

    PVector force = PVector.sub(planet1.pos, planet2.pos);
    float distance = force.mag();
    force.normalize();
    float strength = (G * planet1.mass * planet2.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }
