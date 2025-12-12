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
int tlbx = 24; // stands for top left box x
int tlby = 173; // stands for top left box y
int brbx = 1181-tlbx; // stands for bottom right box x
int brby = 645-tlby; // stands for bottom right box y       // these coordinates basically determine where the top right and bottom left of the photo editing area is
PImage background;
boolean dropStatus;

void setup() {
    //fullScreen();
    createGUI();
    size(1200,675);
    background(255);
    background = loadImage("Crop.jpg"); // loading UI background
    image(background,0,0, width, height);
    currentTool = new Tool(1); // setting current tool to null
    sample = loadImage("guy.jpg"); // LOAD PREFERRED FILE HERE
    lastScreen = sample.copy();
    image(sample, tlbx, tlby, brbx, brby); // creates the image on the top left and bottom right of the editing box
    fullImage = get(tlbx, tlby, brbx, brby);




}

void draw() {

    if (greyScaleActive) { // if greyScaleActive is clicked, it launches greyscale command
     greyScale(); 
     greyScaleActive = false; // turns off greyScaleActive so it doesn't get repeatedly greyscaled
    }
    if (contrastActive) { // if contrast is clicked, it launches contrast command
     contrast(64); 
     contrastActive = false; // turns off contrastActive so it doesn't get repeatedly contrasted
    }
    
        // Refresh screen for color dropper preview and crop tool

    if (currentTool.type == "colDrop" || currentTool.type == "Crop" || dropStatus == true) {
        image(screen, 0, 0);
        dropStatus = false;
    }
    
    // Save screen state unless crop tool is actively selecting

    if (currentTool.type != "Crop" || !((CropTool)currentTool).isSelecting) {
      screen = get();

    }

    // Update current tool (draws, applies effects, etc.)

    if (currentTool != null) {
        currentTool.update();
   

    }


   // fill(255);
    //rect(1214, 141, 100, 30);
    fill(255);
    textSize(16);
    pushStyle();
    noStroke();
    fill(#0a1929); // fills the background colour
    rect(width*0.868,height*0.190, 140, 20);
    rect(39,115,120,30);
    rect(40, 23, 120, 80); // covers the dropdown menu area so it disappears once clicked
    rect(40, 103, 120, 60); // covers the slider area so no illusions of past slider values appear
    pushStyle();
    fill(255);
    text("Current Tool: " + currentTool.type, width*0.868,height*0.207); // displays current tool in the corner

    //println(mouseX, mouseY);
    if (currentTool != null) {
      println(currentTool.type);
    }




}
