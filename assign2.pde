PImage fighter;
PImage treasure;
PImage hp;
PImage enemy;
PImage bg1;
PImage bg2;
PImage start1;
PImage start2;
PImage end1;
PImage end2;

int enemy_x;
int enemy_y;
int RX,RY;
int bg1X;
int bg2X;
int hpX;
int HP;

int x;
int y;
int speed = 5;

boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

final int GAME_START=0;
final int GAME_RUN=1;
final int GAME_LOSE=2;
int state=GAME_START;

void setup () {
  size(640,480) ;  // must use this size.
  // your code  
  x=590;
  y=240;  
  enemy_x=1;
  enemy_y=floor(random(0,480));
  bg1X=0;
  bg2X=640;
  hpX=floor(random(1,196));
  HP=floor(100*(hpX/195.0));
  enemy = loadImage("img/enemy.png");
  fighter = loadImage("img/fighter.png");
  treasure = loadImage("img/treasure.png");
  RX=floor(random(550));
  RY=floor(random(100,400));
  hp = loadImage("img/hp.png");
  bg1 = loadImage("img/bg1.png");
  bg2 = loadImage("img/bg2.png");
  start1=loadImage("img/start1.png");
  start2=loadImage("img/start2.png");  
  end1=loadImage("img/end1.png"); 
  end2=loadImage("img/end2.png"); 
}

void draw() {
  // your code
  switch(state)
  {
      case GAME_START:
        image(start2,0,0);
        if(mouseY>370 && mouseY<420 && mouseX>200 && mouseX<460)
        {
            if(mousePressed)
              state=GAME_RUN;
            else
              image(start1,0,0);
        }
        break;   
        
      case GAME_LOSE:
        image(end2,0,0);
        if(mouseY>310 && mouseY<350 && mouseX>210 && mouseX<440)
        {
            if(mousePressed)              
              state=GAME_RUN;
            else
              image(end1,0,0);
        }
        break;  
        
      case GAME_RUN:
        image(bg1,bg1X,0);
        image(bg2,bg2X,0);
        bg1X-=2;  
        bg2X-=2;
        if(bg1X==-640)
          bg1X=640;
        if(bg2X==-640)
          bg2X=640;
        hpX=floor(195*(HP/100.0));        
        stroke(#ff0000);
        fill(#ff0000);
        rect(20,15,hpX,20); 
        image(fighter,x,y);
        image(treasure,RX,RY);
        image(hp,10,10);
        image(enemy,enemy_x,enemy_y);
         if(enemy_x==0)
          enemy_y=floor(random(0,420));
        enemy_x+=2;
        if(y>enemy_y)
          enemy_y+=2;
        else
          enemy_y-=2;       
        enemy_x%=640;
        
        if (upPressed) 
        {
          y -= speed;
        }
        if (downPressed)
        {
          y += speed;
        }
        if (leftPressed) 
        {
          x -= speed;
        }
        if (rightPressed)
        {
          x += speed;
        }
        if(x<0)
          x=0;
        if(x>590)
          x=590;
        if(y<0)
          y=0;
        if(y>430)
          y=430;
      
        if(x>=RX && x<=RX+40)
        {
            if(y+50>=RY && y+50<=RY+40)
            {
                HP+=10;
                RX=floor(random(550));
                RY=floor(random(100,400));
            }
            if(y>=RY && y<=RY+40)
            {
                HP+=10;
                RX=floor(random(550));
                RY=floor(random(100,400));
            }
        } 
        if(x+50>=RX && x+50<=RX+40)
        {
            if(y+50>=RY && y+50<=RY+40)
            {
                HP+=10;
                RX=floor(random(550));
                RY=floor(random(100,400));
            }
            if(y>=RY && y<=RY+40)
            {
                HP+=10;
                RX=floor(random(550));
                RY=floor(random(100,400));
            }
        } 
        if(HP>100)
            HP=100;
          
       if(x>=enemy_x && x<=enemy_x+60)
        {
            if(y+50>=enemy_y && y+50<=enemy_y+60)
            {
                HP-=20;            
                enemy_x=0;
            }
            if(y>=enemy_y && y<=enemy_y+60)
            {
                HP-=20; 
                enemy_x=0;
            }
        } 
        if(x+50>=enemy_x && x+50<=enemy_x+60)
        {
            if(y+50>=enemy_y && y+50<=enemy_y+60)
            {
                HP-=20;  
                enemy_x=0;
            }
            if(y>=enemy_y && y<=enemy_y+60)
            {
                HP-=20;   
                enemy_x=0;
            }
        } 
        if(HP<0)
        {
            state=GAME_LOSE;
            hpX=floor(random(1,196));
            HP=floor(100*(hpX/195.0));
        }
        break;
  }
}


void keyPressed() {
  if (key == CODED) { // detect special keys 
    switch (keyCode) {
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    switch (keyCode) {
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
    }
  }
}
