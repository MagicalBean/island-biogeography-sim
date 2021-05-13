import controlP5.*; //<>// //<>// //<>//
import javax.swing.*;
import javax.swing.plaf.*;
import java.awt.*;

ControlP5 cp5;

ArrayList<Animal> animals = new ArrayList<Animal>();

public int amount = 90, timeStep;
public int spawnCountdown = 0;

public PVector[] mainlandShapePoints = new PVector[91];

Island[] islands = new Island[4];
color[] colors = new color[4];

PFont font;

String size1 = "", dist1 = "", size2 = "", dist2 = "", size3 = "", dist3 = "", size4 = "", dist4 = "";

controlP5.Textfield txtA, txtB, txtC, txtD, txtE, txtF, txtG, txtH;
controlP5.Slider aoiSlider;

public controlP5.Textfield[] textfields = new controlP5.Textfield[8];

public int selectedTextbox = 0;

void setup() {
  setFrame();
   
  // ----- FONTS ----- //
  font = createFont("AvenirNextLTPro-Demi.otf", 2, true);
  textFont(font);
  ControlFont controlFont = new ControlFont(font, 20);
  ControlFont captionFont = new ControlFont(font, 12); 
  
  textSize(18);
  cp5 = new ControlP5(this);
  
  // ----- UI FIELDS ----- //
  txtA = cp5.addTextfield("Size 1").setPosition(900 + 20, 145).setSize(90, 40).setAutoClear(false).setColorValue(color(255)).setColorBackground(color(51)).setColorForeground(color(51)).setColorActive(color(51)).setFont(controlFont).setText("100");
  txtA.getCaptionLabel().setFont(captionFont);
  txtB = cp5.addTextfield("Dist 1").setPosition(900 + 20, 205).setSize(90, 40).setAutoClear(false).setColorValue(color(255)).setColorBackground(color(51)).setColorForeground(color(51)).setColorActive(color(51)).setFont(controlFont).setText(str(height - (500 / 2 - 25)));
  txtB.getCaptionLabel().setFont(captionFont);

  txtC = cp5.addTextfield("Size 2").setPosition(900 + 190, 145).setSize(90, 40).setAutoClear(false).setColorValue(color(255)).setColorBackground(color(51)).setColorForeground(color(51)).setColorActive(color(51)).setFont(controlFont).setText("100");
  txtC.getCaptionLabel().setFont(captionFont);
  txtD = cp5.addTextfield("Dist 2").setPosition(900 + 190, 205).setSize(90, 40).setAutoClear(false).setColorValue(color(255)).setColorBackground(color(51)).setColorForeground(color(51)).setColorActive(color(51)).setFont(controlFont).setText(str(height - (500 / 2 - 25)));
  txtD.getCaptionLabel().setFont(captionFont);

  txtE = cp5.addTextfield("Size 3").setPosition(900 + 20, 315).setSize(90, 40).setAutoClear(false).setColorValue(color(255)).setColorBackground(color(51)).setColorForeground(color(51)).setColorActive(color(51)).setFont(controlFont).setText("100");
  txtE.getCaptionLabel().setFont(captionFont);
  txtF = cp5.addTextfield("Dist 3").setPosition(900 + 20, 375).setSize(90, 40).setAutoClear(false).setColorValue(color(255)).setColorBackground(color(51)).setColorForeground(color(51)).setColorActive(color(51)).setFont(controlFont).setText(str(height - (500 / 2 - 25)));
  txtF.getCaptionLabel().setFont(captionFont);

  txtG = cp5.addTextfield("Size 4").setPosition(900 + 190, 315).setSize(90, 40).setAutoClear(false).setColorValue(color(255)).setColorBackground(color(51)).setColorForeground(color(51)).setColorActive(color(51)).setFont(controlFont).setText("100");
  txtG.getCaptionLabel().setFont(captionFont);
  txtH = cp5.addTextfield("Dist 4").setPosition(900 + 190, 375).setSize(90, 40).setAutoClear(false).setColorValue(color(255)).setColorBackground(color(51)).setColorForeground(color(51)).setColorActive(color(51)).setFont(controlFont).setText(str(height - (500 / 2 - 25)));
  txtH.getCaptionLabel().setFont(captionFont);

  aoiSlider = cp5.addSlider("Individuals\nPer Gen.").setPosition(900 + 15, height - 75).setSize(180, 20).setRange(1, 200).setValue(22).setSliderMode(Slider.FLEXIBLE).setNumberOfTickMarks(200).setColorValue(color(255)).setColorBackground(color(51)).setColorForeground(color(128)).setColorActive(color(128)).setFont(captionFont);
  aoiSlider.getCaptionLabel().setFont(captionFont);
  aoiSlider.getCaptionLabel().getStyle().marginTop = -6;

  cp5.addButton("Reset").setValue(0).setPosition(900 + 45, height - 35).setSize(90, 20).setColorBackground(color(51)).setColorActive(color(51)).setColorForeground(color(81)).setFont(captionFont);
  cp5.addButton("Data").setValue(0).setPosition(900 + 160, height - 35).setSize(90, 20).setColorBackground(color(51)).setColorActive(color(51)).setColorForeground(color(81)).setFont(captionFont);

  textfields[0] = txtA;
  textfields[1] = txtB;
  textfields[2] = txtC;
  textfields[3] = txtD;
  textfields[4] = txtE;
  textfields[5] = txtF;
  textfields[6] = txtG;
  textfields[7] = txtH;

  size(1200, 530);
  fill(30, 144, 255);
  rect(0, 0, 900, 500);

  noStroke();
  fill(124, 252, 0);
  rect(0, height - 50, 900, 50);

  // ----- SPAWN ANIMALS ----- //
  
  for (int i = 0; i < amount; i++) {
    animals.add(new Animal(random(0, 900), random(height - 40, height - 5), 10));
  }

  // ----- SET ISLAND COLORS ----- //
  colors[0] = color(255, 226, 0);
  colors[1] = color(0, 141, 57);
  colors[2] = color(255, 49, 0);
  colors[3] = color(76, 16, 174);

  // ----- CREATE ISLANDS ----- //
  for (int i = 0; i < 4; i++) {
    //float y = (i + 1) * ((width - 175) / 4);
    islands[i] = new Island((i + 1) * 180, 500 / 2 - 25, 100, colors[i]);
  }
  
  CreateMainlandShape();
}

void draw() {
  background(184);
  // TODO: ADJUST VARIABLES TO LIKING

  if (frameCount % 20 == 0) {
    spawnCountdown++;
  }

  if (spawnCountdown == 20) {
    for (int i = 0; i < amount; i++) {
      animals.add(new Animal(random(0, 900), random(height - 40, height - 5), 10));
    }
    spawnCountdown = 0;
  }

  Input();
  ConstrainInput();

  DrawWater();

  DrawMainland();

  stroke(0);
  strokeWeight(4);
  line(900, 0, 900, height);

  for (Island d : islands) {
    d.render();
  }

  for (int i = 0; i < animals.size(); i++) {
    animals.get(i).update();
    animals.get(i).render(255);
  }

  if (frameCount % 20 == 0) {
    timeStep++;
  }

  fill(0);
  textSize(18);
  textAlign(CENTER);
  text("Size range: 50 - 177\nDistance Range: 140 - 410", (900 + width) / 2, 23);

  textAlign(LEFT);  
  textSize(25);
  fill(colors[0]);
  text("Island 1", 900 + 20, 130);

  fill(colors[1]);
  text("Island 2", width - 110, 130);

  fill(colors[2]);
  text("Island 3", 900 + 20, height / 2 + 35);

  fill(colors[3]);
  text("Island 4", width - 110, height / 2 + 35);

  stroke(0);
  strokeWeight(1);
  fill(0);
  line(900, 60, width, 60);

  textSize(18);
  text("Time Steps: " + timeStep, (1200 + 900) / 2 - 70, 90);

  fill(0);
  textSize(15);
  textAlign(LEFT, TOP);
  text("Ben Weisz", 5, 5);
}

float yOff = 0.0;

public void DrawMainland() {
  noStroke();
  fill(124, 252, 0);
  // rect(0, height - 50, 900, 50);
  
  beginShape();
  
  for (int i = 0; i <= mainlandShapePoints.length - 1; i++)
  {  
    vertex(mainlandShapePoints[i].x, mainlandShapePoints[i].y);
  }
  
  vertex(900, height);
  vertex(0, height);
  endShape(CLOSE);
}

public void Reset() {
  timeStep = 0;
  animals.clear();
  //for (Island d : islands) {
  //  d.reset();
  //}
  //resetInput();
}


public void Data() {
  for (Island i : islands) {
    i.individuals = 0;
  }

  for (Animal a : animals) {
    if (a.homeIsland == null) continue;
    else if (a.homeIsland == islands[0]) islands[0].individuals++;
    else if (a.homeIsland == islands[1]) islands[1].individuals++;
    else if (a.homeIsland == islands[2]) islands[2].individuals++;
    else if (a.homeIsland == islands[3]) islands[3].individuals++;
  }
  
  Color backgroundColor = new Color(200, 200, 200);
   
  JPanel panelTitle = new JPanel();
  panelTitle.setLayout(new BoxLayout(panelTitle, BoxLayout.Y_AXIS));
  panelTitle.setBackground(backgroundColor);
  
  JPanel panel = new JPanel(new GridLayout(2, 2));
  panel.setBackground(backgroundColor);

  Font font = new Font("Arial", Font.PLAIN, 16);
  Font boldFont = new Font("Arial", Font.BOLD, 18);
  
  JLabel label = CreateLabel("Amount of Individuals on Each Island", SwingConstants.CENTER, boldFont);
  
  JLabel label2 = CreateLabel("Total Individuals: " + animals.size(), SwingConstants.CENTER, new Font("Arial", Font.PLAIN, 17));

  JLabel label1 = new JLabel(" ");
  label1.setFont(font);
  
  JLabel label3 = CreateLabel("Island 1: " + islands[0].individuals, SwingConstants.CENTER, font);
  label3.setForeground(new Color(colors[0]));
  
  JLabel label4 = CreateLabel("Island 2: " + islands[1].individuals, SwingConstants.CENTER, font);
  label4.setForeground(new Color(colors[1]));
  
  JLabel label5 = CreateLabel("Island 3: " + islands[2].individuals, SwingConstants.CENTER, font);
  label5.setForeground(new Color(colors[2]));
  
  JLabel label6 = CreateLabel("Island 4: " + islands[3].individuals, SwingConstants.CENTER, font);
  label6.setForeground(new Color(colors[3]));
  
  panelTitle.add(label);
  panelTitle.add(label2);
  panelTitle.add(label1);
  
  panel.add(label3);
  panel.add(label4);
  panel.add(label5);
  panel.add(label6);
  JPanel[] panels = {panelTitle, panel};
  
  UIManager.put("OptionPane.background", new ColorUIResource(200, 200, 200));
  UIManager.put("Panel.background", new ColorUIResource(200, 200, 200));

  //JOptionPane.showMessageDialog(null, "     Amount of Individuals on Each Island\n\nIsland 1: " + islands[0].individuals + "\nIsland 2: " + islands[1].individuals + "\nIsland 3: " + islands[2].individuals + "\nIsland 4: " + islands[3].individuals + "\nTotal Amount of Individuals: " + animals.size(), "Data - Individuals on Islands", JOptionPane.PLAIN_MESSAGE);
  JOptionPane.showMessageDialog(null, panels, "Data - Individuals", JOptionPane.PLAIN_MESSAGE);
}

public JLabel CreateLabel(String text, int swingConstant, Font font) {
  JLabel result = new JLabel(text, swingConstant);
  result.setFont(font);
  result.setAlignmentX(Component.CENTER_ALIGNMENT);
  //result.setBackground(backgroundColor);
  //result.setOpaque(true);
  
  return result;
}
