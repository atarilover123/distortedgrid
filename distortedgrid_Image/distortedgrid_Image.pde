color col[][];

//grid spacing
int gap = 25;

PImage img;

void setup() {

  size(700, 700);
  
  //put the path to your image here (if it's not 700*700 pixels adjust the scale or use .resize)
  img = loadImage("HJ.jpg");
  
  background(0);

  //store color for blocks in array
  col = new color[width/gap][height/gap];

  for (int i = 0; i < width/gap; i++) {
    for (int j = 0; j < height/ (gap); j++) {

      int loc = (i*gap)+(j*(gap))*width;

      col[i][j] = img.pixels[loc];
    }
  }
}

void draw() {

  background(0);

  //create distorted grid
  for (int j = 1; j < height/gap; j++) {

    for (int i = 1; i < width/gap; i++) {

      //noise values for width and height
      float n = (noise((i+j)*(frameCount*0.0009))*gap);
      float n2 = (noise((j*3)*(frameCount*0.0001))*(gap*3));

      strokeWeight(1);
      int loc = (i*gap)+(j*gap)*width;
      fill(col[i][j]);
      stroke(255);
      rect(-20+(-gap/2)+(i*gap)+n, 20+(j*gap), (gap*(n*2)), -(n2*2));
    }
  }

  //draw frame
  strokeWeight(30);
  stroke(0);
  noFill();
  rect(0, 0, width, height);

  strokeWeight(1);
  stroke(255);
  noFill();
  rect(15, 15, width-30, height-30);
}
