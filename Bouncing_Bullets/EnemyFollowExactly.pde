class EnemyFollowExactly extends Enemy
{
  PVector loc, vel;
  int diameter, hp;

  EnemyFollowExactly()
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
    fill(255, 0, 0);
    ellipse(loc.x, loc.y, diameter, diameter);
  }

  boolean run()
  {
    if (hp <= 0)
      return false;
    if (loc.dist(player.loc) <= diameter / 2 + (player.diameter / 2))
      shouldReset = true;
    vel.set(PVector.sub(player.loc, loc));
    vel.setMag(3);
    loc.add(vel);
    return true;
  }
}

