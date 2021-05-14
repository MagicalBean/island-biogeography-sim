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
    if (d > 100) return;
    d = map(d, 0, 100, 50, 177);
    if (!Float.isNaN(d)) {
      pos.y += (w - d)/2;
      w = d;
      h = d;
    }
  }

  void changeDistance(float y) {
    y = map(y, 0, 100, 140, 312);
    if (!Float.isNaN(y)) {
      pos.y = height - y - (w / 2);
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
