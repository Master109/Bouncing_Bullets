Player player;
ArrayList<Bullet> bullets;
boolean[] keys;
boolean shouldReset;
boolean isPaused;
PFont font;

void setup()
{
  size(700, 700);
  keys = new boolean[3];
  font = createFont("Arial", 24);
  textFont(font);
  frameRate(30);
  reset();
}

void reset()
{
  isPaused = false;
  shouldReset = false;
  player = new Player();
  bullets = new ArrayList<Bullet>();
}

void draw()
{
  if (shouldReset || isPaused)
    return;

  background(127.5);

  player.run();

  pushMatrix();
  player.show();
  popMatrix();

  for (Bullet b : bullets)
  {
    b.run();

    pushMatrix();
    b.show();
    popMatrix();
  }

  textAlign(CENTER, TOP);
  fill(0);
  text(bullets.size() / 3, width / 2, 0);
}

void keyPressed()
{
  if (keyCode == LEFT)
    keys[0] = true; else if (keyCode == RIGHT)
    keys[1] = true; else if (key == ' ')
    keys[2] = true; else if (key == 'r' || key == 'R')
    reset(); else if (key == 'p' || key == 'P')
    isPaused = !isPaused;
}

void keyReleased()
{
  if (keyCode == LEFT)
    keys[0] = false; else if (keyCode == RIGHT)
    keys[1] = false; else if (key == ' ')
    keys[2] = false;
}

