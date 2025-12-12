class colDrop extends Tool {
  
  colDrop(float s) {
    super(s);
    currentColor = color(0);
    type = "colDrop";

  }
  
  void update() {
    // Circle preview - only shows current frame
    color c = get(mouseX, mouseY);
    fill(c);
    circle(mouseX, mouseY, 20);
    noFill();
    dropStatus = true;
  }
 

  void clickTool() {
    color c = get(mouseX, mouseY); // when clicked, it gets the colour of the pixel you're hovering over and selects that as current colour.
    currentColor = c;
    println("color selected: " + red(c) + ", " + green(c) + ", " + blue(c));
  }
  
}
