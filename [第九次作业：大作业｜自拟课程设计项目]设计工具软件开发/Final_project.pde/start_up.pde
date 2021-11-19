class Start {
  int n=0;
  int index=0;
  float r=200;
  String txt;
  color c=(#d85916);
  int s=80;
  float y_1=60;

  Start() {
    G=createFont("Bell MT", 150);
    textFont(G);

    String[]lines={"Welcome to Visual Park"};
    txt="";
    for (int i=0; i<lines.length; i++) {
      txt+=lines[i];
    }
    txt=trim(txt);
  }

  void display() {
    if (n<100) {
      textSize(40);
      fill(#ea8958);
      text("Enter", 455, height/2+10);
      frameRate(20);
      float a=n*2*PI/txt.length();
      float xx=r*cos(a)+width/2-40;
      float yy=r*sin(a)+height/2;

      fill(#f9f1db, 50);
      rect(0, 0, width, height);
      fill(#d85916);
      textSize(s);
      text(txt.charAt(index), xx, yy);
      index+=1;
      n+=1;
      s+=1;
      r+=5;
      if (index>21) {
        index=0;
      }
    }
    if (y_1<300) {
      fill(#d85916);
      textSize(100);
      text("Welcome to Visual Park", 0, y_1);
      textSize(30);
      text("Filter only refer to Image named jpg",280,800);
      text("You'd better rename Image 1 & drop it in the data file",170,850);
      y_1++;
    }
  }
}
