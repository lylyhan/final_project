flowfield f;
import ComputationalGeometry.*;
IsoContour iso,iso2,iso3;
ArrayList<vehicle> vehicles;
tentacles t1,t2,t3,t4,t5;
float tall=80;
float var,angle;
import processing.sound.*;

SoundFile file1,file2,file3,file4;
int already1=0;
int already2=0;
int already3=0;

void setup(){
  size(1000,1000,P3D);
  //initialize flowfield, vehicles, isocontour, tentacles, soundfiles
  f=new flowfield(20);
  vehicles=new ArrayList<vehicle>();
  iso = new IsoContour(this, new PVector(0,0), new PVector(width,height), 20,200);
  iso2 = new IsoContour(this, new PVector(0,0), new PVector(width,height), 20,100);
  iso3 = new IsoContour(this, new PVector(0,0), new PVector(width,height), 100,20);
  randomSeed(1);
  for(int i=0; i<50; i++){
    PVector pt = new PVector( random(width), random(height), 0 );
    PVector pt2 = new PVector( random(width), random(height), 0 );
    PVector pt3 = new PVector( random(width), random(height), 0 );
    iso.addPoint(pt);
    iso2.addPoint(pt2);
    iso3.addPoint(pt3);
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
  
  //draw the background algae
  fill(87,35,0,100);
  stroke(87,35,0,100);
  float threshold = 0.01-abs(sin(frameCount/100.0f)) * .009;
  iso.plot( threshold); // you must provide a threshold to render the iso contour
  //brown
  noStroke();
  float threshold2 = 0.01-abs(sin(frameCount/100.0f)) * .009;
  iso2.plot( threshold2); // you must provide a threshold to render the iso contour
  //green
  fill(26,56,0,100);
  noStroke();
  float threshold3 = 0.001+abs(sin(frameCount/80.0f)) * .009;
  iso3.plot( threshold3); // you must provide a threshold to render the iso contour
  
  
  //play sound file when moving mouse across the screen
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
  
  //draw vehicles when pressing the right key
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
  
  //draw tentacles in groups of different sizes/colors
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
  
  //draw seaflowers of different colors on canvas
  pushMatrix();
  translate(noise(100),-100,0);
  float opa=200-sin(frameCount/100.0f)*200;
  strokeWeight(3);
  for(int i=20;i<360;i+=20){
   //white seaflower
    pushMatrix();
    translate(200,500,0);
    stroke(61,33,37,opa);
    scale(0.5);
    limb(-1,1,-0.5,1,i);
    stroke(22,2,29,opa);
    limb(-1,1,-0.5,1,i);
    popMatrix();
    //red seaflower
    pushMatrix();
    translate(500,500,0);
    stroke(153,97,73,opa);
    scale(0.3);
    limb(-1,1,-0.5,1,i);
    stroke(59,51,22,opa);
    limb(-1,1,-0.5,1,i);
    popMatrix();
    //green seaflower
     pushMatrix();
    translate(100,300,0);
    stroke(61,51,37,opa);
    scale(0.3);
    limb(-1,1,-0.5,1,i);
    stroke(29,2,12,opa);
    limb(-1,1,-0.5,1,i);
    popMatrix();  
    //purple
    pushMatrix();
    translate(400,100,0);
    stroke(1,46,71,opa);
    scale(0.6);
    limb(-1,1,-0.5,1,i);
    stroke(7,2,29,opa);
    limb(-1,1,-0.5,1,i);
    popMatrix();
    //dirt
     pushMatrix();
    translate(300,100,0);
    stroke(164,139,63,opa);
    scale(0.2);
    limb(-1,1,-0.5,1,i);
    stroke(29,3,2,opa);
    limb(-1,1,-0.5,1,i);
    pushMatrix();
    for(int j=1;i<4;i++){
      translate(j*5,j*2,0);
     stroke(164,139,63,opa);
    scale(0.1);
    limb(-1,1,-0.5,1,i);
    stroke(29,3,2,opa);
    limb(-1,1,-0.5,1,i);
    }
    popMatrix();
    popMatrix();
    
    
  }
 popMatrix();
  }


void mousePressed(){
  f.init();
  already3=0;
  file4.play();
}
