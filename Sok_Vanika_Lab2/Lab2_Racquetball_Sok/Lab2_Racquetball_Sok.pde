//declare all the variable that I'm goint to use later
float circleX;//save to later use for x value of ellipse
float circleY;
float speed=5;
int GAP=50;
int paddleY;
float dirx=random(-1, 1);
float diry=1;
int diam=30;
//paddle
int recX=100;//width of paddle
int recY=20;//height of paddle
int score=0;
boolean over=false; //to use at restart function
void setup() {
  size(800, 700);
  paddleY=height-GAP;
  //initialize circleX and circleY
  circleX = random(GAP, width-GAP);
  circleY=15;
}
void draw() {
  //if mouse is pressed both the ball and the paddle will show
  //crazy rainbow ball feature
  if (!mousePressed) {
    background(0);
  }

  //calling void ball
  ball();
  //calling void paddle
  paddle();
  //calling all the voids from below
  bounce();
  score();
  gameover();
  restart();
}
void ball() {
  fill(random(255), random(255), random(255));
  stroke(255);
  ellipse(circleX, circleY, diam, diam);
  circleX+=speed*dirx;
  circleY+=speed*diry;
}
void paddle() {
  fill(255);
  rectMode(CENTER);
  //use constrain function to limit the paddle within the display screen
  rect(constrain(mouseX, recX/2, width-recX/2), paddleY, recX, recY);
}

void bounce() {
  //create an if statement to make the ball bounce when it touches
  //both vertical edges
  if (circleX>width||circleX<0) {
    dirx=dirx*-1;
  }
  //create if statement to make the ball bounce from the top only
  if (circleY < 0) {
    diry=diry*-1;
  }
  //if statement to make the ball bounces when hit the paddle
  if (circleY+diam/2>=paddleY-recY/2 && circleY+diam/2<=paddleY+recY/2 &&
    circleX>=mouseX-recX/2 && circleX<=mouseX+recX/2) {
    diry=diry*-1;
    print(1);
    //every bounces count toward scores, 1 bounce=1 score
    score+=1;
    //increase the speed of the ball when it touches the paddle
    speed+=0.6;
  }
}
