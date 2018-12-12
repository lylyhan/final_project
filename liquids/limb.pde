//a function that draws pod-like structures, through varying position of the next pod
//with random noise, creates a frantic motion that simulates an extremely flexible limb.
ArrayList<PVector> coords= new ArrayList<PVector>();
void limb(float dirmin,float dirmax,float dirmin2,float dirmax2,float ang){  
  float x=width/2;
  float y=height/2;
  float z=40;
  float inc=20;

  coords.clear();//only one branch is always there cuz every 20 frames the coords are cleared??
  //10 "joints" are in this limb
  for(int i=0;i<10;i++){
  coords.add(new PVector(x,y,z));
  x+=dirmin+random(dirmin*inc-dirmax*inc)*sin(ang);
  y+=dirmin2+random(dirmin2*inc,dirmax2*inc)*cos(ang);
  z+=random(-80,80);
  }
 
  PVector pcoord=coords.get(0);
  strokeWeight(1);
  fill(200);
  beginShape();
  for(int i=1;i<coords.size();i++){
  //draw the lantern-shaped arcs
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
