class Pencil extends Tool {
  
    
    Pencil(float s) {
        super(s);
        type = "Pencil";
    }
  
    

    void update() {
        if (isMouseDragged) {
            pushStyle();
            stroke(currentColor);
            strokeWeight(toolSize);
            noFill();
            line(pmouseX, pmouseY, mouseX, mouseY);
            popStyle();
        }
    }
}
