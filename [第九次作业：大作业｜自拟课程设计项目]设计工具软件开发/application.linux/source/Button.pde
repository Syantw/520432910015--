class Button {
  float xpos;
  float ypos;
  float diam;
  int n=0;
  float c=8;

  float normalDiam=120;  //普通尺寸
  float bigDiam=140;    //鼠标悬浮时的大尺寸

  float targetDiam=normalDiam;


  Button(float input_x, float input_y) {

    xpos=input_x;
    ypos=input_y;

    diam=normalDiam;
  }

  boolean mouseOn() {  //判断鼠标是否在按钮内
    if (dist(mouseX, mouseY, xpos, ypos)<normalDiam/2) {
      return true;
    } else {
      return false;
    }
  }

  void update() {
    if (mouseOn()) {
      targetDiam=bigDiam;
    } else {
      targetDiam=normalDiam;
    }

    float diamSpeed=(targetDiam-diam)*0.2;
    diam+=diamSpeed;
  }

  void display() {
    if (mouseOn()) {
      fill(120, 190, 240);
      ellipse(xpos, ypos, diam, diam);
    } else {
      noStroke();
      fill(#f9f1db);
      ellipse(xpos, ypos, diam+20, diam+20);
      fill(120, 190, 240, 127);
      ellipse(xpos, ypos, diam, diam);
      frameRate=20;
      diam+=random(-3, 3);
    }
  }
}
