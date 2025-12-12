int imgWidth;
int imgHeight;

class ZoomIn extends Tool {
  Tool prev;
  float zoomFactor = 1.5; 
  
  ZoomIn(float s, Tool p){
    super(s);
    type = "ZoomIn";
    prev = p;
    imgWidth = fullImage.width;
    imgHeight = fullImage.height;
    if (zoomCount == 0) {
        fullImage = get(tlbx, tlby, brbx, brby);
    }
  }
  void update(){
    if (zoomCount >= 5) {
      println("Can only zoom in 5 times!");
      println("You can zoom out to back, or click RESET.");
      currentTool = new Tool(1);
      return;
    }
    int newWidth = int (fullImage.width * zoomFactor);
    int newHeight = int(fullImage.height * zoomFactor);


    PImage zoomedImage = fullImage.copy();
    zoomedImage.resize(newWidth, newHeight);
    
    fullImage = zoomedImage;

    fill(255);
    noStroke();
    //rect(0, 200, width, height-200);
    image(background,0,0, width, height);

    image(fullImage, tlbx, tlby);
    pushStyle();
    fill(#0a1929);
    rect(0, brby+tlby+9, width, height);
    rect(brbx+tlbx, tlby, width, height);
    fill(#2f4d6d);
    rect(brbx+20, tlby, 10, brby+9);
    rect(tlbx-10, brby+tlby, brbx+14, 10);
    popStyle();
    
    zoomCount +=1;
    currentTool = new Tool(1);
  }
}



class ZoomOut extends Tool {
  float zoomFactor = 0.67; 
  Tool prev;
  
  ZoomOut(float s, Tool p){
    super(s);
    type = "ZoomOut";
    prev = p;
    
    if (zoomCount == 0) {
        fullImage = get(tlbx, tlby, brbx, brby);
    }
  }
  
  void update(){
    if (zoomCount <= -5) {
      println("Can only zoom out 5 times!");
      println("You can zoom in to back, or click RESET.");
      currentTool = new Tool(1);
      return;
    }    
    
    int newWidth = int(fullImage.width * zoomFactor);
    int newHeight = int(fullImage.height * zoomFactor);
    
    PImage zoomedImage = fullImage.copy();
    zoomedImage.resize(newWidth, newHeight);
    
    fullImage = zoomedImage;
    
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
   
    zoomCount -= 1;
    currentTool = new Tool(1);
  }
}
