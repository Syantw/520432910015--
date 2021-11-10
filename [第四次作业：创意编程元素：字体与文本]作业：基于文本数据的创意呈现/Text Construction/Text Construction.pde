PFont mine;
String txt;
int index=0;
int n=0;
float c=20;
float gravity=9.8;
int m=3;//n扩大的距离
int i=20;//字体加大的速率
int j=1;//index增加的速率
float xx, yy;
boolean playing=true;


void setup() {
  float x;
  size(1200, 1200);
  background(0);
  
  mine=createFont("Bell MT.tss", 20);
  textFont(mine);

  String[]lines=loadStrings("2.txt");

  txt="";
  for (int i=0; i<lines.length; i++) {
    txt+=lines[i];
  }
  txt=trim(txt);
}

void drawellipse() {
  if (n<2000) {
    float a=n*radians(137.5);
    float r=c*sqrt(n);
    float xx=r*cos(a)+width/2;
    float yy=r*sin(a)+height/2;

    index+=j;
    if (index==txt.length()) {
      index=0;
    }

    fill(255,255,255);
    textSize(i);
    text(txt.charAt(index), xx, yy);

    n+=m;
  }
}


void mousePressed() {
  playing=!playing;
  if (playing) {
    loop();
  } else {
    noLoop();
  }
}



void keyPressed() {
  if (key==' ') {
    saveFrame(""+frameCount+".jpg");
  }
  if (key=='r') {
    fill(0);
    rect(0,0,width,height);
    n=0;
  }
  if (key=='b') {
    fill(0, 0, 0);
    rect(0, 0, width, height);
    i+=5;
    textSize(i);
  }
}

void draw() {
  fill(frameCount%2,157,255,2);
  rect(0,0,width,height);
  drawellipse();
}
