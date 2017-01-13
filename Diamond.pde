int ampDiamondLeft;
int ampDiamondRight;
boolean diamondLeftOn;
boolean diamondRightOn;

void diamondLeft() {
  float damp = 0.95;
  int hD = 30;
  pushMatrix();
  translate(-width/3, 0, hD * 6);
  rotateY(HALF_PI);
  stroke(0, 0, 255, 255);
  fill(0, 0, 255, 63);
  box(hD, hD, ampDiamondLeft * .25);
  translate(hD, 0);
  box(hD, hD, ampDiamondLeft * .5);
  translate(hD, 0);
  box(hD, hD, ampDiamondLeft);
  translate(hD, 0);
  box(hD, hD, ampDiamondLeft * .5);
  translate(hD, 0);
  box(hD, hD, ampDiamondLeft * .25);
  ampDiamondLeft *= damp;
  if (ampDiamondLeft == 0) diamondLeftOn = false;
  popMatrix();
}

void diamondRight() {
  float damp = 0.95;
  int hD = 30;
  pushMatrix();
  translate(width/3, 0, hD * 6);
  rotateY(HALF_PI);
  stroke(255, 0, 0, 255);
  fill(255, 0, 0, 63);
  box(hD, hD, ampDiamondRight * .25);
  translate(hD, 0);
  box(hD, hD, ampDiamondRight * .5);
  translate(hD, 0);
  box(hD, hD, ampDiamondRight);
  translate(hD, 0);
  box(hD, hD, ampDiamondRight * .5);
  translate(hD, 0);
  box(hD, hD, ampDiamondRight * .25);
  ampDiamondRight *= damp;
  if (ampDiamondRight < 0.1) diamondRightOn = false;
  popMatrix();
}