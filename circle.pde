class circle{
  PVector position;
  PVector velocity;
  PVector acceleration;
  PVector prevPos;
  
  circle(int x, int y){
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    prevPos = position.copy();
  }
  
  void applyForce(){
    acceleration.add(angles[(int)position.x / factor][(int)position.y / factor]);
  }
  
  void edges(){
    if(position.x < 0){
      position.x = width;
      prevPos = position.copy();
    }
    if(position.x > width){
      position.x = 0;
      prevPos = position.copy();
    }
    if(position.y < 0){
      position.y = height;
      prevPos = position.copy();
    }
    if(position.y > height){
      position.y = 0;
      prevPos = position.copy();
    }
  }
  
  void update(){
    applyForce();
    velocity.add(acceleration);
    velocity.limit(4);
    prevPos = position.copy();
    position.add(velocity);
    acceleration.mult(0);
    edges();
  }
  
  void display(){
    //color c = img.get((int)position.x, (int)position.y);
    //float br = (red(c) + green(c) + blue(c)) / 3;
    stroke(0, 40);
    strokeWeight(1);
    line(position.x, position.y, prevPos.x, prevPos.y); 
  }
}