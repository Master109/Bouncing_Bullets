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
    while (loc.dist (player.loc) <= 400)
      loc = randomPointOnScreen();
  }

  void show()
  {
    ellipse(loc, diameter);
  }
}

