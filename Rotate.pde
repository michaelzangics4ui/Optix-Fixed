class rotateRight extends Tool {
    
    rotateRight (float s) {
        super(s);
        type = "rotateRight";
    }
    
    void update() {    
        if (rotationCount >= 1) {
            println("Can only rotate right once!");
            println("You can rotate left to go back, or use RESET.");
            currentTool = new Tool(1);
            return;
        }
        
        int newWidth = fullImage.height;
        int newHeight = fullImage.width;
        
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
        
        float centerX = width/2;
        float centerY = 200 + ((height-200)/2);
        
        // Draw rotated image
        pushMatrix();
        translate(centerX, centerY);
        rotate(radians(90));
        imageMode(CENTER);
        image(fullImage, 0, 0);
        imageMode(CORNER);
        popMatrix();
        
        // Capture the rotated result
        fullImage = get(int(centerX - newWidth/2), int(centerY - newHeight/2), newWidth, newHeight);
        
        // NOW redraw everything like zoom does
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
        
        rotationCount++;
        currentTool = new Tool(1);
    }
}

class rotateLeft extends Tool {
    
    rotateLeft (float s) {
        super(s);
        type = "rotateLeft";
    }
    
    void update() {    
        if (rotationCount <= -1) {
            println("Can only rotate left once!");
            println("You can rotate right to go back, or use RESET.");
            currentTool = new Tool(1);
            return;
        }
        
        int newWidth = fullImage.height;
        int newHeight = fullImage.width;
        
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
        
        float centerX = width/2;
        float centerY = 200 + ((height-200)/2);
        
        // Draw rotated image
        pushMatrix();
        translate(centerX, centerY);
        rotate(radians(-90));
        imageMode(CENTER);
        image(fullImage, 0, 0);
        imageMode(CORNER);
        popMatrix();
        
        // Capture the rotated result
        fullImage = get(int(centerX - newWidth/2), int(centerY - newHeight/2), newWidth, newHeight);
        
        // NOW redraw everything like zoom does
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
        
        rotationCount--;
        currentTool = new Tool(1);
    }
}
