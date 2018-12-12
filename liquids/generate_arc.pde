void generate_arc(float px,float py, float x, float y, float angle,int sign,float tall,float platform,float platform2){
      /*
      the function is supposed to create an arc given start and end coordinates,
      the angle of arc's midpoint with respect to the straight line between start/end
      coordinates(how curvy), and if the arc is concave or convex, indicated by sign.
      
      update: this is a new version accomodated to 3d environment, added start/end point's z position
      */
      noFill();
      beginShape();
      vertex(px,py,platform);
      //calculate distance between start coordinate to midpoint of the arc of intended curviness
      float controlr=sqrt(sq(py-y)+sq(px-x))/(2*cos(radians(angle)));
      //calculate the angle of midpoint with respect to x axis
      float alpha=atan2((y-py),(x-px))+sign*radians(angle);
      //express coordinate of the midpoint in terms of the above variables
      float controlptx=px+controlr*cos(alpha);
      float controlpty=py+controlr*sin(alpha);
      quadraticVertex(controlptx,controlpty,tall,x,y,platform2);
      endShape();
     

      }
      
