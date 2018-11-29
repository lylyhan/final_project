color a=color(220,30,50);
void setup(){
size(1000,1000,P3D);
background(0);
}

void draw(){
  //camera(width/2, height/2, 300, width/2, height/2, 0, 0, 1, 0);
  
  pointLight(500, 500, 0, width/2, height/2, -200);
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
    strokeWeight(3);
  for(int i=20;i<360;i+=20){
    //pushMatrix();
    //translate(0,i,0);
    stroke(64,24,0,200);
    limb(-1,1,-0.5,1,i);
    pushMatrix();
    translate(100,100,0);
    stroke(50,0,34,200);
    limb(-1,1,-0.5,1,i);
    popMatrix();
     pushMatrix();
    translate(-100,100,0);
    stroke(54,75,82,200);
    limb(-1,1,-0.5,1,i);
    popMatrix();
     pushMatrix();
    translate(0,50,0);
    stroke(64,58,19,200);
    limb(-1,1,-0.5,1,i);
    popMatrix();
    //popMatrix();
  }
  }
  //limb(2,-0.5,0,0);
  rotateX(PI/2);
}
