//a tentacle class that draws dome-like shapes as units, the constructor stores
//positions of these units and the method draws the shapes
class tentacles{
    
    float[][] tentx,tenty;
    int x,y;
    int numx,numy;
    float startx,starty;
    //construct arrays that store coordinates of the tentacles
    //can specify how many tentacles you wanna construct, size is randomized, start x,y position
    tentacles(int nx,int ny, int sx,int sy){
      startx=sx;
      starty=sy;
      numx=nx;
      numy=ny;
      
      tentx=new float[nx][ny];
      tenty=new float[nx][ny];
      for(int i=0;i<nx;i+=1){
        for(int j=0;j<ny;j+=1){
          //store the random x,y coords in each grid
          x=int(random(10,60));
          y=int(random(10,60));
          tentx[i][j]=(sx+random(i*x,(i+1)*x));
          tenty[i][j]=(sy+random(j*y,(j+1)*y));
          
        }
      }
   
    }
 //draw tentacles
  void draw3dtent(float innerx,int diameter,float tall){
    /*
    this function is supposed to draw an organic tube-like structure encircled by a lower volcano-like structure at any location
    specified.
    adjustable parameters include diameters of both the center tube and surrounding volcano, and how tall the structure is
    */
    
    for(int i=0;i<numx;i+=2){
      
        for(int j=0;j<numy;j+=1){
          innerx+=int(map(noise(x),0,1,-2,2));
          float tall2=tall;
          //store scales of random x,y coord in each grid
          if(i<numx-1){
            //you brought me the light
             if(abs(sq(i-20)+sq(j-20)-sq(mouseX/x-20)-sq(mouseY/y-20))<2){
                    if(mousePressed==true){
                    //println("yat");
                    
                    tall2=tall*2;
                  }
              
                
                
                }
            beginShape();
              for(int k=0;k<360;k+=10){
                //extend the height of a specific tube
               
                //draw the volcano
               // generate_arc(innerx*cos(k)+tentx[i][j],innerx/2*sin(k)+tenty[i][j],(innerx+diameter)*cos(k)+tentx[i][j],(innerx+diameter)*sin(k)+tenty[i][j],40,-1,tall2,0,0);
                //draw the tube
                generate_arc(innerx*cos(k)+tentx[i][j],innerx/3*sin(k)+tenty[i][j],innerx*cos(k+180)+tentx[i][j],innerx/2*sin(k+180)+tenty[i][j],0,1,2*tall2,0,0);
                ellipse(innerx*cos(k+180)+tentx[i][j],innerx/2*sin(k+180)+tenty[i][j],5,5);  
           }
             
            endShape();
          
          }
        }
      }
  }
  
}
