Player player;
ArrayList<Bullet> bullets;
boolean[] keys;

void setup()
{
  size(700, 700);
  keys = new boolean[3];
  reset();
}

void reset()
{
  player = new Player();
  bullets = new ArrayList<Bullet>();
}

void draw()
{
  background(127.5);
  player.show();
  player.run();
  for (Bullet b : bullets)
  {
    b.show();
    b.run();
  }
}

void keyPressed()
{
  if (keyCode == LEFT)
    keys[0] = true;
  if (keyCode == RIGHT)
    keys[1] = true;
  if (key == ' ')
    keys[2] = true;
}

void keyReleased()
{
  if (keyCode == LEFT)
    keys[0] = false;
  if (keyCode == RIGHT)
    keys[1] = false;
  if (key == ' ')
    keys[2] = false;
}

