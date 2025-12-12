import g4p_controls.*;
color currentColor = color(0, 0, 0);
Tool currentTool;
PImage screen;
PImage sample;
PImage currentScreen;
PImage fullImage; // this captures the complete, full resolution version of our image, including parts that might be bigger than the on-screen image. This can happen from clicking the zoom in button.
PVector topLeft;
PVector bottomRight;
int toolSize = 10;
int rotationCount = 0;
int zoomCount = 0;
boolean textBoxActive;
boolean greyScaleActive;
boolean greyScaleClicked;
boolean contrastActive;
boolean contrastClicked;
int tlbx = 24;
int tlby = 173;
int brbx = 1181-tlbx;
int brby = 645-tlby;
PImage background;
boolean dropStatus;

void setup() {
    //fullScreen();
    createGUI();
    size(1200,675);
    background(255);
    background = loadImage("Crop.jpg");
    image(background,0,0, width, height);
    currentTool = new Tool(1);
    sample = loadImage("guy.jpg"); // LOAD PREFERRED FILE HERE
    lastScreen = sample.copy();
    image(sample, tlbx, tlby, brbx, brby);
    fullImage = get(tlbx, tlby, brbx, brby);




}

void draw() {

    if (greyScaleActive) {
     greyScale(); 
     greyScaleActive = false;
    }
    if (contrastActive) {
     contrast(64); 
     contrastActive = false;
    }
    
    if (currentTool.type == "colDrop" || currentTool.type == "Crop" || dropStatus == true) {
        image(screen, 0, 0);
        dropStatus = false;
    }
    
    if (currentTool.type != "Crop" || !((CropTool)currentTool).isSelecting) {
      screen = get();

    }

    if (currentTool != null) {
        currentTool.update();
   

    }


   // fill(255);
    //rect(1214, 141, 100, 30);
    fill(255);
    textSize(16);
    pushStyle();
    noStroke();
    fill(#0a1929);
    rect(width*0.868,height*0.190, 140, 20);
    rect(39,115,120,30);
     // Covers the entire dropdown menu area
    rect(40, 23, 120, 80);
    rect(40, 103, 120, 60);
    pushStyle();
    fill(255);
    text("Current Tool: " + currentTool.type, width*0.868,height*0.207);

    //println(mouseX, mouseY);
    if (currentTool != null) {
      println(currentTool.type);
    }




}
