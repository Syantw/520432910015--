float xspd = 20;
float yspd = 0;
float gravity=9.8;
float x=0;
float y=0;

void setup(){
  size(1200,800);
  background(77,173,187);
}

void draw(){
   //fill(72,90,29,10);
   //rect(0,0,width,height);
   
   if(x>width){
     x=height;
     xspd=xspd*-0.8;
   }
   if(y>height){
     y=height;
     yspd=yspd*-0.8;
   }
   if(mousePressed){
   x += xspd;
   yspd += gravity;
   y +=  yspd;
   }
   
   fill(59,100,189);
   ellipse(x,y,50,50);
   noStroke();
  
 }
