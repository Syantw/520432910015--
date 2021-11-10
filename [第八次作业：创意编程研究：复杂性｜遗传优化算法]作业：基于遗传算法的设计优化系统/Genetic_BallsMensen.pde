class Mensen {
  float x;
  float y;
  int d = 20;
  float Tempx;
  float Tempy;
  color inter;

  float sx;
  float sy;

  //random stroke
  float randS = random(0, 1);

  float randF = random(0, 1);

  float lifespan = 255;

  float f = random(10, 30);

  //inactive Switch
  int Q = (int)random(0, 4);

  boolean born;
  boolean dead = false;
  boolean newBorn;
  float gravity = random(-1, 1);
  float acceleration = 1;

  float r = 100;
  float g = 100;
  float b = 100;

  color p1;
  color p2;
  color ch;

  int v1 = 0;
  int v2 = 0;
  int v3 = 0;

  int r1 = 200;
  int r2 = 0;
  int r3 = 0;

  int g1 = 0;
  int g2 = 200;
  int g3 = 0;

  int b1 = 0;
  int b2 = 0;
  int b3 = 200;

  int id;


  Mensen (float Tempx, float Tempy, boolean newBorn) {
    id = idTeller;
    idTeller++;
    newBorn = false;
    x = Tempx;
    y = Tempy;
    sx = random(-1, 1);
    sy = random(-1, 1);
    startX = width/2;
    startY = height/2;
  }

  void move() {
    x += sx;
    y += sy;


    if (sx == 0) {
      sx += 0.5;
    }
    if (sy == 0) {
      sy += 0.5;
    }
    if ( x > width-d/2 || x <= 0+d/2) {
      sx *= -1;
    }
    if ( y > height-d/2 || y <= 0+d/2) {
      sy *= -1;
    }
  }

  void detect() {
    for (int i = 0; i < m.size(); i++) {
      Mensen p = m.get(i);
      for (int j = 0; j < m.size()-1; j++) {
        Mensen q = m.get(j);

        //CHECK YO SELF
        if (p.id != q.id) {

          //LOCATIE
          if ( dist(p.x, p.y, q.x, q.y) < p.d ) {

            //GENDER
            if (m.get(i).r > 200 && m.get(j).b > 200 || m.get(j).r > 200 && m.get(i).b > 200) {

              //FITNESS
              if (m.get(i).f > 20 && m.get(j).f > 20 && m.get(j).f < 80 && m.get(i).f < 80) {

                //RESET FITNESS
                f = 0;

                born = true;

                if (born == true) {
                  newBorn = true;

                  Tempx = m.get(i).x;
                  Tempy = m.get(i).y;
                  if (newBorn) {
                    fill(inter);
                    m.add(new Mensen(Tempx, Tempy, true));
                  }
                }
                println(m.size());
              }
            } else {
              born = false;
            }
          }
        }
      }
    }
  }

  void kleuren () {
    //MALE OF FEMALE
    for (int i = 0; i < m.size(); i++) {
      //STROKE
      if (randS <= 0.5) {
        r = 240;
        g = 120;
        b = 180;
        stroke(r, g, b, lifespan);
      } else {
        r = 120;
        g = 160;
        b = 240;
        stroke(r, g, b, lifespan);
      }

      if (randF <= 0.4) {//Blue

        color p1 = color(0, 0, 200);
        fill(p1, lifespan);
      }

      if (randF > 0.4 ) { //RED

        color p2 = color(200, 0, 0);
        fill(p2, lifespan);
      }

      if (newBorn) {
        color inter = lerpColor(p1, p2, 0.5);
        fill(inter);
      }
    }
  }

  void display() {
    // FITNESS INCREASES
    f = f + 0.01;
    for (int i = 0; i < m.size(); i++) {
      if (f > 100) {
        lifespan = lifespan -0.001;
        if (lifespan < 10) {
          dead = true;
        }
      }
      if (dead) {
        m.get(i);
        m.remove(i);//出去死亡的个体
        println(m.size());
      }
    }
    strokeWeight(3);
    ellipse(x, y, d, d);
  }

  void alter() {

    sx += gravity;
    sx -= gravity;
    sy += gravity;
    sy -= gravity;

    if (mouseX > width/2) {
      sx = -1;
      x += sx;

      if (x-d/2 < 0) {
        sx *= -1;
      }
    }
    if (mouseX < width/2) {
      sx = 1;
      x += sx;
      if (x+d/2 > width) {
        sx *= -1;
      }
    }

    if (mouseY > height/2) {
      sy = -1;
      y += sy;

      if (y-d/2 < 0) {
        sy *= -1;
      }
    }

    if (mouseY < height/2) {
      sy = 1;
      y += sy;

      if (y+d/2 > width) {
        sy *= -1;
      }
    }
  }
}
