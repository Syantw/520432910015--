PFont G;
Button bt;
Start stt;
DotArray DA;
DesignTool Dt;
Shake sk;

float Director=0;
float h=140;
int i=0;
int m=0;

PImage img;

int num=40;
float w=20;
color st=0;
float Jud=1;

void setup() {
  smooth();
  size(1000, 1000);
  background(#f9f1db);
  bt =new Button(500, 500);
  stt=new Start();
  DA=new DotArray();
  sk=new Shake();
}

void draw() {
  if (Director==0) {
    bt.update();
    bt.display();
    stt.display();
  }
  if (Director==1) {
    ChoiceMode();
  }
  if (Director==2) {
    DA.display();
    if (mousePressed) {
      if (dist(mouseX, mouseY, 500, 500)<120) {
        ChoiceMode();
      }
    }
  }
  if (Director==3) {
    sk.display();
  }
  if (Director==4) {
    Dt=new DesignTool();
    if (Jud==2) {
      Dt.display();
    } else if (Jud==-1) {
      Dt.C_2();
    } else if (Jud==0) {
      Dt.change();
    }
  }
}




void mousePressed() {
  if (dist(mouseX, mouseY, 500, 500)<120) {
    Director=1;
  } else if (dist(mouseX, mouseY, 175, 175)<35) {
    Director=2;
  } else if (dist(mouseX, mouseY, 175, 455)<35) {
    Director=3;
  } else if (dist(mouseX, mouseY, 175, 725)<35) {
    background(#f9f1db);
    Director=4;
  }
  if (dist(mouseX, mouseY, 200, 800)<70) {
    w=40;
    st=#eea08c;
  } else if (dist(mouseX, mouseY, 400, 800)<70) {
    w=50;
    st=#aa6a4c;
  } else if (dist(mouseX, mouseY, 600, 800)<70) {
    w=100;
    st=#b4a992;
  } else if (dist(mouseX, mouseY, 800, 800)<70) {
    w=150;
    st=#8e804b;
  }
  if (dist(mouseX, mouseY, 900, 200)<25) {
    Jud=2;
  } else if (dist(mouseX, mouseY, 900, 475)<25) {
    Jud=-1;
  } else if (dist(mouseX, mouseY, 890, 700)<35) {
    Jud=0;
  }
}



void keyPressed() {
  if (key==' ') {
    saveFrame(""+frameCount+".jpg");
  }
  if (key=='r') {
    background(255);
  }
}

void ChoiceMode() {//设置软件登入模式选择界面
  fill(#d85916);
  textFont(G);
  textSize(50);
  text("Designing Mode", 335, 70);
  frameRate(10);
  if (i<20) {
    i+=1;
    if (i<10) {
      fill(#f9f1db, 60);
      rect(0, 0, width, height);
    }
    if (i==10) {
      fill(#f9f1db);
      rect(0, 0, width, height);
    }
    if (i>10) {
      if (m<3) {
        fill(#b598a1, 60);
        rect(100, h, 800, 70);
        fill(#b598a1, 80);
        rect(100, h, 150, 70);
        textSize(35);
        fill(#b598a1);
        text("Mode"+0+(m+1), 120, h+40);
        text("Dot Arrays Image Processing", 350, 180);
        text("Dancing Image Processing", 350, 460);
        text("Free Design", 350, 740);
        h+=280;
        m+=1;
      } else {
        h+=0;
        m+=0;
      }
    }
  } else {
    i+=0;
  }
}
