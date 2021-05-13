public boolean isShiftDown;

public void CreateMainlandShape() {  
  float xOff = 0;
  int index = 0;
  
  for (float x = 0; x <= 900; x += 10) {
     // Calculate a y value acording to noise
     float y = map(noise(xOff, yOff), 0, 1, height - 150, height - 50);
     
     mainlandShapePoints[index] = new PVector(x, y);
     
     xOff += 0.05;
     index++;
  }
  
  yOff += 0.01;
}

float increment = 0.02;

public void DrawWater() {
  // ----- DRAW WATER ----- //
  fill(30, 144, 255);
  rect(0, 0, 900, height);
  
  // ----- NOISE-Y WATER ----- //
  //push();
  
  //colorMode(HSB, 360, 100, 255);
  
  //loadPixels();

  //float xoff = 0.0; // Start xoff at 0
  //noiseDetail(8, 0.3);
  
  //// For every x,y coordinate in a 2D space, calculate a noise value and produce a brightness value
  //for (int x = 0; x < 900; x++) {
  //  xoff += increment;   // Increment xoff 
  //  float yoff = 0.0;   // For every xoff, start yoff at 0
  //  for (int y = 0; y < height; y++) {
  //    yoff += increment; // Increment yoff
      
  //    // Calculate noise and scale by 255
  //    float bright = map(noise(xoff, yoff), 0.0, 1.0, 150.0, 255.0);

  //    // Try using this line instead
  //    //float bright = random(0,255);
      
  //    // Set each pixel onscreen to a grayscale value
  //    pixels[x+y*width] = color(210, 87, bright);
  //  }
  //}
  
  //updatePixels();
  
  //pop();
}

void setFrame() {
  PImage icon = loadImage("icon.png");
  surface.setIcon(icon); 
  
  surface.setTitle("Island Biogeography Sim");
}

void keyPressed() {
  setKey(keyCode, true);
  final int k = keyCode;
  
  // TODO: get actual focused textfield to increment from
    
  if (k == TAB) {
    for(int i = 0; i < textfields.length; i++) {
        if (textfields[i].isFocus() == true) selectedTextbox = i;
        textfields[i].setFocus(false);
    }
      
    if (isShiftDown) {
      selectedTextbox--;
    } else {
      selectedTextbox++;
    }
    
    if (selectedTextbox > textfields.length - 1) selectedTextbox = 0;
    if (selectedTextbox < 0) selectedTextbox = textfields.length - 1;
    
      textfields[selectedTextbox].setFocus(true);
  }
}

void keyReleased() {
 setKey(keyCode, false); 
}

void setKey(int k, boolean bool) {
  if (k == SHIFT) isShiftDown = bool;
}
