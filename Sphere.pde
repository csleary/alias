int sphereSize, sphereStroke, sphereFill, spinMult = 1;
float shakeX, shakeY, spinSphereX, spinSphereZ;
boolean shake, sphereOn, sphereVar;

// Supersphere
PVector[][] superSphere;
int superSphereTotal = 20;

void mySphere() {
  translate(0, height * 2/3, 125);
  //sphereDetail(20);
  stroke(sphereStroke);
  fill(sphereFill);

  if (sphereSize > (120)) { // Reduce to stable
    sphereSize *= 0.97;
  }

  rotateZ(radians(spinSphereZ)); // Slowly rotate the sphere
  spinSphereZ += 0.5 * spinMult;
  
  if (shake) { // Activate shaky effect.
    translate(random(10), random(10));
  }
  //sphere(sphereSize); // Draw sphere

  if (superSphereTotal < 20 && !sphereVar) superSphereTotal++;

  int total = superSphereTotal;
  float r = sphereSize;
  for (int i = 0; i < total+1; i++) {
    float lat = map(i, 0, total, 0, PI);
    for (int j = 0; j < total+1; j++) {
      float lon = map(j, 0, total, 0, TWO_PI);
      float x = r * sin(lat) * cos(lon);
      float y = r * sin(lat) * sin(lon);
      float z = r * cos(lat);
      superSphere[i][j] = new PVector(x, y, z);
    }
  }

  for (int i = 0; i < total; i++) {
    //float red = map(i, 0, total, 255, 0);
    //float green = map(i, 0, total, 0, 255);
    //float blue = 0;
    //stroke(red, green, blue, 255);
    //fill(red, green, blue, 127);
    beginShape(TRIANGLE_STRIP);
    for (int j = 0; j < total+1; j++) {
      PVector v1 = superSphere[i][j];
      vertex(v1.x, v1.y, v1.z);
      PVector v2 = superSphere[i+1][j];
      vertex(v2.x, v2.y, v2.z);
    }
    endShape();
  }
}

void explode() {
  noStroke();
  fill(255, explodeGreen, 0, explodeAlpha);
  ellipse(0, 0, radius, radius);
  radius += 50;
  if (explodeAlpha > 0) explodeAlpha -= 5;
  else radius = 0;
  explodeGreen-=4;
}