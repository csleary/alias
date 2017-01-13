PVector[][] superShape;
int total = 40; // Number of points for longitude and latitude.
int coreSize  = 90;
float offset = 0;
float m = 0;
float mchange = 0;

float gCore;
float a = 1;
float b = 1;
float sShapeSpin, morphSpin, morphRate;
boolean revMorph;

float supershape(float theta, float m, float n1, float n2, float n3) {
  float t1 = abs((1/a)*cos(m * theta / 4));
  t1 = pow(t1, n2);
  float t2 = abs((1/b)*sin(m * theta/4));
  t2 = pow(t2, n3);
  float t3 = t1 + t2;
  float r = pow(t3, - 1 / n1);
  return r;
}

void sShape() {
  translate(width/2, height/2, -height/4);
  rotateX(QUARTER_PI);
  rotateZ(radians(sShapeSpin));
  rotateY(radians(sShapeSpin * 0.25));
  sShapeSpin += 0.25;

  fill(255, gCore, 0, 255);
  if (gCore > 0) gCore *= 0.97; // Flash yellow then reduce g to 0, back to red.
  noStroke();
  sphere(coreSize);
  if (coreSize > height/8) coreSize *= 0.99; // Reduce down to stable size.

  m = map(sin(mchange), -1, 1, 0, 15);
  mchange += 0.003;

  float r = height/2;
  for (int i = 0; i < total+1; i++) {
    float lat = map(i, 0, total, -HALF_PI, HALF_PI);
    float r2 = supershape(lat, m, 0.2, 1.7, 1.7);
    //float r2 = supershape(lat, 2, 10, 10, 10);
    for (int j = 0; j < total+1; j++) {
      float lon = map(j, 0, total, -PI, PI);
      float r1 = supershape(lon, m, 0.2, 1.7, 1.7);
      //float r1 = supershape(lon, 8, 60, 100, 30);
      float x = r * r1 * cos(lon) * r2 * cos(lat);
      float y = r * r1 * sin(lon) * r2 * cos(lat);
      float z = r * r2 * sin(lat);
      superShape[i][j] = new PVector(x, y, z);
    }
  }

  colorMode(HSB, 360, 100, 100, 100);
  noStroke();
  //stroke(0, 127);
  //fill(34, 139, 34, 255);
  offset += 0.05;
  for (int i = 0; i < total; i++) {
    float hue = map(i, 0, total, 0, 255 * 4);
    fill(map(sin(hue + offset), 0, 1, 164, 227), 100, 50, 100);
    beginShape(TRIANGLE_STRIP);
    for (int j = 0; j < total+1; j++) {
      PVector v1 = superShape[i][j];
      vertex(v1.x, v1.y, v1.z);
      PVector v2 = superShape[i+1][j];
      vertex(v2.x, v2.y, v2.z);
    }
    endShape();
    rotateX(radians(morphSpin));
    morphSpin += morphRate;
    if (revMorph) {
      if (morphSpin > 0) morphSpin *= 0.9985;
    }
  }
  colorMode(RGB, 255, 255, 255, 255);
}