class EnemyFollowBadly extends Enemy
{
  EnemyFollowBadly()
  {
    super(20, 1);
  }

  void show()
  {
    fill(255, 0, 0);
    super.show();
  }

  boolean run()
  {
    if (hp <= 0)
      return false;
    if (loc.dist(player.loc) <= diameter / 2 + (player.diameter / 2))
      shouldReset = true;
    PVector velLimiter = new PVector();
    vel.set(PVector.sub(player.loc, loc));
    vel.setMag(3);
    velLimiter.add(vel);
    loc.add(velLimiter);
    return true;
  }
}

