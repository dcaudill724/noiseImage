PImage img;

float inc = 0;
int factor = 10;
PVector[][] angles;
ArrayList<circle> circles;

void setup() {
  size(800, 500, P2D);

  //img = loadImage("flower.jpeg");
  //img.resize(width, height);

  angles = new PVector[width / factor + 1][height / factor + 1];
  circles = new ArrayList<circle>();

  for(int i = 0; i < 200; i++){
    circles.add(new circle((int)random(width), (int)random(height)));
  }
  
  background(255);
}

float zoff = 0;

void draw() {
  //background(255);
  
  float yoff = 0;
  for (int y = 0; y <= height / factor; y++) {
    float xoff = 0;
    for (int x = 0; x <= width / factor; x++) {
      angles[x][y] = PVector.fromAngle(noise(xoff, yoff, zoff) * TWO_PI).setMag(1);

      xoff += 0.1;
    }
    yoff += 0.1;
  }
  
  for(circle c : circles){
    c.update();
    c.display();
  }
  zoff += 0.2;
}

void keyPressed(){
  if(key == 's'){
    save("flowfield.png"); 
  }
}