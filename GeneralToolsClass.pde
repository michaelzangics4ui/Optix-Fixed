class Tool { // initializing general tool class
    String type;
    float toolSize;
    color col;

    // Constructor: initializes a tool with a given size
    Tool(float s) {
        toolSize = s;
        col = currentColor;
        this.type = ""; // Default type is empty (overridden by subclasses)
    }

   

    // Called every frame to update tool behavior (e.g., drawing while dragging)
    void update() {
    }
    
    // Called when tool is first applied (e.g., on mouse press)
    void applyTool() {
    }
    
    // Called when tool action is finished (e.g., on mouse release)
    void toolDone() {
    }
    
    // Called when mouse is clicked (for tools that need click events)
    void clickTool() {
        
    }

}
