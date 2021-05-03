PImage imgWall, imgDoor, imgRoof, imgGrass, imgFence; 

void setup()
{
  size(500, 500, P3D);
  camZ = (height/2) / tan((PI*60.0)/360.0);
  
  noStroke();
  imgWall = loadImage("wall.jpg");
  imgDoor = loadImage("door.jpg");
  imgRoof = loadImage("roof.jpg");
  imgGrass = loadImage("grass.jpg");
  imgFence = loadImage("wood.jpg");
}
float camZ = 0;


void draw()
{
  background(0);
  //translate(width/2, height/2);
  camera(0, 0, camZ, 
        0, 0, -500, 
        0, 1, 0);
  
  rotateX(rotX + distY);
  rotateY(rotY + distX);
  
  scale(100);
  drawHouse();
  drawDoor();
  drawRoof();
  drawGrass();
  for(int i = 0; i < 4; i++)
  {
    rotateY(radians(90));
    drawFence();
  }
  
  
  if(keyPressed)
  {
    if(keyCode == UP)
      camZ -= 10;
    if(keyCode == DOWN)
      camZ += 10;
  }
}

void drawFence() 
{
  int w = imgFence.width;
  int h = imgFence.height;
    final float width_of_fence = 0.3;
    beginShape(QUADS);
    texture(imgFence);
    final float offset = 0.64;
    for (int i = 0; i < 10; ++i)
    {
        vertex(i*offset - 3, 0, 3, 0, 0); // Top Left
        vertex(i*offset - 3 + width_of_fence, 0, 3, w, 0); // Top Right
        vertex(i*offset - 3 + width_of_fence, 1, 3, w, h); // Bottom Right
        vertex(i*offset - 3, 1, 3, 0, h); // Bottom Left
    }
    endShape();
}



void drawGrass()
{
  int w = imgGrass.width;
  int h = imgGrass.height;
  
  beginShape(QUADS);
  texture(imgGrass);
  vertex(-3, 1.0001, 3, 0, 0);
  vertex(3, 1.0001, 3, w, 0);
  vertex(3, 1.0001, -3, w, h);
  vertex(-3, 1.0001, -3, 0, h);
  endShape();
}

void drawRoof()
{
  int w = imgRoof.width;
  int h = imgRoof.height;
  
  beginShape(QUADS);
  texture(imgRoof);
  vertex(-2, -1.0001, 2, 0, 0);
  vertex(2, -1.0001, 2, w, 0);
  vertex(2, -1.0001, -2, w, h);
  vertex(-2, -1.0001, -2, 0, h);
  
  vertex(0, -2, 2, 0, 0);
  vertex(0, -2, -2, w, 0);
  vertex(2, -1, -2, w, h);
  vertex(2, -1, 2, 0, h);
  
  vertex(0, -2, 2, 0, 0);
  vertex(0, -2, -2, w, 0);
  vertex(-2, -1, -2, w, h);
  vertex(-2, -1, 2, 0, h);
  
  endShape();
  
  beginShape(TRIANGLE);
  texture(imgRoof);
  vertex(-2, -1, 2, 0, h);
  vertex(2, -1, 2, w, h);
  vertex(0, -2, 2, w/2, 0);
  
  vertex(-2, -1, -2, 0, h);
  vertex(2, -1, -2, w, h);
  vertex(0, -2, -2, w/2, 0);
  endShape();
}

void drawDoor()
{
  int w = imgDoor.width;
  int h = imgDoor.height;
  beginShape(QUADS);
  texture(imgDoor);
  vertex(-0.5, -0.25, 1.0001, 0, 0);
  vertex(0.5, -0.25, 1.0001, w, 0);
  vertex(0.5, 1, 1.0001, w, h);
  vertex(-0.5, 1, 1.0001, 0, h);
  endShape();
}

void drawHouse()
{
  int w = imgWall.width;
  int h = imgWall.height;
  
  beginShape(QUADS);
  texture(imgWall);
  //+Z face
  vertex(-1, -1, 1, 0, 0); //upper left corner
  vertex(1, -1, 1, w, 0); //upper right corner
  vertex(1, 1, 1, w, h); //bottom right corner
  vertex(-1, 1, 1, 0, h); //bottom left corner
  
  //-Z face
  vertex(-1, -1, -1, 0, 0); //upper left corner
  vertex(1, -1, -1, w, 0); //upper right corner
  vertex(1, 1, -1, w, h); //bottom right corner
  vertex(-1, 1, -1, 0, h); //bottom left corner
  
  //+X face
  vertex(1, -1, 1, 0, 0); //upper left corner
  vertex(1, -1, -1, w, 0);
  vertex(1, 1, -1, w, h);
  vertex(1, 1, 1, 0, h);
  
  //-X face
  vertex(-1, -1, 1, 0, 0); //upper left corner
  vertex(-1, -1, -1, w, 0);
  vertex(-1, 1, -1, w, h);
  vertex(-1, 1, 1, 0, h);
  
  //-Y face
  vertex(-1, -1, 1, 0, 0);
  vertex(1, -1, 1, w, 0);
  vertex(1, -1, -1, w, h);
  vertex(-1, -1, -1, 0, h);
  
  //+Y face
  vertex(-1, 1, 1, 0, 0);
  vertex(1, 1, 1, w, 0);
  vertex(1, 1, -1, w, h);
  vertex(-1, 1, -1, 0, h);
  endShape();
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
