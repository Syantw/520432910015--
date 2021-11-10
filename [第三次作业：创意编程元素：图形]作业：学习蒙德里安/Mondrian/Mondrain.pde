int num=6;

int height=1000;
int width=1000;
float rectheight = 0;
float rectwidth = 0;

color []colors;

void setup() {
  size(1000, 1000);
  background(255);
  colors= new color[num];
  for (int i=0; i<num; i++) {
    float co=random(100, 210);
    colors[i]=(int(co));
  }
}

void Mondrian() {
  for (int i = 0; i<height; i+=rectheight+2) {
    rectheight=randomGaussian()*i +height/5;
    for (int m = 0; m<width; m+=rectwidth+2) {
      rectwidth=randomGaussian()*m +width/5;

      color rectcolor=colors[int(random(num))];

      fill(rectcolor);
      strokeWeight(6);
      stroke(0);
      rect(m, i, rectwidth, rectheight);
    }
  }
}

void draw() {
  if (mousePressed &&mouseButton==LEFT) {
    Mondrian();
    save("蒙德里安.png");
  }
}
