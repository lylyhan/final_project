//create a flow field
//make 2D grids, each contains a randomly pointing vector(perlin noise)
//create a vehicle class that has steering force
flowfield f;
ArrayList<vehicle> vehicles;
tentacles t1,t2,t3,t4,t5;
float tall=80;
float var,angle;
import processing.sound.*;
SoundFile file1,file2;
int already1=0;
int already2=0;


void setup(){
  size(1000,1000,P3D);
  f=new flowfield(20);
  vehicles=new ArrayList<vehicle>();
  
   //<>//
  for(int i=0;i<50;i++){
 //<>//
    vehicle temp=new vehicle(random(0,width),random(0,height),random(0,100),random(2,5),random(0.1,0.5));
   
    vehicles.add(temp);   
}
t1=new tentacles(15,17,100,500);
t2=new tentacles(10,7,600,100);
t3=new tentacles(20,7,200,200);
t4=new tentacles(10,15,500,400);
t5=new tentacles(10,15,0,100);

 file1 = new SoundFile(this, "breathin.wav");
  file2 = new SoundFile(this, "breathout.wav");
 

}

void draw(){
  float speed=map(abs(mouseX-width/2),0,width/2,3,0.2);
  println(speed);
  if(mouseX>width/2){
    if(!file1.isPlaying() && already1==0){
      file1.play();
      file1.rate(speed);
      already1=1;
    }
    if(already2==1){
      already2=0;
    }
   
  }
  else{
   if(!file2.isPlaying() && already2==0){
      file2.play();
      file2.rate(speed);
      already2=1;
    }
    if(already1==1){
      already1=0;
    }
  }
  
  
  background(0);
  
  for(int i=0;i<vehicles.size();i++){
    vehicles.get(i).follow(f);
    vehicles.get(i).run();
  }
  //f.display();
  tall=100;

  var=20+10*mouseX/float(width);
  angle=40+mouseX/float(width);
  stroke(21,35,60,70);//blue
  t1.draw3dtent(var,30,tall);
  stroke(55,66,24,100);//green
  t2.draw3dtent(var,30,tall);
  stroke(60,38,0,100);//brown
  t3.draw3dtent(var,30,tall);
  stroke(133,64,24,100);//dirt
  t4.draw3dtent(var,30,tall);
  stroke(112,94,76,100);//lotus
  t5.draw3dtent(var,30,tall);
  
   strokeWeight(3);
  //for(int i=20;i<360;i+=20){
   
  //  pushMatrix();
  //  translate(100,100,100);
  //  stroke(50,0,34,200);
  //  limb(-1,1,-0.5,1,i);
  //  popMatrix();

  //}

  }


void mousePressed(){
  f.init();
}
