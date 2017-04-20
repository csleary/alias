import themidibus.*;

// MIDI
MidiBus Loopback;

// Explosion
int explodeAlpha, explodeGreen, radius;
boolean explode;

// Text
PFont font;

// GUI
int alpha, menu = 1;
boolean blendModeAdd, cubeFlash, testFade, grid, globalFade;

void setup() {
  //size(1280, 720, P3D); // Use if 'fullScreen' is disabled.
  fullScreen(P3D, 2); // Use fullScreen(2); for secondary display.
  noCursor(); // Disable cursor when full screen.
  // pixelDensity(2); // For Mac Retina.
  smooth(8);
  frameRate(60);
  cols = (w / scl) + 1;
  rows = (h / scl) + 1;
  terrain = new float[cols][rows];
  Loopback = new MidiBus(this, "IAC Bus 1", -1);
  font = createFont("Roboto-Medium.ttf", 32, true);
  neLogoFont = createFont("Roboto-Bold.ttf", 224, true);
  textFont(neLogoFont);
  textFont(font);
  superSphere = new PVector[superSphereTotal+1][superSphereTotal+1];
  superShape = new PVector[total+1][total+1];
  sat1 = new Satellite(0, "icosahedron");
  sat2 = new Satellite(120, "icosahedron");
  sat3 = new Satellite(240, "icosahedron");
  sat4 = new Satellite(60, "pyramid");
  sat5 = new Satellite(180, "pyramid");
  sat6 = new Satellite(300, "pyramid");
  ico = new Icosahedron(75);
  strokeWeight(2);
}

void draw() {
  if (globalFade) {
    noStroke();
    fill(0, 10);
    rect(0, 0, width, height);
    hint(DISABLE_DEPTH_TEST);
  } else {
    background(0);
    hint(ENABLE_DEPTH_TEST);
  }
  ambientLight(128, 128, 128);
  directionalLight(255, 255, 255, 1, 0, -1);
  lightFalloff(1, 0, 0);
  lightSpecular(0, 0, 0);
  if (blendModeAdd) blendMode(ADD);
  else blendMode(BLEND);
  pushMatrix();
  vibrations();

  switch(menu) {
  case 1:
    grid();
    if (diamondLeftOn) diamondLeft();
    if (diamondRightOn) diamondRight();
    if (sphereOn) {
      mySphere();
      if (explode) {
        hint(DISABLE_DEPTH_MASK);
        explode();
        hint(ENABLE_DEPTH_MASK);
      }
    }
    sat1.move();
    if (satGroup1) {
      sat1.display();
      sat2.display();
      sat3.display();
    }
    if (satGroup2) {
      sat4.display();
      sat5.display();
      sat6.display();
    }
    break;
  case 2:
    sShape();
    break;
  case 3:
    northernElectric();
    break;
  }

  popMatrix();
  hint(DISABLE_DEPTH_TEST); // Draw the GUI layer in 2D.
  blendMode(BLEND);
  cubeFlash();
  testFade();
  guiText();
  surface.setTitle(int(frameRate) + " fps"); // show fps counter in title bar
}

void cubeFlash() {
  if (cubeFlash) {
    stroke(255, 0, 0, 255);
    fill(255, 0, 0, 127);
    rect(100, height - 200, 100, 100);
  }
}

void testFade() {
  if (testFade) alpha = 255;
  stroke(255, 255, 0, alpha);
  fill(255, 255, 0, (alpha * 0.5));
  rect(200, height - 200, 100, 100);
  if (alpha > 0) alpha -= 3;
}

void guiText() {
  textFont(font);
  //fill(sin(frameCount * 0.05) * 63 + 128);
  //text("ochremusic.com", 30, 50); // Could have track names show.
  translate(width, height);
  noStroke();
  fill(0, 127);
  rect(-235, -40, 235, 40);
  fill(255, 95);
  text("OCHRE | ALIAS", -225, -10);
}

void vibrations() {
  if (vibrate) {
    translate(0, (sin(frameCount * 4) * damp));
    damp *= 0.93;
  }
}
