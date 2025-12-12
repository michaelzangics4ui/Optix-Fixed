class Undo extends Tool {
  
    Tool prev;

    Undo(float s, Tool p) {
        super(s);
        prev = p;
        type = "Undo";
        currentScreen = get();

    }

    void update() {
        println("Undid last change");
        if (lastScreen != null) {
            println("Drawing lastScreen - size: " + lastScreen.width + "x" + lastScreen.height);
            image(background,0,0, width, height);
            image(lastScreen, tlbx, tlby, brbx, brby);
            println("lastScreen drawn!");
            println(toolSize);
        }
        currentTool = prev;
    }

    
}
