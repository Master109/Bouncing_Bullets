class Player implements GameObject
{
  PVector loc;
  int diameter;
  float rotation;

  Player()
  {
    rotation = 0;
    loc = new PVector(width / 2, height / 2);
    diameter = 35;
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

  void run()
  {
    if (keys[0])
      rotation -= .1; else if (keys[1])
      rotation += .1; else if (keys[2])
    {
      float BULLET_SPEED = 10;
      bullets.add(new Bullet(copy(loc), createPVectorForMagnitudeAndHeading(BULLET_SPEED, rotation)));
    }
  }
}

