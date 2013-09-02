class Bullet implements GameObject
{
  PVector loc, vel;
  int diameter;

  Bullet(PVector loc, PVector vel)
  {
    this.loc = loc;
    this.vel = vel;
    
    loc.add(PVector.mult(vel, 10));
    
    diameter = 10;
  }

  void show()
  {
    translate(loc);
    fill(255, 0, 0);
    ellipse(diameter);
  }

  void run()
  {
    if (loc.dist(player.loc) <= diameter / 2 + (player.diameter / 2))
      reset();
      
    vel.setMag(5);
    loc.add(vel);
  }
}

