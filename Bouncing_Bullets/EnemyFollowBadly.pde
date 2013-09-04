class EnemyFollowBadly extends Enemy
{
  EnemyFollowBadly()
  {
    super(20, 7);
    while (loc.dist (player.loc) <= 525)
      loc = randomPointOnScreen();
  }

  void show()
  {
    fill(255, 127.5, 0);
    super.show();
  }

  boolean run()
  {
    if (hp <= 0)
      return false;
    if (loc.dist(player.loc) <= diameter / 2 + (player.diameter / 2))
      shouldReset = true;
    PVector velLimiter = PVector.sub(player.loc, loc);
    velLimiter.limit(.45);
    vel.add(velLimiter);
    vel.setMag(9);
    loc.add(vel);
    return super.run();
  }
}

