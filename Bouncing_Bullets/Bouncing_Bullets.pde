Player player;
ArrayList<Bullet> bullets;
ArrayList<EnemyFollow> enemies;
ArrayList<EnemyFollow> aliveEnemies;
ArrayList<Bullet> aliveBullets;
boolean[] keys;
boolean shouldReset;
boolean isPaused;
float[] enemyAppearTimes;
float[] enemyAppearDeadlines;
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
  enemies = new ArrayList<EnemyFollow>();
  aliveEnemies = new ArrayList<EnemyFollow>();
  aliveBullets = new ArrayList<Bullet>();
  enemyAppearTimes = new float[1];
  for (int i = 0; i < enemyAppearTimes.length; i ++)
    enemyAppearTimes[i] = 0;
  enemyAppearDeadlines = new float[1];
  enemyAppearDeadlines[0] = 240;
}

void draw()
{
  if (shouldReset || isPaused)
    return;

  aliveEnemies = new ArrayList<EnemyFollow>();
  aliveBullets = new ArrayList<Bullet>();

  for (int i = 0; i < enemyAppearTimes.length; i ++)
  {
    if (enemyAppearTimes[i] >= enemyAppearDeadlines[i])
    {
      if (i == 0)
        enemies.add(new EnemyFollow());
      enemyAppearTimes[i] = 0;
    }
  }

  background(127.5);

  player.run();

  pushMatrix();
  player.show();
  popMatrix();

  for (Bullet b : bullets)
  {
    if (b.run())
    {
      pushMatrix();
      b.show();
      popMatrix();
      aliveBullets.add(b);
    }
    else
      aliveBullets.remove(b);
  }

  for (EnemyFollow e : enemies)
  {
    if (e.run())
    {
      e.show();
      aliveEnemies.add(e);
    }
    else
      aliveEnemies.remove(e);
  }

  enemies.retainAll(aliveEnemies);
  bullets.retainAll(aliveBullets);

  textAlign(CENTER, TOP);
  fill(0);
  text(bullets.size() / 3, width / 2, 0);

  for (int i = 0; i < enemyAppearTimes.length; i ++)
  {
    enemyAppearTimes[i] ++;
  }
}

void keyPressed()
{
  if (keyCode == LEFT)
    keys[0] = true; 
  else if (keyCode == RIGHT)
    keys[1] = true; 
  else if (key == ' ')
    keys[2] = true; 
  else if (key == 'r' || key == 'R')
    reset(); 
  else if (key == 'p' || key == 'P')
    isPaused = !isPaused;
}

void keyReleased()
{
  if (keyCode == LEFT)
    keys[0] = false; 
  else if (keyCode == RIGHT)
    keys[1] = false; 
  else if (key == ' ')
    keys[2] = false;
}

