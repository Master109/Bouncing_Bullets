class Enemy implements GameObject
{
  PVector loc, vel;
  int diameter, hp;

  Enemy(PVector loc, PVector vel, int diameter, int hp)
  {
    loc = randomPointOnScreen();
    while (loc.dist (player.loc) <= 400)
      loc = randomPointOnScreen();
    vel = new PVector(0, 0);
    diameter = 20;
    hp = 1;
  }

  void show()
  {
  }

  boolean run()
  {
    if (hp <= 0)
      return false;
    if (loc.dist(player.loc) <= diameter / 2 + (player.diameter / 2))
      shouldReset = true;
    return true;
  }
}

