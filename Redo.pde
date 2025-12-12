class Redo extends Tool {
    Tool prev; // Stores the previous tool to return to after redo
  
    Redo(float s, Tool p) {
        super(s);
        this.type = "Redo";
        prev = p;
    }

    void update() {
        if (currentScreen != null) {         // Restore the screen state that was saved before undo
          image(background,0,0, width, height); // Redraw UI background
          image(currentScreen, 0, 0);// Restore the saved screen state
        }
        currentTool = prev; // switches back to previous tool
    }
}
