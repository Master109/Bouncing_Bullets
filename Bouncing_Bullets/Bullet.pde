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
    fill(255, 255, 0);
    ellipse(diameter);
  }

  boolean run()
  {
    if (loc.dist(player.loc) <= diameter / 2 + (player.diameter / 2))
      shouldReset = true;
    for (Enemy e : enemies)
      if (loc.dist(e.loc) <= diameter / 2 + (e.diameter / 2))
      {
        e.hp --;
        return false;
      }

    vel.setMag(5);
    loc.add(vel);

    if (loc.x + diameter >= width || loc.x - diameter <= 0)
      vel.x *= -1;
    if (loc.y + diameter >= height || loc.y - diameter <= 0)
      vel.y *= -1;

    return true;
  }
}

