ArrayList<PVector> circle = new ArrayList<PVector>();
ArrayList<PVector> burst_loc = new ArrayList<PVector>();
PVector loc;
float move = 0.2;
float diameter = 0.5;

void setup() {
  size(640, 480);
  background(0);
  noStroke();
}

void draw() {
  overlay();
  for (int i=0; i<circle.size(); i++) {
    loc = new PVector(random(-move, move), random(-move, move));
    burst_loc.add(loc);

    if (circle.get(i).x < 0 && circle.get(i).x > width && circle.get(i).y < 0 && circle.get(i).y > height) {
      circle.remove(i);
      burst_loc.remove(i);
    } else {
      circle.get(i).x += burst_loc.get(i).x;
      circle.get(i).y += burst_loc.get(i).y;
      diameter += 0.0002;
      fill(255);
      circle(circle.get(i).x, circle.get(i).y, diameter);
      if (keyPressed) {
        circle.clear();
        burst_loc.clear();
        fill(0);
        rect(0,0,width,height);
        diameter = 0.5;
      }
    }
  }
}

void mouseDragged() {
  drawCircle();
}

void overlay() {
  fill(0, 5);
  rect(0, 0, width, height);
}

void drawCircle() {
  loc = new PVector(mouseX, mouseY);//マウス位置をlocに追加
  circle.add(loc);//可変配列lineにlocの値を代入
  fill(255);
  circle(mouseX, mouseY, diameter);
}
