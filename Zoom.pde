int imgWidth;
int imgHeight;

class ZoomIn extends Tool {
  Tool prev;
  float zoomFactor = 1.5; 
  
  ZoomIn(float s, Tool p){
    super(s);
    type = "ZoomIn";
    prev = p;
    imgWidth = fullImage.width; // Save original dimensions
    imgHeight = fullImage.height;
    
    // Capture current image on first zoom to preserve any drawings
    if (zoomCount == 0) {
        fullImage = get(tlbx, tlby, brbx, brby);
    }
  }
  void update(){
    // Limit zoom to 5 times to prevent excessive enlargement
    if (zoomCount >= 5) {
      println("Can only zoom in 5 times!");
      println("You can zoom out to back, or click RESET.");
      currentTool = new Tool(1);
      return;
    }
    
       // Calculate new dimensions after zoom
    int newWidth = int (fullImage.width * zoomFactor);
    int newHeight = int(fullImage.height * zoomFactor);

    // Create enlarged copy of image
    PImage zoomedImage = fullImage.copy();
    zoomedImage.resize(newWidth, newHeight);
    
    fullImage = zoomedImage;

    // Redraw everything
    fill(255);
    noStroke();
    image(background,0,0, width, height);

    image(fullImage, tlbx, tlby); // Display zoomed image (starts at top-left, may extend beyond bounds)
    pushStyle();
    fill(#0a1929);
    rect(0, brby+tlby+9, width, height);
    rect(brbx+tlbx, tlby, width, height);
    fill(#2f4d6d);
    rect(brbx+20, tlby, 10, brby+9);
    rect(tlbx-10, brby+tlby, brbx+14, 10);
    popStyle();
    
    zoomCount +=1; // Increment zoom counter
    currentTool = new Tool(1); // reset to default tool
  }
}



class ZoomOut extends Tool {
  float zoomFactor = 0.67; 
  Tool prev;
  
  ZoomOut(float s, Tool p){
    super(s);
    type = "ZoomOut";
    prev = p;
    
    // Capture current image on first zoom to preserve any drawings
    if (zoomCount == 0) {
        fullImage = get(tlbx, tlby, brbx, brby);
    }
  }
  
  void update(){
    // Limit zoom out to 5 times to prevent image from becoming too small
    if (zoomCount <= -5) {
      println("Can only zoom out 5 times!");
      println("You can zoom in to back, or click RESET.");
      currentTool = new Tool(1);
      return;
    }    
    
       // Calculate new dimensions after zoom
    int newWidth = int(fullImage.width * zoomFactor);
    int newHeight = int(fullImage.height * zoomFactor);
    
    PImage zoomedImage = fullImage.copy();
    zoomedImage.resize(newWidth, newHeight);
    
    fullImage = zoomedImage;
    
    // Redraw everything
    noStroke();
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
   
    zoomCount -= 1; // decrease zoom counter
    currentTool = new Tool(1); // reset to default tool
  }
}
