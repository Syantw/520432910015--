class Shake {
  Agentwo[]Ats;

  PImage img;

  Shake() {
    img=loadImage("1.jpg");
    img.resize(width, height);

    int num=0;
    for (int x=0; x<width; x+=6) {  //数数一共需要多少个点
      for (int y=0; y<height; y+=6) {
        if (brightness(img.get(x, y))<100) {
          num++;
        }
      }
    }

    Ats=new Agentwo[num];  //用刚才的计数num来初始化数组
    int index=0;
    for (int x=0; x<width; x+=6) {  //把符合条件的点挨个放入数组
      for (int y=0; y<height; y+=6) {
        if (brightness(img.get(x, y))<100) {
          Ats[index]=new Agentwo(x, y);
          index++;
        }
      }
    }
  }

  void display() {
    frameRate(60);
    fill(255);
    rect(0,0,width,height);
    stroke(0);
    strokeWeight(4);
    fill(#d85916);
    textSize(38);
    text("Dancing Mode", 400, 53);

    PVector predator = new PVector(mouseX, mouseY);  //鼠标就是"猎食者"
    for (int i=0; i<Ats.length; i++) {
      Ats[i].runAway(predator);  //逃离猎食者
      Ats[i].update();
      Ats[i].display();
    }
  }
}



class Agentwo {
  PVector target;
  PVector pos;
  PVector spd;

  PVector acc;

  Agentwo(float x, float y) {
    pos=new PVector(x, y);
    target=pos.copy();

    spd=new PVector(0, 0);
    acc=new PVector(0, 0);
  }

  void runAway(PVector predator) {  //如果和鼠标的距离小于阈值，转身逃跑
    if (PVector.dist(predator, pos)<50) {
      acc=PVector.sub(pos, predator);
      acc.mult(0.3);
      spd.add(acc);
      pos.add(spd);
    }
  }

  void update() {
    acc=PVector.sub(target, pos);
    acc.mult(0.01);
    spd.add(acc);
    pos.add(spd);
    spd.mult(0.97);
  }

  void display() {
    point(pos.x, pos.y);
  }
}
