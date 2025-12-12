boolean isMouseDragged;
PImage lastScreen;



void mouseDragged() {
    // Only allow dragging below y=200, so tools won't affect the gui buttons.
    if (mouseY > 180 && pmouseY > 180) {
        isMouseDragged = true;
    } 
    else {
        isMouseDragged = false;
    }    
   }

void mouseReleased() {
        isMouseDragged = false; // Reset drag flag when mouse is released
        // Call toolDone() for current tool if mouse is in editing area
        if (currentTool != null && mouseY > 180) {
            currentTool.toolDone();
        }
        bottomRight = new PVector(mouseX, mouseY);
        
        // Update fullImage after drawing with Pencil or Eraser
        if (currentTool.type == "Pencil" || currentTool.type == "Eraser") {
        fullImage = get(0, 200, width, height - 200);
      }
    }

void keyPressed() {
  
    if (textBoxActive) { // checks if the text box has been clicked
        return;
    }
    if (key == 'p' || key == 'P') {
        currentTool = new Pencil(5);
    }

    if (key == 'e' || key == 'E') {
        currentTool = new Eraser(50);
    }
    //if (key == 'c' || key == 'C') {
    //    currentTool = new Select(5);
    //}

    if (key == 'x' || key == 'X') {
        currentTool = new colDrop(1);
    }
    
    if (key == 'h' || key == 'H') {
        currentColor = color(255, 100, 0);
    }

    if (key == 'u' || key == 'U') {
        currentTool = new Undo(toolSize, currentTool);
    }
    if (key == 'r' || key == 'R') {
        currentTool = new Redo(toolSize, currentTool);
    }
    if (key == 'b' || key == 'B') {
        currentTool = new CropTool(1, currentTool); 
    }
    if (key == '-' || key == '_') {
        currentTool = new ZoomOut(toolSize, currentTool); 
    }
    if (key == '=' || key == '+') {
        currentTool = new ZoomIn(toolSize, currentTool); 
    } 
    
    if (key == 0) {
      image(fullImage, 0, 0, width, height);
    }
}

void mousePressed() {
    
    // checks if the mouse if clicked on the text box. if clicked, then turns off all keyboard shortcuts.
    if (mouseX >= 661 && mouseX <= 781 && mouseY >= 72 && mouseY <= 102) {
        textBoxActive = true;
        return;
    } 
    else {
        textBoxActive = false;
    }
        // Check if mouse is in the button area (above y=200)
    if (mouseY < 180) {
        //println("Buton Area Clicked - Tool Action Skipped");
        return; // Doesn't apply whatever the current tool is on the button interface.
    }
    
    
    if (clickedOnUI() == false) {
        
        if (currentTool != null) {
            lastScreen = get(tlbx, tlby, brbx, brby); // Save the state before drawing
            
            currentTool.applyTool();
            topLeft = new PVector(mouseX, mouseY);
        }
    } else {
    }
}

boolean clickedOnUI() {
    int uiHeight = 40; 
    
    // Returns true if mouse is at the bottom of the screen
    if (mouseY > height - uiHeight) {
        return true;
    }
    return false;
}

void mouseClicked() {
      // Trigger clickTool() for tools that need single-click actions (like color dropper)
    if (currentTool != null && mouseY > 200) {
        currentTool.clickTool();
    }
    
}
