PFont myFont=createFont("PTMono.ttc", 120);

size(1200, 900);
background(195, 215, 223);


for(int i=0;i<100;i++){
  textFont(myFont);
  textSize(random(70));
  fill(random(50), 90, random(150),70);
  text("你好", random(1200),random(900));
  text("hola",random(1200),random(900));
  text("侬好",random(1200),random(900));
}
save("你好.png");
