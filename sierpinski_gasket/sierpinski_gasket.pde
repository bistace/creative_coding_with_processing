float side_length = 800;
float initial_height = side_length * sqrt(3) / 2;

// initial triangle
float[][] TRIANGLE = new float[3][2];

void setup() {
  size(1000, 1000);
  background(255);
  
  // Top
  TRIANGLE[0][0] = width / 2;
  TRIANGLE[0][1] = (height - initial_height) / 2;
  
  // Left
  TRIANGLE[1][0] = (width - side_length) / 2;
  TRIANGLE[1][1] = (height + initial_height) / 2;
  
  // Right
  TRIANGLE[2][0] = (width + side_length) / 2;
  TRIANGLE[2][1] = (height + initial_height) / 2;
  
  draw_initial_triangle();
}

void draw_initial_triangle() {  
  stroke(0);
  triangle(
    TRIANGLE[0][0], TRIANGLE[0][1], 
    TRIANGLE[1][0], TRIANGLE[1][1],
    TRIANGLE[2][0], TRIANGLE[2][1]
  );
}

void draw() {  
  float[] random_point = get_random_point_in_triangle();
  
  circle(random_point[0], random_point[1], 2);
}

float[] get_random_point_in_triangle() {
  // a = top - left = vector from top to left
  // b = right - left = vector from right to left
  float[] a = {TRIANGLE[0][0] - TRIANGLE[1][0], TRIANGLE[0][1] - TRIANGLE[1][1]};
  float[] b = {TRIANGLE[2][0] - TRIANGLE[1][0], TRIANGLE[2][1] - TRIANGLE[1][1]};
  
  float r1 = random(1);
  float r2 = random(1);
  while(r1 + r2 > 1) {
    r1 = random(1);
    r2 = random(1);
  }
  
  // Translation
  float[] random_point = {r1 * a[0] + r2 * b[0], r1 * a[1] + r2 * b[1]};
  random_point[0] = random_point[0] + TRIANGLE[1][0];
  random_point[1] = random_point[1] + TRIANGLE[1][1];
  
  return(random_point);
}
