class EnemyFollow implements GameObject
{
  PVector loc, vel;
  int diameter, hp;

  EnemyFollow()
  {
    loc = randomPointOnScreen();
    while (loc.dist (player.loc) <= 450)
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
    vel.set(PVector.sub(player.loc, loc));
    vel.setMag(3);
    loc.add(vel);
    return true;
  }
}

