void greyScale() {
    currentTool = new Tool(5);
    lastScreen = get(tlbx, tlby, brbx, brby);
    pushStyle();
    PImage currScreen = get();
    loadPixels();
    for (int i = 0; i < pixels.length; i++) {
        color c = pixels[i];
        float r = red(c);
        float g = green(c);
        float b = blue(c);
        float gray = (0.2989*r + 0.5870*g + 0.1140*b);
        pixels[i] = color(gray);
    }
    
    updatePixels();
    PImage newImage = get(tlbx, tlby, brbx, brby);
    image(currScreen, 0,0);
    image(newImage, tlbx, tlby, brbx, brby);
    popStyle();
    lastScreen.get();

}


void contrast(float C) {
    currentTool = new Tool(5);
    lastScreen = get(tlbx, tlby, brbx, brby);
    pushStyle();
    PImage currScreen = get();
    loadPixels();
    for (int i = 16000; i < pixels.length; i++) {
        color c = pixels[i];
        float r = red(c);
        float g = green(c);
        float b = blue(c);

        float factor = (259 * (C + 255)) / (255 * (259 - C));
        r = factor * (r - 128) + 128;
        g = factor * (g - 128) + 128;
        b = factor * (b - 128) + 128;

        r = constrain(r, 0, 255);
        g = constrain(g, 0, 255);
        b = constrain(b, 0, 255);
        
        pixels[i] = color(r, g, b);
    }
    updatePixels();
    PImage newImage = get(tlbx, tlby, brbx, brby);
    image(currScreen, 0,0);
    image(newImage, tlbx, tlby, brbx, brby);
    popStyle();
    lastScreen.get();



}
