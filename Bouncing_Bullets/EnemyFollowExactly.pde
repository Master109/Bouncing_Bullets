class EnemyFollowExactly extends Enemy
{
  EnemyFollowExactly()
  {
    super(20, 3);
    while (loc.dist (player.loc) <= 400)
      loc = randomPointOnScreen();
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
    vel.set(PVector.sub(player.loc, loc));
    vel.setMag(3);
    loc.add(vel);
    return super.run();
  }
}

