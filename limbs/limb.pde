ArrayList<PVector> coords= new ArrayList<PVector>();
void limb(float dirmin,float dirmax,float dirmin2,float dirmax2,float ang){  
  float x=width/2;
  float y=height/2;
  float z=40;
  float inc=10;
  //if(frameCount%20==0 || frameCount==1){
  //coords.clear();
  //for(int i=0;i<20;i++){
  //coords.add(new PVector(x,y,z));
  //x+=random(dirmin*inc,dirmax*inc);
  //y+=random(dirmin2*inc,dirmax2*inc);
  //z+=random(-40,40);
  //}
   

  //if(frameCount%20==0 || frameCount==1){
   coords.clear();//only one branch is always there cuz every 20 frames the coords are cleared??
  for(int i=0;i<30;i++){
  coords.add(new PVector(x,y,z));
  x+=dirmin+abs(dirmin*inc-dirmax*inc)*sin(ang);
  y+=dirmin2+random(dirmin2*inc,dirmax2*inc)*cos(ang);
  z+=random(-40,40);
  }
  //}
  //println(coords.size());
  PVector pcoord=coords.get(0);
  //PVector endcoord=new PVector(800,100,40);
  strokeWeight(1);
  stroke(255,255,255,200);
  fill(200);
  beginShape();
  for(int i=1;i<coords.size();i++){
  
  //generate_arc(pcoord.x,pcoord.y,coords.get(i).x, coords.get(i).y, 80,1,pcoord.z,pcoord.z,coords.get(i).z);
  generate_arc(pcoord.x,pcoord.y,coords.get(i).x, coords.get(i).y, 70,1,pcoord.z,pcoord.z,coords.get(i).z);
  generate_arc(pcoord.x,pcoord.y,coords.get(i).x, coords.get(i).y, 60,1,pcoord.z,pcoord.z,coords.get(i).z);
  generate_arc(pcoord.x,pcoord.y,coords.get(i).x, coords.get(i).y, 20,1,pcoord.z,pcoord.z,coords.get(i).z);
  generate_arc(pcoord.x,pcoord.y,coords.get(i).x, coords.get(i).y, -20,1,pcoord.z,pcoord.z,coords.get(i).z);
  generate_arc(pcoord.x,pcoord.y,coords.get(i).x, coords.get(i).y, 40,1,pcoord.z,pcoord.z,coords.get(i).z);
  generate_arc(pcoord.x,pcoord.y,coords.get(i).x, coords.get(i).y, -40,1,pcoord.z,pcoord.z,coords.get(i).z);
  
  //line(pcoord.x,pcoord.y,pcoord.z,coords.get(i).x, coords.get(i).y,coords.get(i).z);
  generate_arc(coords.get(i).x, coords.get(i).y, pcoord.x,pcoord.y,60,1,coords.get(i).z,coords.get(i).z,pcoord.z);
  pcoord=coords.get(i);
  }
  stroke(255,255,255,100);
  //generate_arc(pcoord.x,pcoord.y,endcoord.x,endcoord.y, 60,1,pcoord.z,pcoord.z,endcoord.z);
  //generate_arc(pcoord.x,pcoord.y,endcoord.x,endcoord.y, 70,1,pcoord.z,pcoord.z,endcoord.z);
  //generate_arc(pcoord.x,pcoord.y,endcoord.x,endcoord.y, 80,1,pcoord.z,pcoord.z,endcoord.z);
  
  endShape(OPEN);

  }
