class vehicle{
  PVector position, acceleration,velocity;
  float r,maxspeed,maxforce;
  vehicle(float x,float y,float z,float ms,float mf){
    this.position=new PVector(x,y,z);
    this.acceleration=new PVector(0,0,0);
    this.velocity=new PVector(0,0,0);
    r=4;
    this.maxspeed=ms;
    this.maxforce=mf;
  
  }

  void run(){
    this.update();
    this.borders();
    //scale(0.8);
    this.display();
  
  }
  void follow(flowfield flow){
    
    PVector desired=flow.lookup(this.position);
    desired.mult(this.maxspeed);

    PVector steer=desired.sub(this.velocity);
    steer.limit(this.maxforce);
    this.applyForce(steer);
  }
  
  void applyForce(PVector force){
    this.acceleration.add(force);
  }
  
  void update(){
    this.velocity.add(this.acceleration);
    this.velocity.limit(this.maxspeed);
    this.position.add(this.velocity);
    this.acceleration.mult(0);
  
  }
  
  void borders(){
    if(this.position.x<-this.r){this.position.x=width+this.r;}
    if(this.position.y<-this.r){this.position.y=height+this.r;}
    if(this.position.z<-this.r){this.position.z=100+this.r;}
    if(this.position.x>width+this.r){this.position.x=-this.r;}
    if(this.position.y>height+this.r){this.position.y=-this.r;}
    if(this.position.z>100+this.r){this.position.z=-this.r;}
    
    
  }
  void display(){
  float theta=this.velocity.heading()+PI/2;
  //fill(127);
  //stroke(200);
  strokeWeight(1);
  pushMatrix();
  translate(this.position.x,this.position.y);
  rotate(theta);
  scale(0.5);
  cusshape();
 // ellipse(0,0,5,5);
  popMatrix();
  
  }
  

}

void cusshape(){
 stroke(205,230,239,100);

  fill(98,225,242,100);
  createShape(PShape.GEOMETRY);
   strokeWeight(1);
  generate_arc(-15,2, 15, 2, 80,-1,5,0,0);
  generate_arc(-15,2, 15, 2, 78,-1,5,0,0);
  generate_arc(-15,2, 15, 2, 76,-1,5,0,0);
  generate_arc(-15,2, 15, 2, 74,-1,5,0,0);
  generate_arc(-15,2, 15, 2, 72,-1,5,0,0);
   generate_arc(-15,2, 15, 2, 70,-1,5,0,0);
    generate_arc(-15,2, 15, 2, 60,-1,5,0,0);
     generate_arc(-15,2, 15, 2, 50,-1,5,0,0);
  strokeWeight(1);
  generate_arc(15,2, 2, 16, 20,-1,5,0,0);
  generate_arc(2,16, -15, 2, 40,-1,5,0,0);
  fill(98,225,242,200);
  ellipse(0,0,10,5);
  fill(213,143,255,200);
  ellipse(0,-5,8,3);
  fill(213,143,103,200);
  ellipse(0,-8,5,2);
  generate_arc(2,16, 3,50, random(-40,40),-1,5,0,0);
  endShape();

}
