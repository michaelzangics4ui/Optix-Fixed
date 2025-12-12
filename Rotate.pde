class rotateRight extends Tool {
    
    rotateRight (float s) {
        super(s);
        type = "rotateRight";
    }
    
    void update() {    
        // Check if already rotated right once (can only rotate 90° right)
        if (rotationCount >= 1) {
            println("Can only rotate right once!");
            println("You can rotate left to go back, or use RESET.");
            currentTool = new Tool(1);
            return;
        }
        // Calculate dimensions after rotation (width becomes height, height becomes width)
        int newWidth = fullImage.height;
        int newHeight = fullImage.width;
        
        // Check if rotated image will fit on screen
        if(newWidth > width || newHeight > (height-200)){
            println("Photo is too zoomed in to rotate - it won't fit on screen!");
            println("Please zoom out if you would like to rotate this image.");
            currentTool = new Tool(1);
            return; 
        }
        
        // Clear screen
        fill(255);
        noStroke();
        rect(0, 200, width, height - 200);
        
        // Calculate center point for rotation
        float centerX = width/2;
        float centerY = 200 + ((height-200)/2);
        
        // Draw rotated image
        pushMatrix();
        translate(centerX, centerY);// Move origin to center
        rotate(radians(90)); // rotate 90 degrees
        imageMode(CENTER); // draws image centered on origin
        image(fullImage, 0, 0);
        imageMode(CORNER); // reset to corner mode
        popMatrix();
        
        // Capture the rotated result
        fullImage = get(int(centerX - newWidth/2), int(centerY - newHeight/2), newWidth, newHeight);
        
        // Redraw everything properly (background, image, borders)
        image(background, 0, 0, width, height);
        image(fullImage, tlbx, tlby);
        
        // Draw border rectangles around the editing area
        pushStyle();
        fill(#0a1929);
        rect(0, brby+tlby+9, width, height);
        rect(brbx+tlbx, tlby, width, height);
        fill(#2f4d6d);
        rect(brbx+20, tlby, 10, brby+9);
        rect(tlbx-10, brby+tlby, brbx+14, 10);
        popStyle();
        
        rotationCount++; // Increment rotation counter
        currentTool = new Tool(1);  // reset tool
    }
}

class rotateLeft extends Tool {
    
    rotateLeft (float s) {
        super(s);
        type = "rotateLeft";
    }
    
    void update() {    
        // Check if already rotated left once (can only rotate 90° left)
        if (rotationCount <= -1) {
            println("Can only rotate left once!");
            println("You can rotate right to go back, or use RESET.");
            currentTool = new Tool(1);
            return;
        }
        // Calculate dimensions after rotation (width becomes height, height becomes width)
        int newWidth = fullImage.height;
        int newHeight = fullImage.width;
        // Check if rotated image will fit on screen
        if(newWidth > width || newHeight > (height-200)){
            println("Photo is too zoomed in to rotate - it won't fit on screen!");
            println("Please zoom out if you would like to rotate this image.");
            currentTool = new Tool(1);
            return; 
        }
        
        // Clear screen
        fill(255);
        noStroke();
        rect(0, 200, width, height - 200);
        
        // Calculate center point for rotation
        float centerX = width/2;
        float centerY = 200 + ((height-200)/2);
        
        // Draw rotated image
        pushMatrix();
        translate(centerX, centerY); // Move origin to center
        rotate(radians(-90)); // Rotate 90° counter-clockwise
        imageMode(CENTER); // Draw image centered on origin
        image(fullImage, 0, 0); 
        imageMode(CORNER); // Reset to corner mode
        popMatrix();
        
        // Capture the rotated result
        fullImage = get(int(centerX - newWidth/2), int(centerY - newHeight/2), newWidth, newHeight);
        
                // Redraw everything properly (background, image, borders)
        image(background, 0, 0, width, height);
        image(fullImage, tlbx, tlby);
        
        pushStyle();
        fill(#0a1929);
        rect(0, brby+tlby+9, width, height);
        rect(brbx+tlbx, tlby, width, height);
        fill(#2f4d6d);
        rect(brbx+20, tlby, 10, brby+9);
        rect(tlbx-10, brby+tlby, brbx+14, 10);
        popStyle();
        
        rotationCount--; // Decrement rotation counter
        currentTool = new Tool(1); // reset tool
    }
}
