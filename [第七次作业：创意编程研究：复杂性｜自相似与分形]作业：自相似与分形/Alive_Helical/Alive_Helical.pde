int frames = 20;
int framesToSave = 0;
PGraphics pg[] = new PGraphics[frames];

Button bt;
int total=10;
int expanding=0;


ArrayList<PVector> path;
float ang = 0;
int ex = 40;

rolling start;
rolling end;

void setup() {
  size(1200, 1000);
  background(0);
  bt =new Button(600, 500);
  path = new ArrayList<PVector>();
  start = new rolling(width/2, height/2, width/4, 0);
  rolling next = start;
  for (int i = 0; i < 10; i++) {
    next = next.addChild();
  }
  end = next;
  smooth();
}

void draw() {
  frameRate(120);
  bt.update();
  bt.display();
  if (expanding==1) {
    bt.extend();
  }
  if (expanding==2) {

    for (int i = 0; i < ex; i++) {
      rolling next = start;
      while (next != null) {
        next.update();
        next = next.child;
      }
      stroke(m%255, 200, 255);
      path.add(new PVector(end.x, end.y));
    }

    rolling next =start;
    while (next != null) {
      next.show();
      next = next.child;
    }

    beginShape();
    noFill();
    for (PVector pos : path) {
      stroke(m%255, 255, 255);
      vertex(pos.x, pos.y);
    }
    endShape();
    m++;
  }
  if (framesToSave > 0) {
    saveFrame("loop####.gif");
    framesToSave--;
  }
}


void mousePressed() {
  if (dist(mouseX, mouseY, 600, 500)<100) {
    expanding=1;
  }
}

void keyPressed() {
  if (key=='s') {
    framesToSave = frames;
  }
}

class Button {
  float xpos;
  float ypos;
  float diam;
  int n=0;
  float c=8;

  float normalDiam=100;  //普通尺寸
  float bigDiam=120;    //鼠标悬浮时的大尺寸

  float targetDiam=normalDiam;


  Button(float input_x, float input_y) {

    xpos=input_x;
    ypos=input_y;

    diam=normalDiam;
  }

  boolean mouseOn() {  //判断鼠标是否在按钮内
    if (dist(mouseX, mouseY, xpos, ypos)<normalDiam/2) {
      return true;
    } else {
      return false;
    }
  }

  void update() {
    if (mouseOn()) {
      targetDiam=bigDiam;
    } else {
      targetDiam=normalDiam;
    }

    float diamSpeed=(targetDiam-diam)*0.2;
    diam+=diamSpeed;
  }

  void display() {
    if (mouseOn()) {
      fill(0);
      ellipse(600, 500, 120, 120);
      noStroke();
      fill(120, 190, 240);
      ellipse(xpos, ypos, diam, diam);
    } else {
      fill(0);
      ellipse(600, 500, 120, 120);

      noStroke();
      fill(120, 190, 240, 127);
      ellipse(xpos, ypos, diam, diam);
    }
  }

  void extend() {
    frameRate(120);
    if (n<1200) {
      float a=n*radians(137.5);
      float r=c*sqrt(n);
      float xx=r*cos(a)+width/2;
      float yy=r*sin(a)+height/2;

      fill(n * 0.1, 150, 240);
      ellipse(xx, yy, 10, 10);
      n++;
    }
    if (n>1000) {
      expanding=2;
    }
  }
}
