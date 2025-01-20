class FPlayer extends FGameObject {
  int frame;
  int direction;
  final int L = -1;
  final int R =  1;
  FGameObject feet;
  FGameObject swing;

  FPlayer() {

    super();
    frame = 0;
    direction = R;
    setPosition(50, 3000);
    setName("player");
    setRotatable(false);
    //for jumping fbox feet=====================================================
    feet = new FGameObject(gridSize, gridSize/5);
    feet.setSensor(true);
    feet.setName("feet");
    feet.setNoStroke();
    feet.setNoFill();
    world.add(feet);
    
    //for swinging sword FBox sword===============================================
    swing = new FGameObject(gridSize*4,gridSize*2);
    swing.setName("blade");
    swing.setSensor(true);
    swing.setFill(black);
    world.add(swing);
    
  }



  void act() {
    inputs();
    animate();

    float vy = getVelocityY();
    float vx = getVelocityX();
    //feet location and following player velocity
    feet.setPosition(getX(), getY()+gridSize);
    feet.setVelocity(vx, vy);
    //swing location and follow palyer velocity
    swing.setPosition(getX(), getY());
    swing.setVelocity(vx, vy);
    

    if (isTouching("spike")) {
      setPosition(50, 3000);
    }
  }

  void inputs() {
    float vy = getVelocityY();
    float vx = getVelocityX();
    if (abs(vy) < 0.1) {
      action = idle;
    }
    if (akey) {
      setVelocity(-300, vy);
      action = run;
      direction = L;
    }
    if (dkey) {
      setVelocity( 300, vy);
      action = run;
      direction = R;
    }

    if (wkey && feet.isTouching("rock")) {
      setVelocity(vx, -500);
    }
    if (skey) {
      setVelocity(vx, +300);
    }
    if (abs(vy) > 0.1) {
      action = run;
    }
    if (spacekey) {
      action = sw;
    }
    if (feet.isTouching("ladder")&& wkey) {
      setVelocity(vx, -150);
    }
  }





  void animate() {
    if (frame >= action.length) frame = 0;
    if (frameCount % 5 == 0) {
      if (direction == R)attachImage(action[frame]);
      if (direction == L)attachImage(reverseImage(action[frame]));
      frame++;
    }
  }
}
