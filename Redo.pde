class Redo extends Tool {
    Tool prev;
  
    Redo(float s, Tool p) {
        super(s);
        this.type = "Redo";
        prev = p;
    }

    void update() {
        if (currentScreen != null) {
          image(background,0,0, width, height); 
          image(currentScreen, 0, 0);
        }
        currentTool = prev;
    }
}
