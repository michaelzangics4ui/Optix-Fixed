class Eraser extends Tool {
  color prevColour;
    
    Eraser(float s) {
        super(s);
        type = "Eraser";
        prevColour = currentColor; // tracks previous colour before using eraser
        currentColor = color(255); // sets colour to white
    }
    
    void update() {
        if (isMouseDragged) {
            currentColor = color(255); // if mouse is dragged, it sets colour to white
            pushStyle();
            stroke(currentColor);
            strokeWeight(toolSize);  // draws white with current toolsize
            noFill();
            line(pmouseX, pmouseY, mouseX, mouseY);
            popStyle();
            currentColor = prevColour; // resets colour to what it was before
        }
    }
}
