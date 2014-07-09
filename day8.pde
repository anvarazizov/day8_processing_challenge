import java.util.Calendar;

color colorOne;
boolean isDrawing = true;
int actRandomSeed = 0;
int strokeFactor = 1;
int rotateFactor = 6;
int linesDistance = 4;
int h = (int)(random(50, 200));
int s = (int)(random(100, 200));
int b = (int)(random(100, 200));

void setup() {
  size(640, 640);
  background(255);
  smooth();
  colorMode(RGB);
}

void draw() {
  translate(width/2, height/2);
  if (isDrawing) {
    randomSeed(actRandomSeed); 
    actRandomSeed = (int) random(100000);
    for (int i = 0; i <= width; i+=random(linesDistance)) {
      colorOne = color(random(i), random(s), random(b + noise(i)));
      stroke(colorOne);
      strokeWeight(noise(width)*strokeFactor);
      line(i, 0, i, width); 
      line(0, i, width, i); 
      rotate(-PI/rotateFactor);
      println(i);
    }
  }
}

void mousePressed() {
  if (isDrawing)
    isDrawing = false;
  else
    isDrawing = true;

  println(isDrawing);
}

void keyReleased() {
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}

