class Bullet
{
  PVector loc;
  PVector vel;
  int diameter;

  Bullet(PVector loc)
  {
    this.loc = loc;
    vel = PVector.sub(loc, player.loc);
    diameter = 10;
  }

  void show()
  {
    fill(255, 0, 0);
    ellipse(loc.x, loc.y, diameter, diameter);
  }

  void run()
  {
    if (loc.dist(player.loc) <= diameter / 2 + (player.diameter / 2))
      reset();
    vel.setMag(5);
    loc.add(vel);
  }
}

