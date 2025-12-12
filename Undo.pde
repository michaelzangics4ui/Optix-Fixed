class Undo extends Tool {
  
    Tool prev;// Stores the previous tool to return to after undo

    Undo(float s, Tool p) {
        super(s);
        prev = p;
        type = "Undo";
        currentScreen = get(); // Save current state before undoing (for redo functionality)

    }

    void update() {
        println("Undid last change");
        if (lastScreen != null) {        // Restore the previously saved screen state

            println("Drawing lastScreen - size: " + lastScreen.width + "x" + lastScreen.height);
            image(background,0,0, width, height); // Redraw UI background 
            image(lastScreen, tlbx, tlby, brbx, brby); // Restore previous image state
            println("lastScreen drawn!");
            println(toolSize);
        }
        currentTool = prev; // restore previous tool
    }

    
}
