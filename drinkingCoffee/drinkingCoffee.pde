PShape sekil2, sekil3,sekil4;
PShape csekil5,csekil6,csekil7, sekil8;


void setup() {
  size(750, 550, P3D);
  imgBrick = loadImage("brick.jpg");
  imgGrass = loadImage("grass.jpg");
  imgSky = loadImage("sky.jpg");
  imgChair = loadImage("chair.jpg");
  imgTable = loadImage("table.jpg");
  imgCoffee = loadImage("coffee.jpg");
  imgTenor = loadImage("tenor.jpg");
  imgTenor2 = loadImage("tenor2.jpg");
  
  sekil2 = createShape(BOX, 280, 20, 280);
  sekil2.setTexture(imgTable);
  sekil2.setStrokeWeight(0);

  sekil3 = createShape(SPHERE, 80.0);
  sekil3.setTexture(imgTenor);
  sekil3.setStrokeWeight(0);
  
  sekil4 = createShape(BOX,25,150,25);
  sekil4.setTexture(imgTable);
  sekil4.setStrokeWeight(0);
  
  csekil5 = createShape(BOX,60,200,120);
  csekil5.setTexture(imgChair);
  csekil5.setStrokeWeight(0);
  
  csekil6 = createShape(BOX,100,40,120);
  csekil6.setTexture(imgChair);
  csekil6.setStrokeWeight(0);
  
  csekil7 = createShape(BOX,20,90,80);
  csekil7.setTexture(imgChair);
  csekil7.setStrokeWeight(0);
  
  sekil8 = createShape(SPHERE, -80.0);
  sekil8.setTexture(imgTenor2);
  sekil8.setStrokeWeight(0);
  

  camZ = (height/2) / tan((PI*60.0)/360.0);
}


float camZ = 0;
PImage imgTable, imgCoffee, imgChair, imgBrick, imgGrass, imgSky, imgTenor,imgTenor2;

void draw() {

  camera(0, 0, camZ, 
    0, 0, -500, 
    0, 1, 0);

  if (keyPressed)
  {
    if (keyCode == UP)
      camZ -= 10;
    if (keyCode == DOWN)
      camZ += 10;
  }

  rotateX(rotX + distY);
  rotateY(rotY + distX);

  background(imgSky);

  pushMatrix();
  translate(-250, 200, -600);
  shape(csekil5);
  translate(60,0);
  shape(csekil6);
  translate(40,40);
  shape(csekil7);
  popMatrix();

  pushMatrix();
  translate(250, 200, -600);
  scale(-1, 1);
  shape(csekil5);
  translate(80,1);
  shape(csekil6);
  translate(40,40);
  shape(csekil7);
  popMatrix();

  push();
  translate(-80, 90, -600);
  rotateX(radians(90));
  rotateZ(radians(180));
  drawMug();
  pop();

  push();
  translate(80, 90, -600);
  rotateX(radians(90));
  drawMug();
  pop();

  pushMatrix();
  translate(0, 140, -600);
  shape(sekil2);
  translate(0,85);
  shape(sekil4);
  popMatrix();

  pushMatrix();
  translate(200, 0, -600);
  shape(sekil3);
  drawStickMen();
  popMatrix();

  pushMatrix();
  translate(-200, 0, -600);
  
  shape(sekil8);
  scale(-1, 1);
  drawStickMen();
  popMatrix();

  push();
  translate(0, -100, -1100);
  noStroke();
  scale(500, 400);
  myOwnBrick(imgCoffee);
  pop();

  push();
  translate(500, -100, -600);
  rotateY(radians(90));
  noStroke();
  scale(500, 400);
  myOwnBrick(imgBrick);
  pop();

  push();
  translate(0, 300, -600);
  rotateX(radians(90));
  noStroke();
  scale(500, 500);
  myOwnBrick(imgGrass);
  pop();
}

float rotX = 0, rotY = 0;
float lastX, lastY;
float distX, distY;

void mousePressed()
{
  lastX = mouseX;
  lastY = mouseY;
}

void mouseDragged()
{
  distX = radians(mouseX - lastX);
  distY = radians(lastY - mouseY);
}

void mouseReleased()
{
  rotX += distY;
  rotY += distX;
  distX = distY = 0;
}
void drawStickMen()

{ 
  
  translate(0, 80);
  fill(#E1E3AE); 
  box(20, 200, 30);
  translate(-60, 10, -20);
  box(100, 15, 10);
  translate(0, 0, 50);
  box(100, 15, 10);
  translate(20, 80, 0);
  box(100, 20, 20);
  translate(0, 0, -30);
  box(100, 20, 20);
  translate(-60, 50, 20);
  box(20, 120, 10);
  translate(0, 0, 20);
  box(20, 120, 10);
  noFill();
}


void drawMug() {
  
  float angle = 0;

  

  beginShape(QUAD_STRIP);
 
  for (int i=0; i<=12; i++) {
    float  px = cos(radians(angle))*30;
    float  py = sin(radians(angle))*30;
    
  
    vertex(px, py, 40);
    vertex(px, py, -40);
    angle+=30;
    
  }
  endShape();

  beginShape(POLYGON);
  for (int i=0; i<=12; i++) {
    float  px = cos(radians(angle))*30;
    float  py = sin(radians(angle))*30;
    vertex(px, py, -40);
    angle+=30;
  }
  endShape();

  translate(40, 0);
  box(20, 10, 10);
  translate(15, 0, 15);
  box(10, 10, 40);
  translate(-15, 0, 15);
  box(20, 10, 10);
}




void myOwnBrick(PImage img)
{
  int w = img.width;
  int h = img.height;
  beginShape(QUADS);
  texture(img);
  textureMode(IMAGE);

  //+Z Face
  vertex(1, -1, 1, w, 0); //upper right corner
  vertex(1, 1, 1, w, h); //bottom right corner
  vertex(-1, 1, 1, 0, h); //bottom left corner
  vertex(-1, -1, 1, 0, 0); //upper left corner

  //-Z Face
  vertex(1, -1, -1, w, 0); //upper right corner
  vertex(1, 1, -1, w, h); //bottom right corner
  vertex(-1, 1, -1.0001, 0, h); //bottom left corner
  vertex(-1, -1, -1.0001, 0, 0); //upper left corner
  endShape();

  //+Y Face
  vertex(-1, 1, 1); //upper right corner
  vertex(1, 1, 1); //bottom right corner
  vertex(1, 1, -1); //bottom left corner
  vertex(-1, 1, -1); //upper left corner

  //-Y Face
  vertex(-1, -1, 1); //upper right corner
  vertex(1, -1, 1); //bottom right corner
  vertex(1, -1, -1); //bottom left corner
  vertex(-1, -1, -1); //upper left corner

  //+X Face
  vertex(1, -1, 1); //upper right corner
  vertex(1, 1, 1); //bottom right corner
  vertex(1, 1, -1); //bottom left corner
  vertex(1, -1, -1); //upper left corner

  //-X Face
  vertex(-1, -1, 1); //upper right corner
  vertex(-1, 1, 1); //bottom right corner
  vertex(-1, 1, -1); //bottom left corner
  vertex(-1, -1, -1); //upper left corner

  //+X, -X, +Y, -Y


  endShape();
}
