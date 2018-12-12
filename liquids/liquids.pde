//create a flow field
//make 2D grids, each contains a randomly pointing vector(perlin noise)
//create a vehicle class that has steering force
flowfield f;
//PostFX fx;
import ComputationalGeometry.*;
IsoContour iso,iso2;
ArrayList<vehicle> vehicles;
tentacles t1,t2,t3,t4,t5;
float tall=80;
float var,angle;
import processing.sound.*;
//import ch.bildspur.postfx.builder.*;
//import ch.bildspur.postfx.pass.*;
//import ch.bildspur.postfx.*;
SoundFile file1,file2,file3,file4;
int already1=0;
int already2=0;
int already3=0;

void setup(){
  size(1000,1000,P3D);
  //fx=new PostFX(this);
  f=new flowfield(20);
  vehicles=new ArrayList<vehicle>();
  iso = new IsoContour(this, new PVector(0,0), new PVector(width,height), 20,200);
  iso2 = new IsoContour(this, new PVector(0,0), new PVector(width,height), 20,100);
   randomSeed(1);
  for(int i=0; i<50; i++){
    PVector pt = new PVector( random(width), random(height), 0 );
    PVector pt2 = new PVector( random(width), random(height), 0 );
    iso.addPoint(pt);
    iso2.addPoint(pt2);
  }
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
 file3 = new SoundFile(this, "whisper.wav");
 file4 = new SoundFile(this, "swallow.wav");

}

void draw(){
  background(0);
   //fx.render()
   // .bloom(0.5, 20, 40)
   // .blur(20, 50)
   // .compose();
   fill(87,35,0,100);
   //noStroke();
  //stroke(87,68,0,100);
  stroke(87,35,0,100);
  float threshold = 0.01-abs(sin(frameCount/100.0f)) * .009;
  iso.plot( threshold); // you must provide a threshold to render the iso contour
  
  
  stroke(16,35,0,100);
   noStroke();
  //stroke(87,68,0,100);
  //stroke(87,35,0,100);
  float threshold2 = 0.01-abs(sin(frameCount/100.0f)) * .009;
  iso2.plot( threshold2); // you must provide a threshold to render the iso contour
  
  
  float speed=map(abs(mouseX-width/2),0,width/2,3,0.2);
  //println(speed);
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
  
  
  
  if(key=='h'){
    if(!file3.isPlaying() && already3==0){
    file3.play();
    already3=1;
    }
  for(int i=0;i<vehicles.size();i++){
    vehicles.get(i).follow(f);
    vehicles.get(i).run();
  }
  }
  //f.display();
  tall=100;

  var=20+10*mouseX/float(width);
  angle=40+mouseX/float(width);
  stroke(21,35,60,70);//blue
  t1.draw3dtent(var,30,tall);
  stroke(47,55,20,100);//green
  t2.draw3dtent(var,30,tall);
  stroke(60,38,0,100);//brown
  t3.draw3dtent(var,30,tall);
  stroke(133,64,24,100);//dirt
  t4.draw3dtent(var,30,tall);
  stroke(112,94,76,100);//lotus
  t5.draw3dtent(var,30,tall);
  pushMatrix();
  translate(noise(100),-100,0);
  strokeWeight(3);
  for(int i=20;i<360;i+=20){
   
    pushMatrix();
    translate(200,500,0);
    stroke(205,230,239,200);
    scale(0.5);
    limb(-1,1,-0.5,1,i);
    stroke(84,65,25,200);
    limb(-1,1,-0.5,1,i);
    popMatrix();
    
    pushMatrix();
    translate(500,500,0);
    stroke(205,0,25,200);
    scale(0.3);
    limb(-1,1,-0.5,1,i);
    stroke(204,128,25,200);
    limb(-1,1,-0.5,1,i);
    popMatrix();
    
     pushMatrix();
    translate(100,300,0);
    stroke(44,133,73,200);
    scale(0.3);
    limb(-1,1,-0.5,1,i);
    stroke(44,65,73,200);
    limb(-1,1,-0.5,1,i);
    popMatrix();
  }
 popMatrix();
  }


void mousePressed(){
  f.init();
  already3=0;
  file4.play();
}
