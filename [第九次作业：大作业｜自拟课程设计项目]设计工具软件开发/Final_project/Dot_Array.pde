class DotArray {
  PImage pic;
  color as;


  DotArray() {
    pic=loadImage("1.jpg");
    pic.resize(width, height);
    noStroke();
  }

  void display() {
    float threshold=110;  //亮度值高于110的地方，将不显示任何图案

    fill(255);
    rect(0, 0, width, height);

    fill(#73575c);
    ellipse(570, 300, 80, 80);
    fill(#126e82);
    ellipse(430, 300, 80, 80);
    fill(#eea08c);
    ellipse(500, 230, 80, 80);
    rect(385,10,225,50);
    fill(244);
    text("Dot Mode",395,56);
    fill(#b598a1,30);
    ellipse(500,280,250,250);
    

    for (int x=0; x<width; x+=2) {
      for (int y=0; y<height; y+=10) {
        color c=pic.get(x, y);
        if (brightness(c)<threshold) {
          fill(as,15);
          float diameter=map(brightness(c), threshold, 0, 2, 12); //亮度为110的时候，直径为2；亮度为0时直径12。线性映射
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
        as=int(random(255));
      }
    }
  }
}
