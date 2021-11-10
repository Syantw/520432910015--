int k = -5;
float m=0;

class rolling {
  float x;
  float y;
  float r;
  int n;
  rolling parent;
  rolling child;
  
  float spd;
  float ang;

  rolling(float x_, float y_, float r_, int n_) {//初始化实例, 更新赋值的发生形式
    this(x_, y_, r_, n_, null);
  }

  rolling(float x_, float y_, float r_, int n_, rolling p) {
    x = x_;
    y = y_;
    r = r_;
    n = n_;
    spd = (radians(pow(k, n-1)))/ex;
    parent = p;
    child = null;
    ang = -PI/2;
  }

  rolling addChild() {
    float newr = r / 3.0;
    float newx = x + r + newr;
    float newy = y;
    child = new rolling(newx, newy, newr, n+1, this);
    return child;
  }

  void update() {
    if (parent != null) {
      ang += spd;
      stroke(120, 190, 240);

      float son_r = r + parent.r;
      x = parent.x + son_r *0.75* cos(ang);
      y = parent.y + son_r *0.75* sin(ang);
      
    }
  }

  void show() {

    strokeWeight(2);
    noFill();
    
    stroke(120, 190, 240);
    ellipse(x, y, r*2, r*2);
  }
}
