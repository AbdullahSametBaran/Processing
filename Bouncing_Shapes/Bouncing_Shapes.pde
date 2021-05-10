void setup(){
  size(500,500);
  background(255);
  
}
int i = 0;
int dir = 3;

void draw(){
 
  clear();
  noStroke();
  fill(random(256),random(256),random(256),100);
  rect(0,0,i,i);
  rect(width,0,-i,i);
  rect(0,height,i,-i);
  rect(width,height,-i,-i);
  ellipse(width/2,height/2,i,i);
  i += dir;
  
  if(i>width || i< 0){
    
    dir *= -1;
  
    } 
}
