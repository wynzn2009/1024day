int total = 19;
void setup() {
  size(1000, 600);
  background(204);
  textSize(32);
  fill(250);
  rect(300, 150, 100, 40);
  fill(50);
  text("1", 340, 180);
  fill(250);
  rect(450, 150, 100, 40);
  fill(50);
  text("2", 490, 180);
  fill(250);
  rect(600, 150, 100, 40);
  fill(50);
  text("4", 640, 180);
}

void draw() {
  background(204);
  textSize(32);
  fill(250);
  rect(300, 150, 100, 40);
  fill(50);
  text("1", 340, 180);
  fill(250);
  rect(450, 150, 100, 40);
  fill(50);
  text("2", 490, 180);
  fill(250);
  rect(600, 150, 100, 40);
  fill(50);
  text("4", 640, 180);
  if (total>0) {
    fill(#2743F0);
    textSize(160);
    text(total, 400, 400);
  } else {
    fill(#FF316F);
    textSize(160);
    text("You lose!", 200, 400);
  }
}
void mouseClicked() {
  total -= pick();
}
int pick() {
  if (mouseX>300&&mouseX<400&&mouseY>150&&mouseY<190) {
    return 1;
  } else if (mouseX>450&&mouseX<550&&mouseY>150&&mouseY<190) {
    return 2;
  } else if (mouseX>600&&mouseX<700&&mouseY>150&&mouseY<190) {
    return 4;
  } else {
    return 0;
  }
}
