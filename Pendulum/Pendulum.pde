void setup()
{
  size(500,500);
  background(255);
}
int r = 100;
int sphere = 0;
int direction = 1 ;

void draw()
{
  background(255);
  curveFunction();
  strokeWeight(55.75);
  point(sphere +70, width/2 + r * sin(radians(sphere) * direction));
  stroke(0,255,232);
  strokeWeight(2);
  sphere += direction;
  if( sphere > 360 || sphere < 0 )
  direction *= -1;
}

void curveFunction()
{
  stroke(0);
  line(70,width/2,430,width/2);
  stroke(75,255,0);
  for(int c= 0; c<360 ; c++){
  point(c + 70, width/2 + (r * (-1) * sin(radians(c))));
  point(c +70, width/2 + (r * sin(radians(c))));
  }
  
}
