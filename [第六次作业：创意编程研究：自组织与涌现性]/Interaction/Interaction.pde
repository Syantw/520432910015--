PFont mine;
int num=16;

float []xpos;
float []ypos;
float []xspd;
float []yspd;
int r=20;
int base=2;
float easing=0.02;
float amount=20, count;
float n=1;


void setup() {
  mine=createFont("bell MT", 8);
  size(1200, 1000);
  colorMode(HSB);
  fullScreen();

  xpos=new float[num];
  ypos=new float[num];
  xspd=new float[num];
  yspd=new float[num];

  for (int i=0; i<num; i++) {
    xpos[i]=width/2;
    ypos[i]=height/2;
    float angle=random(TWO_PI);
    float vel=random(4, 8);

    xspd[i]=cos(angle)*vel;
    yspd[i]=sin(angle)*vel;
  }
}

void explosion() {
  fill(140, 110, 80);
  rect(0, 0, width, height);
  for (int i=0; i<num; i++) {
    xpos[i]+=xspd[i];
    ypos[i]+=yspd[i];
    if (xpos[i]>width-r/2||xpos[i]<r/2) {
      xspd[i]*=-1;
    }
    if (ypos[i]>height-r/2||ypos[i]<r/2) {
      yspd[i]*=-1;
    }
    fill(int(map(xpos[i], 0, width, 0, 160)), int(map(ypos[i], 0, height, 100, 220)), 200);
    noStroke();
    ellipse(xpos[i], ypos[i], 2*r, 2*r);
  }
}


void pixel() {
  loadPixels();
  for (int i=0; i<pixels.length; i++) {
    int x=i%width;
    int y=i/width;

    float accum=0;
    for (int j=0; j<num; j++) {
      float dist=dist(x, y, xpos[j], ypos[j]);
      accum+=5000f/dist;
    }
    pixels[i]=color(accum+50, 40, accum);
  }
  updatePixels();
}


void connection() {
  fill(random(80), 60, 30, 1);
  rect(0, 0, width, height);
  strokeWeight(random(3));
  for (int i=0; i<num; i++) {
    for (int j=i+1; j<num; j++) {
      if (dist(xpos[i], ypos[i], xpos[j], ypos[j])<200) {
        stroke(frameCount%256, 150, 230);
        line(xpos[i], ypos[i], xpos[j], ypos[j]);
      }
    }
  }
}

void Dancing() {
  float E=mouseX;
  float F=mouseY;
  fill(180, 90, 100, 30);
  rect(0, 0, width, height);

  for (int i=0; i<num; i++) {
    xpos[i]+=(E-xpos[i])*easing;
    ypos[i]+=(F-ypos[i])*easing;
  }
}

void rotating() {
  stroke(#1E90FF);

  float maxX = map(mouseX, 0, width, 1, 250);
  translate(width/2, height/2);
  for (int m = 0; m < 360; m+=amount) {
    float x1 = sin(radians(m+count)) * maxX;
    float y1 = cos(radians(m+count)) * maxX;

    float x2 = sin(radians(m+amount-count)) * maxX;
    float y2 = cos(radians(m+amount-count)) * maxX;
    noFill();
    bezier(x1, y1, x1+x2, y1+y2, x2-x1, y2-y1, x2, y2);
    bezier(x1, y1, x1-x2, y1-y2, x2+x1, y2+y1, x2, y2);
    fill(0, 150, 255);
    ellipse(x1, y1, 5, 5);
    ellipse(x2, y2, 5, 5);
  }
  count += 0.5;
}



void draw() {
  explosion();
  noStroke();
  fill(241, 158, 194);
  ellipse(100, 100, 50, 50);

  textSize(30);
  text("Connection Mode", 130, 110);
  fill(255);
  ellipse(100, 250, 50, 50);
  text("Dancing Mode", 130, 260);
  textSize(60);
  text("Press P to excite you", width/2-150, 50);
  text("Press b to save gorgeous moment", width/2-150, height-30);
  if (base==1) {
    pixel();
    if (mousePressed) {
      base=2;
    }
  }
  if (base==0) {
    connection();
  }
  if (base==-1) {
    Dancing();
    textSize(30);
    fill(210);
    text("Try Pressing S", mouseX+30, mouseY+20);
  }
  if (base==-2) {
    fill(0);
    rect(-1, -1, width+1, height+1);
    rotating();
    if (mousePressed) {
      base=2;
    }
  }
}




void keyPressed() {
  if (key=='p') {
    base=1;
  }
  if (key=='s') {
    base=-2;
  }
  if (key=='b') {
    save("moment"+n+".jpg");
    n+=1;
  }
}

void mousePressed() {
  if (mouseX<150 && mouseX>50 && mouseY<150 && mouseY>50) {
    base=0;
  } else if (mouseX<150 && mouseX>50 && mouseY<300 && mouseY>200) {
    base=-1;
  }
}
