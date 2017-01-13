PFont neLogoFont;
float neSpin;

void northernElectric() {
  ortho();
  pushMatrix();
  translate(width/2, height/2);
  rotateX(asin(1/sqrt(3)));
  rotateX(neSpin);
  rotateY(radians(45));
  rotateY(neSpin);
  neSpin += 0.01;
  stroke(255);
  strokeWeight(3);
  noFill();
  box(400, 400, 400);
  strokeWeight(2);
  popMatrix();
  pushMatrix();
  translate(width/2, height/2);
  textFont(neLogoFont);
  textAlign(CENTER, CENTER);
  fill(255);
  text("N", -63, -104, 0);
  text("E", 70, -104, 0);
  fill(128);
  text("N", -63, 57, 0);
  text("E", 70, 57, 0);
  textAlign(LEFT, LEFT);
  popMatrix();
  perspective();
}