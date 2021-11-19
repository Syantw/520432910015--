class DesignTool {
  color a;
  color []btsc={#158bb8, #f8c387, #553b18, #e3bd8d};
  color []txtc={#eea08c, #aa6a4c, #b4a992, #8e804b};
  String []stw={"1", "2", "3", "4"};
  DesignTool() {
    float xpos_e=200;
    float ypos_e=800;
    noStroke();
    fill(#eea08c);
    rect(385, 10, 225, 50);
    fill(244);
    textSize(35);
    text("Draw Mode", 395, 56);
    for (int i=0; i<4; i++) {
      textSize(28);
      noStroke();
      fill(btsc[i]);
      ellipse((i+1)*xpos_e, ypos_e, 70, 70);
      fill(txtc[i]);
      text(stw[i], (i+1)*xpos_e, ypos_e);
    }
    noFill();
    stroke(30);
    ellipse(900, 200, 50, 50);
    rect(875, 450, 50, 50);
    rect(860, 675, 50, 50);
    ellipse(900, 700, 50, 50);
  }
  void display() {
    if (mousePressed) {
      frameRate(60);
      noFill();
      stroke(st);
      ellipse(mouseX, mouseY, w, w);
    }
  }
  void change() {
    float n=random(6, 20);
    float d=random(50, 100);
    float rad=map(mouseX, 0, width, 30, 90);
    if (mousePressed) {
      frameRate(5);
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
  }

  void C_2() {
    if (mousePressed) {
      frameRate(60);
      noFill();
      stroke(st);
      rect(mouseX, mouseY, w, w);
    }
  }
}
