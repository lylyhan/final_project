color a=color(220,30,50);
void setup(){
size(1000,1000,P3D);
background(0);
}

void draw(){
  
  //stroke(255);
  
  //for(int i=0;i<360;i+=10){
  //  pushMatrix();
  //  //translate(i,0,0);
  //  stroke(220,30,10);
  //  //-2~1;1~-2
  //  limb(-2+abs(3*sin(i)),1-abs(3*sin(i)));
  //  //println(frameCount);
  //  //rotateX(i);
  //  popMatrix();
  //}
  //stroke(255);
  if(frameCount%20==0 ||frameCount==1){
    background(0);
  for(int i=1;i<360;i+=10){
    //pushMatrix();
    //translate(0,i,0);
    limb(-0.5,2,-0.5,2,i);
    //popMatrix();
  }
  }
  //limb(2,-0.5,0,0);
}
