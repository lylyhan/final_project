class flowfield{
  int cols,rows,resolution;
  PVector[][] field;
  flowfield(int r){
     this.resolution=r;
     cols=width/resolution;
    
     rows=height/resolution;
     field=new PVector[cols][rows];
    this.init();
  
  }
  void init(){
    noiseSeed(floor(random(10000)));
    float xoff=0;
    for(int i=0;i<cols;i++){
      float yoff=0;
      for(int j=0;j<rows;j++){
        
        float theta=map(noise(xoff,yoff),0,1,0,2*PI);
        float phi=map(noise(xoff,yoff),0,1,0,2*PI);
        field[i][j]=new PVector(cos(theta),sin(theta));
        yoff+=0.1;
        if(abs(mouseX-i*resolution)<3*resolution && abs(mouseY-j*resolution)<3*resolution){
          PVector temp=new PVector(mouseX-i*resolution,mouseY-j*resolution);
          field[i][j]=temp.mult(1/temp.mag());
          
        }
      }
      xoff+=0.1;
    }
  
  }
 void display(){
   for(int i=0;i<cols;i++){
     for(int j=0;j<rows;j++){
       drawVector(this.field[i][j],i*this.resolution,j*this.resolution,this.resolution-2);
      
     }
     
   }
 }
 
 PVector lookup(PVector lookup){
   int column=floor(constrain(lookup.x/resolution,0,cols-1));
   int row=floor(constrain(lookup.y/resolution,0,rows-1));
   return this.field[column][row].copy();
 
 }
 void drawVector(PVector v, int x,int y, int scayl){
    pushMatrix();
    //int arrowsize=4;
    translate(x,y);
    rotate(v.heading());
    float len=v.mag()*scayl;
    line(0,0,len,0);
    popMatrix();
    
    
 
 }
}
