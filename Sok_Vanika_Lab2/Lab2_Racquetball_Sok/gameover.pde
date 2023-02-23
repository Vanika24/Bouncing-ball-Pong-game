void gameover() {
  if (circleY>=height) {
    textAlign(CENTER);
    textSize(60);
    fill(random(255),random(255),random(255));
    text("GAMEOVER", width/2, height/2);
    textSize(30);
    fill(255);
    text("Press any key to start over", width/2, height/2+30);
    over=true;
  }
}
void restart() {
  if (keyPressed) {
    if (over==true) {
      circleX=random(GAP, width-GAP);
      circleY=15;
      score=0;
      speed=5;
      over=false;
    }
  }
}
