int count = 12;
int[] coin = {2, 1, 3, 5, 1, 5, 10, 10, 3, 2, 2, 2};
boolean[] show = {false, false, false, false, false, false, false, false, false, false, false, false};
int circleSize = 70;
color picked = #cccccc;
int defaultX = 100;
int defaultY = 200;
int span = 80;
int fontSize = 32;
int left = 0;
int right = coin.length-1;
boolean turn = true;
ArrayList<Integer> listA = new ArrayList<Integer>(count);
ArrayList<Integer> listB = new ArrayList<Integer>(count);
void setup() {
  size(1200, 660);
  smooth(8);
}

void draw() {
  background(51);
  for (int i=0; i<coin.length; i++) {
    if(!show[i]){
      fill(coinColor(coin[i]));
    }else{
      fill(picked,10);
    }    
    ellipse(defaultX+i*span, defaultY, circleSize, circleSize);
    textSize(fontSize);
    fill(50);
    text(coin[i], defaultX+i*span-fontSize/2, defaultY+fontSize/2);
  }
  textSize(80);
  fill(250);
  text(sum(listA), 200, 500);
  text(sum(listB), 800, 500);
}
void mousePressed() {
  if(right<left){
    return;
  }
  int c = click();  
  if(c==left){
    show[c] = true;
    left++;
    if(turn){
      listA.add(coin[c]);
    }else{
      listB.add(coin[c]);
    }
    turn = !turn;
  }else if(c==right){
    show[c] = true;
    right--;
    if(turn){
      listA.add(coin[c]);
    }else{
      listB.add(coin[c]);
    }
    turn = !turn;
  }
}
color coinColor(int c) {
  color re = #666666;
  switch(c) {
  case 1: 
    re = #85E5F5; 
    break;
  case 2: 
    re = #867AD8; 
    break;
  case 5: 
    re = #EAD82B; 
    break;
  case 10: 
    re = #F03838; 
    break;
  default: 
    break;
  }
  return re;
}
int sum(ArrayList<Integer> list) {
  int sum = 0;
  for (Integer i : list) {
    sum+=i;
  }
  return sum;
}

int click(){
  if(abs(mouseY-defaultY)>circleSize/2){
    return -1;
  } 
  int t = (mouseX-defaultX+circleSize/2)/span;
  if(t>coin.length){
    return -1;
  }
  int x = defaultX + t*span;
  float d = dist(mouseX,mouseY,x,defaultY);
  if(d<circleSize/2){
    return t;
  }else{
    return -1;
  }  
}
