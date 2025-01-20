class FZombie extends FGameObject {

  int direction;
  final int L = -1;
  final int R =  1;
  int speed = 50;
  int frame = 0;


  FZombie(float x, float y) {
    super();
    setPosition(x, y);
    setName("zombie");
    setRotatable(false);
  }

  void act() {
    animate();
    collide();
    move();
  }


  void animate() {
    if (frame >= zombie.length) frame = 0;
    if (frameCount % 5 == 0) {
      if (direction == R)attachImage(zombie[frame]);
      if (direction == L)attachImage(reverseImage(zombie[frame]));
      frame++;
    }
  }

  void collide() {
    if (isTouching("wall")) {
      direction*= -1;
      setPosition(getX()+direction, getY());
    }
  }


  void move() {
    float vy = getVelocityY();
    setVelocity(speed*direction, vy);
  }
}
