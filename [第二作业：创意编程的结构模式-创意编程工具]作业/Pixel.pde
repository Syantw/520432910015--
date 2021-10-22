float i=PI/180;
float m=0.1;
float a=30;

void setup() {
  size(1200, 1200);
  background(255);
}

void draw() {
  if (mousePressed) {
    pushMatrix();
    translate(600, 600);
    rotate(i);
    scale(m);
    ellipse(30, 30, a, a);
    popMatrix();
    i++;
    m+=0.002;
    if (m>=1.2) {
      i+=1.5;
      m+=0.01;
    }
    if (m>=6) {
      i+=2;
      m+=0.02;
    }
  }
  save("pupu.png");
}
