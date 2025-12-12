class CropTool extends Tool {
    PVector topLeft;
    PVector bottomRight;
    boolean isSelecting = false;
    PImage savedScreen;
    Tool prev;

    CropTool(float s, Tool p) {
        super(s);
        type = "Crop";
        prev = p;
    }

    void update() {
        // Draw selection rectangle while dragging
        if (isSelecting && topLeft != null && savedScreen != null) {
          // If the selection goes into the toolbar (y < 200), cancel crop
            if (mouseY < 200) {
                println("Crop cancelled - cannot crop into button area!");
                
                // Restore screen
                background(255);
                image(savedScreen, 0, 200);
    
                // Reset crop state
                isSelecting = false;
                topLeft = null;
                savedScreen = null;
    
                return; // EXIT update()
            }

            pushStyle();
            noFill();
            stroke(0, 0, 255);
            strokeWeight(2);
            // Draw dashed rectangle
            float x1 = topLeft.x;
            float y1 = topLeft.y;
            float x2 = mouseX;
            float y2 = mouseY;
            

            rect(x1, y1, x2 - x1, y2 - y1);
            popStyle();
        }
    }
    void applyTool() {
        savedScreen = get(0, 200, width, height);
        topLeft = new PVector(mouseX, mouseY);
        isSelecting = true;

    }

    void toolDone() {
        bottomRight = new PVector(mouseX, mouseY);
        isSelecting = false;
        
        // Check if it was just a click (no drag)
        if (topLeft != null && bottomRight != null) {
            float dragDistance = dist(topLeft.x, topLeft.y, bottomRight.x, bottomRight.y);
            if (dragDistance < 5) {
                println("Crop cancelled - no drag detected (just a click)");
                // Restore the saved screen to undo any visual artifacts
                if (savedScreen != null) {
                    image(savedScreen, 0, 200);
                }
                topLeft = null;
                bottomRight = null;
                savedScreen = null;
                return;
            }
        }
        if (topLeft != null && bottomRight != null && savedScreen != null) {
          float x1 = min(topLeft.x, bottomRight.x);
          float y1 = min(topLeft.y, bottomRight.y)-200;
          float x2 = max(topLeft.x, bottomRight.x);
          float y2 = max(topLeft.y, bottomRight.y)-200;
    
          if (x2 - x1 > 5 && y2 - y1 > 5) {
            PImage croppedImage = savedScreen.get(int(x1), int(y1), int(x2 - x1), int(y2 - y1));
            
            image(background,0,0, width, height);
            image(croppedImage, tlbx, tlby, brbx, brby);
            
            fullImage = croppedImage.copy();
            screen = get();
          }
          else { 
            println("cropped area is too small, crop cancelled.");
            image(savedScreen,0,200);
          }           
        }
        topLeft = null;
        bottomRight = null;
        savedScreen = null;
        currentTool = new Tool(5);

    }
}
