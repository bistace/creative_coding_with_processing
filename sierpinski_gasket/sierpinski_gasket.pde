float side_length = 800;
float initial_height = side_length * sqrt(3) / 2;

// initial triangle
float[][] TRIANGLE = new float[3][2];

ArrayList<ArrayList<float[][]>> triangles = new ArrayList<ArrayList<float[][]>>();

void setup() {
  frameRate(480);
  size(1000, 1000);
  background(255);
  
  draw_initial_triangle();
  triangles.add(new ArrayList<float[][]>());
  triangles.get(0).add(TRIANGLE);
}

void draw_initial_triangle() {
  // Top
  TRIANGLE[0][0] = width / 2;
  TRIANGLE[0][1] = (height - initial_height) / 2;
  
  // Left
  TRIANGLE[1][0] = (width - side_length) / 2;
  TRIANGLE[1][1] = (height + initial_height) / 2;
  
  // Right
  TRIANGLE[2][0] = (width + side_length) / 2;
  TRIANGLE[2][1] = (height + initial_height) / 2;
  
  triangle(
    TRIANGLE[0][0], TRIANGLE[0][1], 
    TRIANGLE[1][0], TRIANGLE[1][1],
    TRIANGLE[2][0], TRIANGLE[2][1]
  );
}

void draw() {
  int i = triangles.size() - 1;  
  
  for(int j = 0; j < triangles.get(i).size(); j++) {
    float[][] triangle = triangles.get(i).get(j);
    
    float[] random_point = get_random_point_in_triangle(triangle);
    
    int random_vertex_index = int(floor(random(1) * 3));
    float[] random_vertex = TRIANGLE[random_vertex_index];
    
    float[] middle = {
      (random_point[0] + random_vertex[0]) / 2,
      (random_point[1] + random_vertex[1]) / 2
    };
    
    if(i % 2 == 0) {
      stroke(0);
    } else {
      stroke(255);
    }
    
    strokeWeight(5);
    line(
      middle[0], middle[1],
      random_vertex[0], random_vertex[1]
    );    
  }
}

float[] get_random_point_in_triangle(float[][] triangle) {
  // a = top - left = vector from top to left
  // b = right - left = vector from right to left
  float[] a = {triangle[0][0] - triangle[1][0], triangle[0][1] - triangle[1][1]};
  float[] b = {triangle[2][0] - triangle[1][0], triangle[2][1] - triangle[1][1]};
  
  float r1 = random(1);
  float r2 = random(1);
  while(r1 + r2 > 1) {
    r1 = random(1);
    r2 = random(1);
  }
  
  // Translation
  float[] random_point = {r1 * a[0] + r2 * b[0], r1 * a[1] + r2 * b[1]};
  random_point[0] = random_point[0] + triangle[1][0];
  random_point[1] = random_point[1] + triangle[1][1];
  
  return(random_point);
}
