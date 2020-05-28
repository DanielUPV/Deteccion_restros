import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture camera;
OpenCV opencv;
PImage img_face;

void setup() {
  size(640, 480);
  camera = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  img_face = loadImage("wato.png");
  camera.start();
}

void draw() {
  scale(2);
  opencv.loadImage(camera);
  image(camera, 0, 0 );
  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  Rectangle[] square = opencv.detect();
  for (int i = 0; i < square.length; i++) {
      image(img_face, square[i].x-(square[i].width*.50/2), square[i].y,square[i].width+(square[i].width*.50),square[i].height);
    }
}

void captureEvent(Capture c) {
  c.read();
}
