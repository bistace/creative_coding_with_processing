float side_length = 800;
float initial_height = side_length * sqrt(3) / 2;

void setup() {
  size(1000, 1000);
  background(255);
  draw_initial_triangle();
}

void draw_initial_triangle() {
  float top_x = width / 2;
  float left_x = width / 2 - side_length / 2;
  float right_x = width / 2 + side_length / 2;

  float top_y = (height - initial_height) / 2;
  float bottom_y = (height + initial_height) / 2;
  
  fill(0);
  triangle(top_x, top_y, right_x, bottom_y, left_x, bottom_y);
}

void draw() {  
  draw_triangle();
}

void draw_triangle() {
}
  
