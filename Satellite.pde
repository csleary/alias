float spin;
boolean satGroup1, satGroup2;
Satellite sat1, sat2, sat3, sat4, sat5, sat6;

class Satellite { // Name
  float angle; // Data
  String shape;

  Satellite(float a, String b) { // Constructor; set addressable variables.
    angle = a;
    shape = b;
  }
  void move() { // Behaviour (keep separate from display to avoid cumulative spins.
    spin += 2;
  }
  void display() { // Functionality
    pushMatrix();
    rotate(radians(angle));
    translate(width/5, 0, 0);
    rotateZ(radians(spin)); 
    if (shape == "panel") {
      stroke(0, 255, 255);
      fill(0, 255, 255, 127);
      box(100, 100, 5);
    }
    if (shape == "pyramid") {
      scale(0.75);
      translate(-100, -57.735, -75);
      beginShape(TRIANGLES);

      stroke(255, 255, 0);
      fill(0, 255, 255, 127);
      vertex(0, 0, 0);
      fill(0, 255, 255, 127);
      vertex(200, 0, 0);
      fill(0, 255, 255, 127);
      vertex(100, 173.2, 0);

      fill(0, 255, 255, 127);
      vertex(0, 0, 0);
      fill(0, 255, 255, 127);
      vertex(200, 0, 0);
      fill(255, 255, 0, 127);
      vertex(100, 57.735, 173.2);

      fill(0, 255, 255, 127);
      vertex(200, 0, 0);
      fill(0, 255, 255, 127);
      vertex(100, 173.2, 0);
      fill(255, 255, 0, 127);
      vertex(100, 57.735, 173.2);

      fill(0, 255, 255, 127);
      vertex(0, 0, 0);
      fill(255, 255, 0, 127);
      vertex(100, 57.735, 173.2);
      fill(0, 255, 255, 127);
      vertex(100, 173.2, 0);
      endShape();
      scale(1);
    }
    if (shape == "icosahedron") {
      ico.create();
    }
    popMatrix();
  }
}