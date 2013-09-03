class Player implements GameObject
{
  PVector loc, vel;
  int diameter, shootTimeCurrent, shootTimeDeadline;
  float rotation;

  Player()
  {
    rotation = 0;
    loc = new PVector(width / 2, height / 2);
    vel = new PVector();
    diameter = 35;
    shootTimeCurrent = 0;
    shootTimeDeadline = 30;
  }

  void show()
  {
    fill(127.5);
    stroke(0, 255, 0);
    strokeWeight(4);

    translate(loc);
    rotate(rotation);
    ellipse(diameter);

    noStroke();
    fill(0, 0, 255);
    ellipse(diameter / 4, 0, diameter / 4, diameter / 4);
  }

  boolean run()
  {
    if (keys[0])
      rotation -= .2; 
    else if (keys[1])
      rotation += .2; 
    else if (keys[2] && shootTimeCurrent >= shootTimeDeadline)
    {
      float BULLET_SPEED = 10;
      bullets.add(new Bullet(copy(loc), PVector.div(createPVectorForMagnitudeAndHeading(BULLET_SPEED, rotation), 4)));
      bullets.add(new Bullet(copy(loc), PVector.div(createPVectorForMagnitudeAndHeading(BULLET_SPEED, rotation + .3), 4)));
      //bullets.add(new Bullet(copy(loc), PVector.div(createPVectorForMagnitudeAndHeading(BULLET_SPEED, rotation + .6), 4)));
      bullets.add(new Bullet(copy(loc), PVector.div(createPVectorForMagnitudeAndHeading(BULLET_SPEED, rotation - .3), 4)));
      //bullets.add(new Bullet(copy(loc), PVector.div(createPVectorForMagnitudeAndHeading(BULLET_SPEED, rotation - .6), 4)));
      vel.set(PVector.mult(createPVectorForMagnitudeAndHeading(BULLET_SPEED, rotation), -1));
      shootTimeCurrent = 0;
    }
    shootTimeCurrent ++;
    loc.add(vel);
    vel.mult(.95);

    if (loc.x + diameter >= width)
      vel.x = -abs(vel.x); 
    if (loc.x - diameter <= 0)
      vel.x = abs(vel.x);
    if (loc.y + diameter >= height)
      vel.y = -abs(vel.y); 
    if (loc.y - diameter <= 0)
      vel.y = abs(vel.y);
    return true;
  }
}

