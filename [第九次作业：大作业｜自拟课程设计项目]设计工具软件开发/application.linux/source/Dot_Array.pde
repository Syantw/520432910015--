class DotArray {
  PImage pic;
  color as;
  float small_diam=2, big_diam=12;
  float point=0;


  DotArray() {
    pic=loadImage("1.jpg");
    pic.resize(width, height);
    noStroke();
  }

  void display() {
    float threshold=map(mouseX, 0, 1000, 0, 250);  //亮度值高于250的地方，将不显示任何图案

    fill(255);
    rect(0, 0, width, height);

    fill(#73575c);
    ellipse(570, 300, 80, 80);
    fill(#126e82);
    ellipse(430, 300, 80, 80);
    fill(#eea08c);
    ellipse(500, 230, 80, 80);
    rect(385, 10, 225, 50);
    fill(255);
    textSize(28);
    text("Size",480,230);
    text("Blue",415,300);
    text("Red",555,300);
    fill(244);
    textSize(40);
    text("Dot Mode", 400, 53);
    fill(#b598a1, 30);
    ellipse(500, 280, 250, 250);


    for (int x=0; x<width; x+=2) {
      for (int y=0; y<height; y+=10) {
        color c=pic.get(x, y);
        if (brightness(c)<threshold) {
          fill(as, 15);
          float diameter=map(brightness(c), threshold, 0, small_diam, big_diam); //亮度为110的时候，直径为2；亮度为0时直径12。线性映射
          ellipse(x, y, diameter, diameter);
        }
      }
    }
    if (mousePressed) {
      if (dist(mouseX, mouseY, 570, 300)<40) {
        as=#73575c;
      }
      if (dist(mouseX, mouseY, 430, 300)<40) {
        as=#126e82;
      }
      if (dist(mouseX, mouseY, 500, 230)<40) {
        point=1;
      }
    }
    if (point==1) {
      change();
    }
  }

  void change() {
    small_diam=map(mouseX, 400, 600, 2, 10);
    big_diam=map(mouseY, 150, 280, 12, 20);
  }
}
