abstract class Enemy implements GameObject
{
  PVector loc, vel;
  int diameter, hp;

  Enemy(int diameter, int hp)
  {
    this.loc = randomPointOnScreen();
    this.vel = new PVector();
    this.diameter = diameter;
    this.hp = hp;
  }

  void show()
  {
    ellipse(loc, diameter);
  }

  boolean run()
  {
    if (loc.x + diameter >= width)
      vel.x = -abs(vel.x); 
    if (loc.x - diameter <= 0)
      vel.x = abs(vel.x);
    if (loc.y + diameter >= height)
      vel.y = -abs(vel.y); 
    if (loc.y - diameter <= 0)
      vel.y = abs(vel.y);
    return true;
  }
}

