class Flyline {
  Agent[]as;


  Flyline() {
    background(255);
    fill(#eea08c);
    rect(350,100,240,65);
    fill(255);
    textSize(40);
    text("Flyline Mode",358,146);

    img=loadImage("1.jpg");

    img.filter(THRESHOLD, 0.3);
    img.resize(width, height);

    as=new Agent[1400];  //屏幕上有1400个Agent

    for (int i=0; i<as.length; i++) {
      as[i]=new Agent();
    }


    for (int i=0; i<as.length; i++) {
      as[i].drawFullShape();
    }
  }

}
