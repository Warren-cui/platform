import fisica.*;
FWorld world;

//color of pixels

color black  = #000000;
color white  = #ffffff;
color rock   = #ed1c24;
color mob    = #22b14c;
color bounce = #ff7e00;
color ice    = #00b7ef;
color spike  = #464646;
color lader  = #9c5a3c;


float zoom = 1.5;
//images------
PImage map;
PImage bg;

//images for blocks-----
//PImage gem, floor, bounce, ladder, ice, spike;

// character animations
PImage[] run;
PImage[] idle;
PImage[] sw;
PImage[] die;
PImage[] walk;
PImage[] action;

//mob animaions

PImage[] zombie;


int gridSize = 32;

//player inputs
boolean wkey, akey, skey, dkey, spacekey, fkey;

//arrray list terrain and mobs

ArrayList<FGameObject> enemies;
FPlayer player;


void setup() {
  size(600, 600);
  Fisica.init(this);

  map = loadImage("map.png");
  //bg  = loadImage("bg.png");
  //bg.resize(width,height);
  loadimages();
  loadWorld(map);
  loadPlayer();
}

void loadWorld(PImage img) {
  world = new FWorld(-200000, -200000, 200000, 200000);
  world.setGravity(0, 900);
  for (int y = 0; y< map.height; y++) {
    for (int x= 0; x < map.width; x++) {
      color c = map.get(x, y);
      if (c == black) {
        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        PImage floor = loadImage("brick.png");
        b.setStatic(true);
        b.attachImage(floor);
        b.setFriction(50);
        b.setName("rock");
        world.add(b);
      }
      if (c == bounce) {
        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        PImage floor = loadImage("trampoline.png");
        b.setStatic(true);
        b.attachImage(floor);
        b.setFriction(4);
        b.setRestitution(1.5);
        b.setName("bounce");
        world.add(b);
      }
      if (c == ice) {
        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        PImage floor = loadImage("blueBlock.png");
        b.setStatic(true);
        b.attachImage(floor);
        b.setFriction(0.5);
        b.setName("ice");
        world.add(b);
      }
      if (c == spike) {
        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        PImage floor = loadImage("spike.png");
        b.setStatic(true);
        b.attachImage(floor);
        b.setFriction(0.5);
        b.setName("spike");
        world.add(b);
      }
      if (c == lader) {
        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        PImage floor = loadImage("ladder.png");
        b.setStatic(true);
        b.attachImage(floor);
        b.setSensor(true);
        b.setFriction(4);
        b.setName("ladder");
        world.add(b);
      }//enemie zombie
      if (c == mob) {
        FZombie zom = new FZombie(x*gridSize, y*gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        world.add(b);
      }
    }
  }
}

void loadimages() {



  //player actions
  idle = new PImage[3];
  idle[0] = loadImage("idle0.gif");
  idle[0].resize(gridSize*2, gridSize*2);

  idle[1] = loadImage("idle1.gif");
  idle[1].resize(gridSize*2, gridSize*2);

  idle[2] = loadImage("idle2.gif");
  idle[2].resize(gridSize*2, gridSize*2);

  run = new PImage[10];
  run[0] = loadImage("run0.gif");
  run[0].resize(gridSize*2, gridSize*2);

  run[1] = loadImage("run1.gif");
  run[1].resize(gridSize*2, gridSize*2);

  run[2] = loadImage("run2.gif");
  run[2].resize(gridSize*2, gridSize*2);

  run[3] = loadImage("run3.gif");
  run[3].resize(gridSize*2, gridSize*2);

  run[4] = loadImage("run4.gif");
  run[4].resize(gridSize*2, gridSize*2);

  run[5] = loadImage("run5.gif");
  run[5].resize(gridSize*2, gridSize*2);

  run[6] = loadImage("run6.gif");
  run[6].resize(gridSize*2, gridSize*2);

  run[7] = loadImage("run7.gif");
  run[7].resize(gridSize*2, gridSize*2);

  run[8] = loadImage("run8.gif");
  run[8].resize(gridSize*2, gridSize*2);

  run[9] = loadImage("run9.gif");
  run[9].resize(gridSize*2, gridSize*2);


  sw = new PImage[6];
  sw[0] = loadImage("sw0.gif");
  sw[0].resize(gridSize*5, gridSize*3);

  sw[1] = loadImage("sw1.gif");
  sw[1].resize(gridSize*5, gridSize*3);

  sw[2] = loadImage("sw2.gif");
  sw[2].resize(gridSize*5, gridSize*3);

  sw[3] = loadImage("sw3.gif");
  sw[3].resize(gridSize*5, gridSize*3);

  sw[4] = loadImage("sw4.gif");
  sw[4].resize(gridSize*5, gridSize*3);

  sw[5] = loadImage("sw5.gif");
  sw[5].resize(gridSize*5, gridSize*3);

  die = new PImage[12];
  die[0] = loadImage("die0.gif");
  die[0].resize(gridSize*2, gridSize*2);

  die[1] = loadImage("die1.gif");
  die[1].resize(gridSize*2, gridSize*2);

  die[2] = loadImage("die2.gif");
  die[2].resize(gridSize*2, gridSize*2);

  die[3] = loadImage("die3.gif");
  die[3].resize(gridSize*2, gridSize*2);

  die[4] = loadImage("die4.gif");
  die[4].resize(gridSize*2, gridSize*2);

  die[5] = loadImage("die5.gif");
  die[5].resize(gridSize*2, gridSize*2);

  die[6] = loadImage("die6.gif");
  die[6].resize(gridSize*2, gridSize*2);

  die[7] = loadImage("die7.gif");
  die[7].resize(gridSize*2, gridSize*2);

  die[8] = loadImage("die8.gif");
  die[8].resize(gridSize*2, gridSize*2);

  die[9] = loadImage("die9.gif");
  die[9].resize(gridSize*2, gridSize*2);

  die[10] = loadImage("die10.gif");
  die[10].resize(gridSize*2, gridSize*2);

  die[11] = loadImage("die11.gif");
  die[11].resize(gridSize*2, gridSize*2);

  action = idle;

  //mobs

  zombie = new PImage[8];
  die[0] = loadImage("zom0.gif");
  die[0].resize(gridSize, gridSize);
  die[1] = loadImage("zom1.gif");
  die[1].resize(gridSize, gridSize);
  die[2] = loadImage("zom2.gif");
  die[2].resize(gridSize, gridSize);
  die[3] = loadImage("zom3.gif");
  die[3].resize(gridSize, gridSize);
  die[4] = loadImage("zom4.gif");
  die[4].resize(gridSize, gridSize);
  die[5] = loadImage("zom5.gif");
  die[5].resize(gridSize, gridSize);
  die[6] = loadImage("zom6.gif");
  die[6].resize(gridSize, gridSize);
  die[7] = loadImage("zom7.gif");
  die[7].resize(gridSize, gridSize);
}

void loadPlayer() {
  player = new FPlayer();
  world.add(player);
}


void draw() {

  background(white);
  drawWorld();
  actWorld();
}

//for loading players and mobs in draw

void actWorld() {
  player.act();
  for (int i = 0; i < enemies.size(); i++; ) {
    FGameObject e = enemies.get(i);
    e.act();
  }
}

void drawWorld() {
  //push pop matrix is for following the character camera mode
  pushMatrix();
  translate(-player.getX()*zoom+width/2, -player.getY()*zoom+height-140);
  scale(zoom);
  world.step();
  world.draw();
  popMatrix();
}
