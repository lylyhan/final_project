//create a flow field
//make 2D grids, each contains a randomly pointing vector(perlin noise)
//create a vehicle class that has steering force
flowfield f;
ArrayList<vehicle> vehicles;

void setup(){
  size(640,360,P3D);
  f=new flowfield(20);
  vehicles=new ArrayList<vehicle>();
  
   //<>//
  for(int i=0;i<150;i++){
 //<>//
    vehicle temp=new vehicle(random(0,width),random(0,height),random(0,100),random(2,5),random(0.1,0.5));
   
    vehicles.add(temp);   
}
}

void draw(){
  
  background(0);
  for(int i=0;i<vehicles.size();i++){
    vehicles.get(i).follow(f);
    vehicles.get(i).run();
  }
  //f.display();
  
}

void mousePressed(){
  f.init();
}
