class Agent {

  int num; 
  float[]phase; 
  float[]freq;  
  float[]amp;   

  PVector start;  
  float angle;   
  float axis_len;  
  float gasoline=0;  



  boolean longTail=false; 
  
  boolean prev_loc_is_white=true;  

  Agent() {
    num=int(random(10, 20));
    phase=new float[num];
    freq=new float[num];
    amp=new float[num];

    for (int i=0; i<num; i++) {  
      phase[i]=random(1000);
      freq[i]=random(0.0, 0.08);
      amp[i]=random(6, 12);
    }


    start=new PVector(random(width), random(height));
    angle=random(TWO_PI);
    axis_len=random(width/8, width*1.414);


    if (random(1)<0.10) {
      longTail=true;
    }
  }


  float get_wave_value(float xpos) {  
    float y=0;
    for (int i=0; i<num; i++) {
      y+=sin(phase[i]+xpos*freq[i])*amp[i];
    }
    return y;
  }
  
  PVector get_global_loc(float x, float y) { 
    float gx=start.x+cos(angle)*x;
    float gy=start.y+sin(angle)*x;

    gx+=cos(angle-PI/2)*y;
    gy+=sin(angle-PI/2)*y;

    return new PVector(gx, gy);
  }


  void drawFullShape() { 

    PVector loc=get_global_loc(0, get_wave_value(0));  
    PVector prev=loc.copy();   

    for (float i=1; i<axis_len; i++) {  

      loc=get_global_loc(i, get_wave_value(i));

      if (loc.x<0 || loc.x>width || loc.y<0 || loc.y>height) { 
        break;
      }

      float bright=brightness(img.get(int(loc.x), int(loc.y))); 

      if (bright==0) {
        if (prev_loc_is_white)gasoline+=50;
        gasoline+=dist(prev.x, prev.y, loc.x, loc.y)*1.; 
      } else {

        if (gasoline>10 && !longTail) { 
          gasoline*=0.6;
        }
        gasoline-=1*(dist(prev.x, prev.y, loc.x, loc.y));  
        gasoline=max(0, gasoline); 
      }

      if (gasoline>0) {  
        float wt=sqrt(gasoline)*0.06; 
        strokeWeight(wt);
        stroke(40);
        line(prev.x, prev.y, loc.x, loc.y);
      }

      if (bright==0) {    
        prev_loc_is_white=false;
      } else {
        prev_loc_is_white=true;
      }

      prev=loc.copy();
    }
  }

  
}
