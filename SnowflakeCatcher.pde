
Snowflake bob; 
Snowflake[] colonyBob;
void setup()
{
  size (300, 300);
  bob = new Snowflake();
  colonyBob = new Snowflake[100];
  for (int i= 0; i < colonyBob.length; i++)
  {
    colonyBob[i] = new Snowflake();
  }
  background(255);
}
void draw()
{
  if(mousePressed == true)
  {
    noStroke();
    fill(255, 0, 0);
    ellipse (mouseX, mouseY, 10, 10);
  }
  for(int a=0; a < colonyBob.length ; a++)
  {
    colonyBob[a].erase();
    colonyBob[a].lookDown();
    colonyBob[a].move();
    colonyBob[a].wrap();
    colonyBob[a].show();
  }
}
void mouseDragged()
{
    
}

class Snowflake
{
  int x, y;
  boolean isMoving;
  Snowflake()
  {
    x = (int)(Math.random()*width);
    y = (int)(Math.random()*height);
    isMoving = true; 

  }
  void show()
  {
    fill(0);
    stroke(0);
    ellipse(x, y, 5, 5);
  }
  void lookDown()
  {
    if (y <= height - 7 && y >= 0 && get(x, y+6) != color(255))
      isMoving = false; 
    else 
      isMoving = true;
  }
  void erase()
  {
    fill (255);
    stroke(255);
    ellipse (x, y, 8, 8);
  }
  void move()
  {
    if (isMoving == true)
      { 
        y++;
      }
  }
  void wrap()
  {
    if (y > 300)
    {
      y = 0; 
      x = (int)(Math.random()*width);
    }
  }
}


