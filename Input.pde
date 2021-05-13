void Input() {
  // 1
  if (!size1.equals(cp5.get(Textfield.class, "Size 1").getText())) {
    size1 = cp5.get(Textfield.class, "Size 1").getText();
    islands[0].changeSize(constrain(float(size1), 50, 177));
  }
  if (!dist1.equals(cp5.get(Textfield.class, "Dist 1").getText())) {
    dist1 = cp5.get(Textfield.class, "Dist 1").getText();
    islands[0].changeDistance(constrain(float(dist1), 140, 410));
  }

  // 2
  if (!size2.equals(cp5.get(Textfield.class, "Size 2").getText())) {
    size2 = cp5.get(Textfield.class, "Size 2").getText();
    islands[1].changeSize(constrain(float(size2), 50, 177));
  }
  if (!dist2.equals(cp5.get(Textfield.class, "Dist 2").getText())) {
    dist2 = cp5.get(Textfield.class, "Dist 2").getText();
    islands[1].changeDistance(constrain(float(dist2), 140, 410));
  }

  // 3
  if (!size3.equals(cp5.get(Textfield.class, "Size 3").getText())) {
    size3 = cp5.get(Textfield.class, "Size 3").getText();
    islands[2].changeSize(constrain(float(size3), 50, 177));
  }
  if (!dist3.equals(cp5.get(Textfield.class, "Dist 3").getText())) {
    dist3 = cp5.get(Textfield.class, "Dist 3").getText();
    islands[2].changeDistance(constrain(float(dist3), 140, 410));
  }

  // 4
  if (!size4.equals(cp5.get(Textfield.class, "Size 4").getText())) {
    size4 = cp5.get(Textfield.class, "Size 4").getText();
    islands[3].changeSize(constrain(float(size4), 50, 177));
  }
  if (!dist4.equals(cp5.get(Textfield.class, "Dist 4").getText())) {
    dist4 = cp5.get(Textfield.class, "Dist 4").getText();
    islands[3].changeDistance(constrain(float(dist4), 140, 410));
  }

  // Slider
  if (amount != cp5.get(Slider.class, "Individuals\nPer Gen.").getValue()) {
    amount = int(cp5.get(Slider.class, "Individuals\nPer Gen.").getValue());
  }
}

void ConstrainInput() {
  for(int i = 0; i < textfields.length; i++) {
    if (textfields[i].isFocus()) continue;
    String s = textfields[i].getText();
    
    
     
    if ((i & 1) == 0) {
      textfields[i].setText(str((int)constrain(float(s), 0, 100)));
    } else {
      textfields[i].setText(str((int)constrain(float(s), 0, 100)));
    }
  }
}

//void resetInput() {
//  cp5.get(Textfield.class, "Size 1").setText("");
//  cp5.get(Textfield.class, "Dist 1").setText("");
//  cp5.get(Textfield.class, "Size 2").setText("");
//  cp5.get(Textfield.class, "Dist 2").setText("");
//  cp5.get(Textfield.class, "Size 3").setText("");
//  cp5.get(Textfield.class, "Dist 3").setText("");
//  cp5.get(Textfield.class, "Size 4").setText("");
//  cp5.get(Textfield.class, "Dist 4").setText("");
//}
