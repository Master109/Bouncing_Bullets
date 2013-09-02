Player player;
ArrayList<Bullet> bullets;
boolean[] keys;
boolean shouldReset;
PFont font;

void setup()
{
  size(700, 700);
  keys = new boolean[3];
  font = createFont("Arial", 24);
  textFont(font);
  reset();
}

void reset()
{
  shouldReset = false;
  player = new Player();
  bullets = new ArrayList<Bullet>();
}

void draw()
{
  if (shouldReset)
    return;

  background(127.5);

  pushMatrix();
  player.show();
  popMatrix();

  player.run();

  for (Bullet b : bullets)
  {
    pushMatrix();
    b.show();
    popMatrix();

    b.run();
  }

  textAlign(CENTER, TOP);
  fill(0);
  text(bullets.size(), width / 2, 0);
}

void keyPressed()
{
  if (keyCode == LEFT)
    keys[0] = true;
  if (keyCode == RIGHT)
    keys[1] = true;
  if (key == ' ')
    keys[2] = true;
  if (key == 'r')
    reset();
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

