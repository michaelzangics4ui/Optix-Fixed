class Text extends Tool {
    PVector textPosition; // Stores where the text will be placed on canvas (where user clicks)
    int textSizeValue = 32; // text size
    
    Text(float s) {
        super(s);
        type = "Text";
    }
    
    void update() {
        // No preview needed
    }
    
    void applyTool() {
        // Get text from the text box
        String userText = TEXT.getText();
        
        if (userText.length() > 0) {
            // Set the position where text will be placed
            textPosition = new PVector(mouseX, mouseY);
            
            pushStyle();
            fill(currentColor);
            textSize(textSizeValue);
            text(userText, textPosition.x, textPosition.y);
            popStyle();
            
            // Update fullImage
            fullImage = get(0, 200, width, height - 200);
            
            println("Text placed: " + userText);
        } else {
            println("No text to place - text box is empty");
        }
    }
}
