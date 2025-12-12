class Blur extends Tool {

        Blur(float s) {
            super(s);
            type = "Blur";
        }

        void update() {
            if (isMouseDragged) { // only blurs when mouse is being dragged, not clicked
                pushStyle();
                noStroke();
                println("this");
                for (int i = 0; i < toolSize; i++) {    // create blur effect by sampling and redistributing nearby pixels
                    float offsetX = random(-toolSize / 2, toolSize / 2);
                    float offsetY = random(-toolSize / 2, toolSize / 2);
                    color c = get(int(mouseX + offsetX), int(mouseY + offsetY));   // Get color from a random nearby pixel
                    fill(c);
                    ellipse(mouseX + offsetX, mouseY + offsetY, toolSize / 5, toolSize / 5); // Draw small circle with that color at a random nearby location
                }
                popStyle();
            }
        }
}
