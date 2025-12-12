class Pencil extends Tool {
  
    
    Pencil(float s) {
        super(s);
        type = "Pencil";
    }
  
    

    void update() {
        if (isMouseDragged) { // if mouse is dragged, it draws a line using the current colour selected and current size.
            pushStyle();
            stroke(currentColor);
            strokeWeight(toolSize);
            noFill();
            line(pmouseX, pmouseY, mouseX, mouseY);
            popStyle();
        }
    }
}
