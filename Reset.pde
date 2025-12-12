class Reset extends Tool {
    
    Reset(float s) {
        super(s);
        type = "Reset";
    }
    
    void update() {
        // clears canvas
        fill(255);
        noStroke();
        rect(0, 0, width, height);
        
        // redraws entire image over
        PImage originalImage = sample;
        fullImage = originalImage.copy(); // Reset the working image
        image(background,0,0, width, height);

        image(originalImage, tlbx, tlby, brbx, brby);
        
        // Reset all transformation counters to default

        rotationCount = 0;
        zoomCount = 0;
        lastScreen = get(tlbx, tlby, brbx, brby); // Save state for undo
        println("Image reset");
        
        // Switch back to default tool after reset
        currentTool = new Tool(1);
    }
}
