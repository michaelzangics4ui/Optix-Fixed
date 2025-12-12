class Eraser extends Tool {
  color prevColour;
    
    Eraser(float s) {
        super(s);
        type = "Eraser";
        prevColour = currentColor;
        currentColor = color(255);
    }
    
    void update() {
        if (isMouseDragged) {
            currentColor = color(255);
            pushStyle();
            stroke(currentColor);
            strokeWeight(toolSize);
            noFill();
            line(pmouseX, pmouseY, mouseX, mouseY);
            popStyle();
            currentColor = prevColour;
        }
    }
}
