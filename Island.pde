class Island {
  PVector pos = new PVector();
  float w, h;
  color c;
  int individuals = 0;

  Island(float x, float y, float d, color c) {
    pos.x = x;
    pos.y = y;
    this.w = d;
    this.h = d;
    this.c = c;
  }

  void changeSize(float d) {
    if (!Float.isNaN(d)) {
      w = d;
      h = d;
    }
  }

  void changeDistance(float y) {
    if (!Float.isNaN(y)) {
      pos.y = height - y;
    }
  }

  void reset() {
    pos.y = 500 / 2 - 25;
    w = 100;
    h = 100;
  }

  void render() {
    w = constrain(w, 1, 177);
    h = constrain(h, 1, 177);

    noStroke();
    fill(c);
    ellipse(pos.x, pos.y, w, h);
  }
}
