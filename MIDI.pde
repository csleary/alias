void noteOn(int channel, int pitch, int velocity) { // Note On actions
  if (pitch == 24) {
    menu = 1;
  } 
  if (pitch == 25) {
    menu = 2;
  } 
  if (pitch == 26) {
    menu = 3;
  } 
  if (pitch == 27) {
  } 
  if (pitch == 28) {
  } 
  if (pitch == 29) {
  } 
  if (pitch == 30) {
  } 
  if (pitch == 31) {
  } 
  if (pitch == 32) {
  } 
  if (pitch == 33) {
  } 
  if (pitch == 34) {
  } 
  if (pitch == 35) {
  } 
  if (pitch == 36) { // C1
    sphereOn = true;
    sphereStroke = color(255, 0, 0, 255);
    sphereFill = color(255, 0, 0, 127); // Change element colours depending on MIDI note.
    sphereSize = 160;
  } 
  if (pitch == 37) { 
    sphereStroke = color(255, 0, 255, 255);
    sphereFill = color(255, 0, 255, 127);
    sphereSize = 145;
  }
  if (pitch == 38) {
    sphereStroke = color(0, 0, 255, 255);
    sphereFill = color(0, 0, 255, 127);
    sphereSize = 145;
  }
  if (pitch == 39) {
    sphereStroke = color(255, 255, 0, 255);
    sphereFill = color(255, 255, 0, 127);
    sphereSize = 160;
    explode = true;
    explodeAlpha = 192;
    radius = 320;
    explodeGreen = 255;
  }
  if (pitch == 40) {
    diamondLeftOn = true;
    ampDiamondLeft = width/2;
  }
  if (pitch == 41) {
    diamondRightOn = true;
    ampDiamondRight = width/2;
  }
  if (pitch == 42) {
    sphereVar = true;
    superSphereTotal = 3;
    sphereSize = 130;
    sphereStroke = color(0, 255, 255, 255);
    sphereFill = color(0, 255, 255, 127);
    spinMult = 5;
  }
  if (pitch == 43) {
    sphereVar = true;
    superSphereTotal = 5;
    sphereSize = 130;
    sphereStroke = color(0, 255, 255, 255);
    sphereFill = color(0, 255, 255, 127);
    spinMult = 4;
  }
  if (pitch == 44) {
    sphereVar = true;
    superSphereTotal = 7;
    sphereSize = 130;
    sphereStroke = color(0, 255, 255, 255);
    sphereFill = color(0, 255, 255, 127);
    spinMult = 3;
  }
  if (pitch == 45) {
    sphereVar = true;
    superSphereTotal = 9;
    sphereSize = 130;
    sphereStroke = color(0, 255, 255, 255);
    sphereFill = color(0, 255, 255, 127);
    spinMult = 2;
  }
  if (pitch == 46) {
    sphereVar = false;
    spinMult = 1;
  }
  if (pitch == 47) {
    vibrate = true;
    damp = 10;
  }
  if (pitch == 48) { // C2
    gridAmp = 250; // Default to 200, -200. Controls grid topography.
  }
  if (pitch == 49) {
    gridStroke = color(255, 255, 0, 255);
    gridFill = color(255, 255, 0, 127);
  }
  if (pitch == 50) {
    gridPulse = true;
  }
  if (pitch == 51) {
    gridStroke = color(255, 0, 0, 255);
    gridFill = color(0, 127);
  }
  if (pitch == 52) {
    gridStroke = color(0, 255, 0, 255);
    gridFill = color(0, 127);
  }
  if (pitch == 53) {
    gridStroke = color(0, 0, 255, 255);
    gridFill = color(0, 127);
  }
  if (pitch == 54) {
    gridSpin = true; // Camera down.
    spinXspeed = 0.01;
  }
  if (pitch == 55) {    
    spinX = 0; // Reset camera.
    spinY = 0;
  }
  if (pitch == 56) { // Camera up.
    gridSpin = true;
    spinXspeed = -0.01;
  }
  if (pitch == 57) {
    spinX = random(TWO_PI); // Random camera angle.
  }
  if (pitch == 58) {
    spinY = random(TWO_PI);
  }
  if (pitch == 59) {
    spinX = QUARTER_PI * 0.5;
  }
  if (pitch == 60) { // C3
    if (satGroup1) satGroup1 = false;
    else satGroup1 = true;
  }
  if (pitch == 61) {
    satGroup2 = true;
  }
  if (pitch == 62) {
  }
  if (pitch == 63) {
  }
  if (pitch == 64) {
  }
  if (pitch == 65) {
  }
  if (pitch == 66) {
  }
  if (pitch == 67) {
  }
  if (pitch == 68) {
  }
  if (pitch == 69) {
    globalFade = false;
  }
  if (pitch == 70) {
    globalFade = true;
  }
  if (pitch == 71) {
    shake = true;
  }
  if (pitch == 72) { // C4
    blendModeAdd = false;
  }
  if (pitch == 73) {
    blendModeAdd = true;
  }
  if (pitch == 74) {
    testFade = true;
  }
  if (pitch == 75) {
    cubeFlash = true;
  }
  if (pitch == 76) {
  }
  if (pitch == 77) {
    morphSpin = 0; // Reset spin morphing.
  }
  if (pitch == 78) {
    if (morphRate > 0) morphRate = 0; // Start morph.
    else morphRate = 0.0002;
  }
  if (pitch == 79) {
    revMorph = true; // 'Rewind' morph.
  }
  if (pitch == 80) {
    coreSize = height/6;
    gCore = 255;
  }
  if (pitch == 81) {
  }
  if (pitch == 82) {
  }
  if (pitch == 83) {
  }
  if (pitch == 84) {
  }
}
void noteOff(int channel, int pitch, int velocity) { // Note off actions.
  if (pitch == 36) { // C1
  }
  if (pitch == 37) {
  }
  if (pitch == 38) {
  }
  if (pitch == 39) {
    sphereStroke = color(255, 0, 0, 255);
    sphereFill = color(255, 0, 0, 127);
  }
  if (pitch == 40) {
  }
  if (pitch == 42) {
  }
  if (pitch == 43) {
  }
  if (pitch == 44) {
  }
  if (pitch == 45) {
  }
  if (pitch == 46) {
  }
  if (pitch == 47) {
  }
  if (pitch == 48) { // C2
  }
  if (pitch == 49) {
    gridStroke = color(0, 255, 0, 255);
    gridFill = color(0, 127);
  }
  if (pitch == 50) {
    gridPulse = false;
    gridStroke = color(0, 255, 0, 255);
    gridFill = color(0, 127);
  }
  if (pitch == 51) {
  }
  if (pitch == 52) {
  }
  if (pitch == 53) {
  }
  if (pitch == 54) {
    gridSpin = false;
  }
  if (pitch == 55) {
  }
  if (pitch == 56) {
    gridSpin = false;
  }
  if (pitch == 57) {
  }
  if (pitch == 58) {
  }
  if (pitch == 59) {
  }
  if (pitch == 60) { // C3
  }
  if (pitch == 61) {
    satGroup2 = false;
  }
  if (pitch == 62) {
  }
  if (pitch == 63) {
  }
  if (pitch == 64) {
  }
  if (pitch == 65) {
  }
  if (pitch == 66) {
  }
  if (pitch == 67) {
  }
  if (pitch == 68) {
  }
  if (pitch == 69) {
  }
  if (pitch == 70) {
  }
  if (pitch == 71) {
    shake = false;
    shakeX = 0;
    shakeY = 0;
  }
  if (pitch == 72) { // C4
  }
  if (pitch == 73) {
  }
  if (pitch == 74) {
    testFade = false;
  }
  if (pitch == 75) {
    cubeFlash = false;
  }
  if (pitch == 76) {
  }
  if (pitch == 77) {
  }
  if (pitch == 78) {
  }
  if (pitch == 79) {
    revMorph = false; // 'Rewind' morph.
  }
  if (pitch == 80) {
  }
  if (pitch == 81) {
  }
  if (pitch == 82) {
  }
  if (pitch == 83) {
  }
  if (pitch == 84) {
  }
}            