PFont mine;
int base=-1;
float range=25;
float xpos=50;
int len=150, wid=50;
int r=10;

color []btsc={#158bb8, #f8c387, #553b18, #e3bd8d};
color []txtc={#eea08c, #aa6a4c, #b4a992, #8e804b};
String []btt={"Sand Brush", "Rose Brush", "S-M Brush", "Normal"};
String []stw={"1", "2", "3", "4"};

void setup() {

  background(#fbecde);
  size(1200, 1200);
  colorMode(HSB);
  mine=createFont("Bell MT", 8);
}

void draw() {
  float xpos=50;
  float ypos=50;
  float xpos_e=240;
  float ypos_e=1000;
  for (int i=0; i<4; i++) {
    textSize(28);
    noStroke();
    fill(btsc[i]);
    rect(xpos, ypos, len, wid);
    ellipse((i+1)*xpos_e, ypos_e, 70, 70);
    fill(txtc[i]);
    text(btt[i], xpos+12, ypos+30);
    text(stw[i], (i+1)*xpos_e, ypos_e);
    ypos+=70;
  }
  //通过控制变量大小对画笔的形态进行控制
  if (base==0) {
    sand();
    fill(#158bb8);
    textSize(30);
    text("Spray your imagination with sand", 400, 50);
  }
  if (base==1) {
    fill(#158bb8);
    textSize(30);
    text("Viewing The Blossom of Rose", 400, 50);
    if (mousePressed) {
      rose();
      frameRate(7);//控制玫瑰显示速率
    } else {
      frameRate(60);
    }
  }
  if (base==2) {
    fill(#158bb8);
    textSize(30);
    text("Symmetry & Rotating", 400, 50);//使用提示文本
    if (mousePressed) {
      frameRate(9);
      Rolling();
    } else {
      frameRate(60);
    }
  }
  if (base==3) {
    if (mousePressed) {
      brush();
    }
  }
}

void sand() {//模拟沙砾洒落的形态
  if (mousePressed && mouseButton==LEFT) {
    float xpos;
    float ypos;

    for (int i=0; i<600; i++) {
      xpos=randomGaussian() * range;
      ypos=randomGaussian() * range;

      if (random(1)<.2) {
        stroke(#553b18);
      } else {
        stroke(#DBD99D);
      }
      point(mouseX+xpos, mouseY+ypos);
    }
  }
}

void rose() {//通过随机旋转生成复杂如同玫瑰绽放的形态
  float n=random(6, 20);
  float d=random(50, 100);
  float rad=map(mouseX, 0, width, 30, 90);
  pushMatrix();
  translate(mouseX, mouseY);
  strokeWeight(1);
  noFill();
  stroke(#F7A34D);
  beginShape();//进行玫瑰形态的绘制
  for (float i = 0; i < TWO_PI; i+= (TWO_PI / 60)) {
    float k = i * d;
    float r = rad * sin(n*k);
    float x = r * cos(k);
    float y = r * sin(k);
    vertex(x, y);
  }
  endShape();
  popMatrix();
}

void  brush() {
  if (mousePressed) {
    stroke(0);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}

void Rolling() {//通过气泡与画笔的结合进行艺术创作
  float i =PI/180;
  float scale=1;
  for (int n=0; n<4; n++) {
    pushMatrix();
    translate(mouseX-90*(-1)^n, mouseY+90*(-1)^n);
    rotate(i);
    scale(scale);
    noFill();
    stroke(#5e7987);
    ellipse(30, 30, r, r );
    popMatrix();
    i++;
    scale+=0.2;
  }
}
void keyPressed() {
  if (key=='s') {
    save("work_"+base+".jpg");
  }
}
void mousePressed() {
  for (int i=0; i<4; i++) {//对画笔进行控制
    if (mouseX<200 && mouseX>50 && mouseY<100+70*i && mouseY>50+70*i) {
      background(#fbecde);
      base=i;
    }
  }
  for (int m=1; m<5; m++) {//对笔触的大小以及填充的大小进行控制
    if (mouseX<240*m+35 && mouseX>240*m-35 && mouseY<1035 && mouseY>965) {
      strokeWeight(2*m);
      range+=2*m;
      r+=m*10;
    }
  }
}
