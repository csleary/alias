int w = 1280, h = 720, cols, rows, scl = 20, gridAmp, gridFill;
int gridStroke = color(0, 255, 0);
float[][] terrain;
float flying, spinX, spinY, spinXspeed, damp;
boolean gridPulse, gridSpin, vibrate;

void grid() {
  // Grid topography and movement
  gridAmp *= 0.99;
  float yoff = flying;
  flying -= 0.05;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, gridAmp, -gridAmp); // Map noise to 2D array.
      xoff += 0.05;
    }
    yoff += 0.05;
  }



  // Grid colours and rotation
  // Move rotation point to centre of plane
  translate(width/2, height/2);
  rotateX(QUARTER_PI); // Angle landscape to begin (might be nice to start without this, perhaps introduce the title and spin after elements).
  rotateX(spinX); // Slowly spin plane
  rotateY(spinY); // Leave for random angle flash.
  if (gridSpin) spinX += spinXspeed;

  // Draw triangle grid
  translate(-w/2, -h/2);
  stroke(gridStroke);
  fill(gridFill);
  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      vertex(x * scl, y * scl, terrain[x][y]);
      vertex(x * scl, (y + 1) * scl, terrain[x][y + 1]);
    }
    endShape();
  }
  if (gridPulse) gridStroke = color((sin(frameCount * 0.3) * 63) + 192, 0, 0, 255); // Sine pulse red, with a depth offset.
  translate(w/2, 0);
}