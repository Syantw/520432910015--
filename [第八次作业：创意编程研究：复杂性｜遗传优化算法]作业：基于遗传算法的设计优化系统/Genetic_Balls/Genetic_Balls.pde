ArrayList<Mensen> m;

int frames=20;
int framesToSave = 0;
PGraphics pg[] = new PGraphics[frames];

int idTeller = 10;
int population = 40;
float startX;
float startY;



void setup () {
  size(500, 500);
  m = new ArrayList<Mensen>();
  for (int i = 0; i < population; i++) {
    m.add(new Mensen(startX, startY, false));
  }
}

void draw () {
  background(0);
  for (int i = 0; i < m.size(); i ++) {
    Mensen p = m.get(i);
    p.kleuren();
    p.display();
    p.move();
    p.detect();
  }
  if (framesToSave > 0) {
    saveFrame("loop####.gif");
    framesToSave--;
  }
}


void mousePressed() {
  for (int i = 0; i < m.size(); i ++) {
    Mensen p = m.get(i);
    p.alter();
  }
}

void keyPressed() {
  if (key=='s') {
    framesToSave = frames;
  }
}
