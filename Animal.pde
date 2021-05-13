class Animal {
  // ADJUSTABLE VARIABLES
  float minDistance = 20;
  float maxDistance = 40;

  PVector pos;
  float newX, newY, w, h;
  float angle;
  float dis;
  boolean moved = true;
  float islandTimer;
  float lifespan = 250;
  boolean overWater;
  Island homeIsland = null;

  Animal (float x, float y, float d) {
    pos = new PVector(x, y);
    this.w = d;
    this.h = d;
  }

  void update() {
    if (homeIsland == null) {
      for (Island i : islands) {
        float d = dist(pos.x, pos.y, i.pos.x, i.pos.y);
        if (d + 2 < (w / 2) + (i.w / 2) + minDistance) {
          islandTimer++;
        } else if (pos.y <= height - 50) {
          overWater = true;
        }

        if (islandTimer == 20 /* ADJUST THIS VALUE*/ && homeIsland == null) {
          islandTimer = 0;
          homeIsland = i;
        }
      }
    }

    if (homeIsland == null) {
      if (moved) {
        angle = random(360);
        dis = random(minDistance, maxDistance);

        newX = pos.x + dis * cos(angle);
        newY = pos.y + dis * sin(angle);

        newX = constrain(newX, 0 + 5, 900 - 5);
        newY = constrain(newY, 0 + 5, height - 5);
      }

      pos.x = lerp(pos.x, newX, 0.1);
      pos.y = lerp(pos.y, newY, 0.1);

      if (pos.x > newX - 1 && pos.x < newX + 1 && pos.y > newY - 1 && pos.y < newY + 1) {
        moved = true;
      } else {
        moved = false;
      }
    } else {
      if (moved) {
        angle = random(360);
        dis = random(minDistance, maxDistance);

        newX = pos.x + dis * cos(angle);
        newY = pos.y + dis * sin(angle);

        newX = constrain(newX, homeIsland.pos.x - (homeIsland.w/2), homeIsland.pos.x + (homeIsland.w / 2));
        newY = constrain(newY, homeIsland.pos.y - (homeIsland.w/2), homeIsland.pos.y + (homeIsland.w / 2));
      }

      pos.x = lerp(pos.x, newX, 0.1);
      pos.y = lerp(pos.y, newY, 0.1);

      if (pos.x > newX - 1 && pos.x < newX + 1 && pos.y > newY - 1 && pos.y < newY + 1) {
        moved = true;
      } else {
        moved = false;
      }
    }

    if (frameCount % 20 == 0) {
    // TODO: WHAT IS GOING ON HERE
      //if (homeIsland != null) {
      //  if (random(1) * homeIsland.w < 5) {
      //    lifespan = 0;
      //  }
      //}
      
      if (homeIsland != null) {
        int maxBirdsOnIsland = (int)map((int)homeIsland.w, 50, 177, 5, 25);
        if (maxBirdsOnIsland < GetAllAnimalsOnIsland(homeIsland)) {
          if (random(1) < 0.5) lifespan = 0;
        }
      }

      if (!overWater) {
        lifespan -= 1;
      } else {
        lifespan -= 1.1;
      }
    }

    if (lifespan <= 0) {
      die();
    }
  }
  
  int GetAllAnimalsOnIsland(Island island) {
    int result = 0;
    for (Animal a : animals) {
      if (a.homeIsland == island) result++;
      else continue;
    }
    
    return result;
  }
  
  void die() {
    render(color(228, 22, 1));
    animals.remove(this); 
  }

  void render(color c) {
    noStroke();
    fill(c);
    ellipse(pos.x, pos.y, w, h);
  }
}
