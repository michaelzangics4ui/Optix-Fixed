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
    color c = get(mouseX, mouseY);
    //println("Color picked: " + red(c) + ", " + green(c) + ", " + blue(c));
    currentColor = c;
    println("color selected: " + red(c) + ", " + green(c) + ", " + blue(c));
  }
  
}
