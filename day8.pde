import java.util.Calendar;

color colorOne, colorTwo;
int h, s, b;
boolean isDrawing = true;
int actRandomSeed = 0;

void setup() {
  size(640, 640);
  background(255);
  colorMode(HSB);
  h = (int)(random(0, 200));
  s = (int)(random(240, 260));
  b = (int)(random(240, 260));
}

void draw() {

  if (isDrawing) {
    randomSeed(actRandomSeed); 
    actRandomSeed = (int) random(100000);
    for (int i = 0; i <= width; i+=random(30)) {
      colorOne = color(random(h), random(s), random(100, b));
      stroke(colorOne);
      strokeWeight(noise(i)*5);
      line(i, 0, i, width); 
//      line(0, i, width, i); 
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

