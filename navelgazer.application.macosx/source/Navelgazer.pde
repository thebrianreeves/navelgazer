
PImage controlPanelSketch;
PImage mfa;

PImage theMarkThumbnail;

int mo= 0;
int y = 0;
int d = 0;
int s = 0; 
int m = 0; 
int h = 0;  

int theFixedMagic;

int titleAlpha = 255;
int firstDraw = 1;
int masterstrokeControlsX;
int masterstrokeControlsY;
 
float magicRandomLow = 1.8;
float magicRandomHigh = 5.7; 
  
int animationX;
int opacityOfReset = 254;
String thisPermutationName;
int saveLabelOpacity = 0;
int hairRandomPanelX;

PVector v1base,v2center;
PFont KenyanFont; 
PFont KenyanFontMedium;
PFont KenyanFontLarge; 
PFont arial;
PFont GadgetFont;
PFont GadgetFontMedium;
PFont GadgetFontMediumSmall;
PFont SmallTextFont;
PFont MediumTextFont;
PFont SansFont;
PFont SansFontMedium;
PFont tinyFont;

//int helpState = 1;
float rLength;
float rStroke;
float rAlpha;
float rXbegin;
float rYbegin;

float rCPoffset1X;
float rCPoffset1Y;
//float rCPoffset1Z;
float rCPoffset2X;
float rCPoffset2Y;
//float rCPoffset2Z;
float rXend;
float rYend;


float thisMagicNumber;
float rCurviness;

float initialMagicNumber  =  3.226;   // was 2.618;
float magicNumber;
int whichMark = 0;
float dotDistance; 

int ampX=500;
int ampY;
int ampWidth=150;
int ampHeight=40;
int ampMargin=10;

int titleOffsetX;
int titleOffsetY;

int thumbnailBackgroundR=240;
int thumbnailBackgroundG=240;
int thumbnailBackgroundB=240;

float crevasse1xBegin;
float crevasse1yBegin;
float crevasse1xEnd;
float crevasse1yEnd;

float distanceXFromCenter;
float distanceYFromCenter;
float newCrevasse1xBegin;
float newCrevasse1yBegin;
float newCrevasse1xEnd;
float newCrevasse1yEnd;

float randomEllipseX;
float randomEllipseY;
float randomEllipseWidth;
float randomEllipseHeight;
int masterstrokeSecondLineX;
int masterstrokeSecondLineY;
float navelSize; // was 760
float navelMargin;   // was 129
int amplification = 1;
int randomMode = 1;  // start off in manual mode
int hairMode = -1;
int autoMode = -1;
int drawing = -1;
int controlPanelHeight =1052;
int autoIndicatorX;
int randomPermutation;
float levelIndicatorY = 0;
int switchesPanelX;
int switchesPanelY;

int modePanelX;
int modePanelY;

int mem1Active = 0;
int mem2Active = 0;
int mem3Active = 0;

// factory markmaking settings
int [] starterMarkIntensityArray = {50,50,50,50,50,50,50,50,50,50,50,50};
int [] starterMarkMagicNumberArray = {3618,2618,3018,3018,3018,3018,3018,3018,3018,3018,3018,3018};
int [] markIntensityArray = {0,0,0,0,0,0,0,0,0,0,0,0};
int [] markMagicNumberArray = {0,0,0,0,0,0,0,0,0,0,0,0};

//FloatList markMagicNumberArray;

int [] mem1 = {0,0,0,0,0,0,0,0,0,0,0,0};
int [] mem2 = {0,0,0,0,0,0,0,0,0,0,0,0};
int [] mem3 = {0,0,0,0,0,0,0,0,0,0,0,0};

int [] magic1 = {0,0,0,0,0,0,0,0,0,0,0,0};
int [] magic2 = {0,0,0,0,0,0,0,0,0,0,0,0};
int [] magic3 = {0,0,0,0,0,0,0,0,0,0,0,0};

int makeThumbnails = 1;
Table masterMemTable,memTable1,memTable2,memTable3, masterMagicNumberTable;
float memoryPanelX, memoryPanelY;


void setup (){ 

   size (1920,1156);
   background (170);
   smooth ();
   navelSize = width/3;   // was width/3   // was 760
   navelMargin = navelSize/8;   // was 129
   ampY = height - 80;
   
   KenyanFontLarge = loadFont("Invasion2000-140.vlw");
   KenyanFont = loadFont("Invasion2000-48.vlw");
   SansFontMedium = loadFont("KozGoPr6N-ExtraLight-21.vlw");
   magicNumber = initialMagicNumber;
   
   arial = loadFont("ArialUnicodeMS-18.vlw");
   GadgetFont = loadFont("GadgetRegular-40.vlw");
   GadgetFontMediumSmall = loadFont("GadgetRegular-24.vlw");
   GadgetFontMedium = loadFont("GadgetRegular-40.vlw");
   SmallTextFont = loadFont("ArialMT-9.vlw");
   MediumTextFont = loadFont("ArialMT-12.vlw");
   SansFont = loadFont("KozGoPro-ExtraLight-48.vlw");
   tinyFont = loadFont("ArialMT-6.vlw");
   markIntensityArray = starterMarkIntensityArray;
   
   // masterMemTable = loadTable ("http://www.slopart.com/autonavel/masterMem1.csv");
   // println("masterMemTable" + masterMemTable);
   
   // markMagicNumberArray = new FloatList ();
   
   
    loadMasterPrescription();
   
   
   //memTable1 = loadTable ("mem1.csv");
   //memTable2 = loadTable ("mem2.csv");
   //memTable3 = loadTable ("mastMem3.csv");
   println(mem1);
   
   shapeMode(CENTER);
    
    for (int c =1;c<1000;c+=20) {
      noFill();
      smooth();
      strokeWeight(2);
      stroke(255,120,80,13);
      ellipse (width/2,height/2+210,magicNumber*1+c*2.3,magicNumber*300+c*.618);
    }
    
    shapeMode(TOP);
    for (int c =1;c<1000;c+=60) {
       noFill();
       smooth();
       strokeWeight(.8);
       stroke(40,60,155,3);
       ellipse (width/2,height/2+250,magicNumber*1-c*2.1,magicNumber*300+c*.8);
    }
    
   for (int c =1;c<1000;c+=30) {
       noFill();
       smooth();
       strokeWeight(2);
       stroke(255,120,80,4);
       ellipse (width/2,height/2+190+c,magicNumber*1+c*2.3,magicNumber*300+c*.618);
     }
    
    shapeMode(TOP);
    
    for (int c =1;c<1000;c+=30) {
        noFill();
        smooth();
        strokeWeight(.8);
        stroke(40,60,155,10);
        ellipse (width/2+width+1000-c,height/2+220,magicNumber*1-c*2.1,magicNumber*300+c*.8);
      }
    
   titleOffsetX = width/2;
   titleOffsetY = height/2+70;
  
   textAlign(CENTER); 
   textSize(400); 
   fill(120,titleAlpha);
   textFont (KenyanFontLarge);
   
   text("Navelgazer",titleOffsetX,titleOffsetY);
   
   fill(0);
   textFont(GadgetFont);
   textSize (40);
   text("Brian Reeves",titleOffsetX - 190,titleOffsetY-70);
   
   textFont(arial);
   textSize(24);
   text("version 1.1",titleOffsetX + 190,titleOffsetY+40);
   textSize(18);
   text("TM",titleOffsetX + 450,titleOffsetY-60);
   
   textSize(18);
   text("©2017", width/2,height -10);
   
   fill(240);
   textSize(48);
   textFont(SansFont);
   text("initializing...", width/2+13, height-120);
} 

void createSeparations () {
  for (int m = 1;m<10;m++)  {
        mark6();
    }
}

//void setup2 () { 
//  markSet1();
//}
   
void draw () { 
  
     noFill();
     imageMode(CENTER);
    
     if (randomMode > 0 ) {
         noFill();
        
         println("randomMode = 1");
         float whichOneFloat = random(14);
  
         magicNumber = random(2.618,4.5);
  
         int whichOne = (int)whichOneFloat;
         println("whichOne = " + whichOne);
                
         //if (whichOne == 0 )  {
         //   fill(random(100,255),random(170,255),random(117,255),random(5));
         //   rect(0,0,width,height);
         //}
  
         if (whichOne == 1 )  {
             mark1();
         }
  
         if (whichOne == 2 )  {
             mark2();
         }
       
         if (whichOne == 3 )  {
              mark3();
          }
       
          if (whichOne == 4 )  {
             mark4();
          }
 
          if (whichOne == 5 )  {
             mark5();
          }
    
          if (whichOne == 6 )  {
             mark6();
          }
       
          if (whichOne == 7)  {
             mark7();
          }
        
          if (whichOne == 8 )  {
             mark8();
          }
    
          if (whichOne == 9 )  {
             mark9();
          }
    
          if (whichOne == 10 )  {
             mark10();
          }
        
          if (whichOne == 11 )  {
             mark11();
          }
         
          if (whichOne == 12 )  {
             mark12();
          }
        
          if (whichOne == 13 )  {
             pinkFlat();
          }
           
          updatePermutation();
      }
    
      if (autoMode > 0) {
          amplification = 60;
          markSet1();
         }
      
        else {
         amplification = 1;
      }
      
      if (hairMode == 1 ){
         strokeJoin(ROUND);
         rLength = random (0,600);
         strokeWeight (random(1,10));
         rXbegin = random (width);
         rYbegin = random (height);

         float plusOrMinusX = random (-2,2);
         float plusOrMinusY = random (-2,2);

         rXend = rXbegin+(rLength/3)*plusOrMinusX;
         rYend = rYbegin+rLength;
       
         rCPoffset1X =   rXbegin + ((rLength/3)*plusOrMinusX);
         rCPoffset1Y =   rYbegin + (rLength/5);
         // rCPoffset1Z =   rLength/5;
 
         rCPoffset2X =   rXend  - ((rLength/7)*plusOrMinusX);
         rCPoffset2Y =   rYend  - (rLength/random(1,29));
         
         noFill();
         smooth();
 
         float distanceFromCenter = dist (rXbegin+(rLength/1.618),rYbegin+(rLength/2.6),width/2,height/magicNumber);

         // if (the distance between x and y) and the center sketchWidth/2,sketchHeight/3
         if (distanceFromCenter > navelSize/2.4) {
          
             float strokeColor = random(255);
 
             // for a white hair now and then
             if (strokeColor <223) {
                 strokeColor = 0;
             }
    
             else {
                strokeColor = 250;
             };
  
             // float remappedDistance = map (distanceFromCenter,0,3225,0,255);
             stroke (73,45,25,205);
             float variation = random (-200,990);
        
             strokeWeight (random(1,distanceFromCenter/220));
             //float arcX = sketchWidth/2;
             //float arcY = sketchHeight*magicNumber;
             //float arcSize = sketchWidth/4.618+variation;
        
             // draw hair
             bezier (rXbegin,rYbegin,rCPoffset1X,rCPoffset1Y,rCPoffset2X,rCPoffset2Y,rXend,rYend);
             stroke (0,4);

             // draw shadow
             bezier (rXbegin+(rLength/6),rYbegin+(rLength/8),rCPoffset1X+(rLength/13),rCPoffset1Y+(rLength/13),rCPoffset2X+(rLength/13),rCPoffset2Y+(rLength/13),rXend,rYend);
          
             updatePermutation();
         }
     }
     
     noFill();
     determineWhichMark(); 
     drawControlPanel(); 
     if (makeThumbnails == 1)  {
       markSet1();
     }
}
  
void determineWhichMark() {
  
      if (mouseX > masterstrokeSecondLineX-10 && mouseX < masterstrokeSecondLineX+10) {
        if (mouseY > masterstrokeSecondLineY-20 && mouseY < masterstrokeSecondLineY+50){
         
              println ("clickon1");
              whichMark = 1;
          }
      }
      
      if (mouseX > masterstrokeSecondLineX+10 && mouseX < masterstrokeSecondLineX+30) {
           if (mouseY > masterstrokeSecondLineY-20 && mouseY < masterstrokeSecondLineY+50){
        
             println ("clickon2");
             whichMark = 2;
         }    
      }
      
      if (mouseX > masterstrokeSecondLineX+30 && mouseX < masterstrokeSecondLineX+50) {
        if (mouseY > masterstrokeSecondLineY-20 && mouseY < masterstrokeSecondLineY+50){
        
             println ("clickon3");
             whichMark = 3;
          }
      }
      
      if (mouseX > masterstrokeSecondLineX+50 && mouseX < masterstrokeSecondLineX+70) {
        if (mouseY > masterstrokeSecondLineY-20 && mouseY < masterstrokeSecondLineY+50){
        
             println ("clickon4");
             whichMark = 4;
         }
      }
      
      if (mouseX > masterstrokeSecondLineX+70 && mouseX < masterstrokeSecondLineX+90) {
        if (mouseY > masterstrokeSecondLineY-20 && mouseY < masterstrokeSecondLineY+50){
        
             println ("clickon5");
             whichMark = 5;
        }
      }
      if (mouseX > masterstrokeSecondLineX+90 && mouseX < masterstrokeSecondLineX+110) {
        if (mouseY > masterstrokeSecondLineY-20 && mouseY < masterstrokeSecondLineY+50){
        
             println ("clickon6");
             whichMark = 6;
        }
      }
      if (mouseX > masterstrokeSecondLineX+110 && mouseX < masterstrokeSecondLineX+130) {
        if (mouseY > masterstrokeSecondLineY-20 && mouseY < masterstrokeSecondLineY+50){
         
             println ("clickon7");
             whichMark = 7;
        }
      }
      if (mouseX > masterstrokeSecondLineX+130 && mouseX < masterstrokeSecondLineX+150) {
        if (mouseY > masterstrokeSecondLineY-20 && mouseY < masterstrokeSecondLineY+50){
        
               println ("clickon8");
               whichMark = 8;
         }
      }
      if (mouseX > masterstrokeSecondLineX+150 && mouseX < masterstrokeSecondLineX+170) {
        if (mouseY > masterstrokeSecondLineY-20 && mouseY < masterstrokeSecondLineY+50){
        
              println ("clickon9");
              whichMark = 9;
         }
      }
      if (mouseX > masterstrokeSecondLineX+170 && mouseX < masterstrokeSecondLineX+190) {
        if (mouseY > masterstrokeSecondLineY-20 && mouseY < masterstrokeSecondLineY+50){
        
              println ("clickon10");
              whichMark = 10;
       }
      }
      if (mouseX > masterstrokeSecondLineX+190 && mouseX < masterstrokeSecondLineX+210) {
        if (mouseY > masterstrokeSecondLineY-20 && mouseY < masterstrokeSecondLineY+50){
        
               println ("clickon11");
               whichMark = 11;
          }
      }
      
      if (mouseX > masterstrokeSecondLineX+210 && mouseX < masterstrokeSecondLineX+230) {
        if (mouseY > masterstrokeSecondLineY-20 && mouseY < masterstrokeSecondLineY+50){
        
               println ("clickon12");
               whichMark = 12;
        }
    }
}
   
void drawControlPanel() {
    noStroke();
    fill(120,80);
    rect(0,controlPanelHeight,width,105);
  
    //name 
    fill(0);
     
    textFont(GadgetFontMediumSmall);
    textSize(24);
    textAlign(LEFT);
    text("Brian Reeves",59,controlPanelHeight+29.5);
  
    //name 
    fill(0);
  
    textSize(9);
  
    textFont(arial);
    textAlign(LEFT);
    text("American 1969-",219,controlPanelHeight+29.5);
  
    textSize(7);
  
    textFont(arial);
    textAlign(LEFT);
    text("1920 x 1052 pixels, 24 bit color, written using Processing",59,controlPanelHeight+86.5);
  
    // logo
    fill(200);
    textSize(22);

    textFont(KenyanFont);
    textAlign(LEFT);
    text("Automated Navelgazing",57,controlPanelHeight+62.5);
 
    imageMode(CENTER);
    mfa = loadImage("mfa.png");
    image(mfa,width/2,controlPanelHeight+50);
  
  
  // MASTERSTROKE PANEL
  masterstrokeControlsX =(int) width/2+295;
  masterstrokeControlsY = controlPanelHeight+45;
  
  fill(50);
  textFont(arial);
  textSize(22);
  textAlign(LEFT);
  text("CERTIFIED MASTERSTROKES ", masterstrokeControlsX-67,masterstrokeControlsY-16);
  //text("MASTERSTROKE",masterstrokeControlsX+94,masterstrokeControlsY);

   textSize(14);
   fill(100);
   masterstrokeSecondLineX= masterstrokeControlsX+17;
   masterstrokeSecondLineY= masterstrokeControlsY+5;
  
   text("1",masterstrokeSecondLineX+2,masterstrokeSecondLineY);
    text("2",masterstrokeSecondLineX+22,masterstrokeSecondLineY);
     text("3",masterstrokeSecondLineX+42,masterstrokeSecondLineY);
      text("4",masterstrokeSecondLineX+62,masterstrokeSecondLineY);
       text("5",masterstrokeSecondLineX+82,masterstrokeSecondLineY);
        text("6",masterstrokeSecondLineX+102,masterstrokeSecondLineY);
         text("7",masterstrokeSecondLineX+122,masterstrokeSecondLineY);
          text("8",masterstrokeSecondLineX+142,masterstrokeSecondLineY);
           text("9",masterstrokeSecondLineX+162,masterstrokeSecondLineY);
            text("0",masterstrokeSecondLineX+182,masterstrokeSecondLineY);
             text("-",masterstrokeSecondLineX+204,masterstrokeSecondLineY);
              text("=",masterstrokeSecondLineX+222,masterstrokeSecondLineY);

  // magic number control
 
      noStroke();
      fill(100);
      rect (masterstrokeSecondLineX+403, masterstrokeSecondLineY-27,6,51,4);
    
      fill(20,100);
      ellipse(masterstrokeSecondLineX+406,masterstrokeSecondLineY+22-(thisMagicNumber*8.667),6,6); 
      
      fill (210,140,23);
      ellipse(masterstrokeSecondLineX+406,masterstrokeSecondLineY+23-(thisMagicNumber*8.667),6,6); 
      fill (40);
      textFont (arial);
      textSize (14);
      text("*", masterstrokeSecondLineX+404, masterstrokeSecondLineY+40); 
     
    float fillColor1=98;
    float fillAlpha1=255;
    float fillColor2=200;
    float fillAlpha2=255;
      
    if (randomMode > 0  && autoMode > 0) {
       fillAlpha1=100;
       fillAlpha2=100;
    }

    // level indicator
    fill(fillColor1,fillAlpha1);
    for (int l = 4;l < 240; l+=20){
    rect(masterstrokeSecondLineX+l,masterstrokeSecondLineY+10,3,32,4);
    }
   
  // level
    fill(fillColor2,fillAlpha2); 
    int arrayCounter = 0;
    for (int b = 2;b < 230; b+=20){
      levelIndicatorY = markIntensityArray [arrayCounter];
      rect(masterstrokeSecondLineX+b,masterstrokeSecondLineY+34-(levelIndicatorY/4),8,4,4);
      arrayCounter ++;
   }
 
     textFont(SansFontMedium);
     fill(0);
     textSize(17);
  
     thisPermutationName = mo + "-" + d + "-" + y + "-" + h + ":" + m + ":" + s + "." + randomPermutation;
     text(thisPermutationName,628,controlPanelHeight+86);
     text("permutation",527,controlPanelHeight+86);
   
     textSize(13);
     textFont(MediumTextFont);
   
  // MODE PANEL
      modePanelX = 1674;
      modePanelY = masterstrokeSecondLineY+10;

  // hair mode indicator
     fill (90);
     rect (modePanelX + 129, modePanelY-35,30,8,12);
     int hairIndicator = 4;
     fill (160);
     
     if (hairMode == 1) {
        fill (30,200,23);
        hairIndicator = 27;
     }
        
     ellipse(modePanelX+129+hairIndicator,modePanelY-31,17,17); 
     fill (20);
     text("HAIR", modePanelX + 87, modePanelY-27);
     noStroke();

   // random mode indicator
      fill (90);
      rect (modePanelX + 129, modePanelY-10, 30, 8,12);
      int randomIndicator = 4;
      fill (160);
        
      if (randomMode == 1) {
         autoMode = -1;
         fill (30,200,23);
         randomIndicator = 27;
      }
        
      ellipse (modePanelX+129+randomIndicator,modePanelY-6,17,17); 
      fill (20);
      text("RANDOM", modePanelX+61, modePanelY-2);

    //auto mode indicator
      fill (90);
      rect(modePanelX+129, modePanelY+14, 30,8,12);
      int autoIndicatorX = 4;
      fill (160);
        
      if (autoMode > 0) {
         fill (30,200,23);
         autoIndicatorX = 27;
       }
       
       ellipse(modePanelX+129+autoIndicatorX,modePanelY+18,17,17); 
       fill (20);
       text("AUTO", modePanelX + 82, modePanelY+22);

       // MEMORY PANEL 
       memoryPanelX = masterstrokeControlsX+6 ;
       memoryPanelY = masterstrokeSecondLineY-6;
   
   noStroke();
   fill(180,190,180,70);
   rect (memoryPanelX-70,memoryPanelY-4,62,33,4);
   
   textSize(12);
   textFont(MediumTextFont);
   fill(30);
   
   text("MEMORY", memoryPanelX-65,memoryPanelY+10);
   
   fill (210);

   text("1", memoryPanelX-63,memoryPanelY+24);
   text("2", memoryPanelX-41,memoryPanelY+24);
   text("3", memoryPanelX-21,memoryPanelY+24);
   
   fill(0);
   
   textFont(tinyFont);
   text("SAVE",memoryPanelX-67,memoryPanelY+38);
   text("SAVE", memoryPanelX-46,memoryPanelY+38);
   text("SAVE", memoryPanelX-25,memoryPanelY+38);
  
  textFont(SmallTextFont);
  fill(200,20);
  textSize(9);
  textAlign(CENTER);
  strokeWeight(2);
  
  stroke(10,20);
  line( memoryPanelX-140,memoryPanelY+16, memoryPanelX-244,memoryPanelY+16);
  fill(200,200,150,152);
  rect (memoryPanelX-138,memoryPanelY,52,27,5);
  fill(0);
  text("RESET TO MASTER",memoryPanelX-152,memoryPanelY+5,80,40); 
  
  // SAVE 
  textFont(SmallTextFont);
  fill(200,20);
  stroke(10,20);
  line( memoryPanelX-140,memoryPanelY+16, memoryPanelX-244,memoryPanelY+16);
  fill(150,140,150,152);
  rect (memoryPanelX-540,memoryPanelY-0,42,18,5);
  fill(0);
  text("SAVE",memoryPanelX-559,memoryPanelY+6,80,40);    
  
  // saving image indicator
  fill(200,saveLabelOpacity);
  text ("SAVING IMAGE", memoryPanelX-548,memoryPanelY-24,60,50);
  saveLabelOpacity = saveLabelOpacity - 10;
  
  // generate new
  fill(190,210,150,152);
  rect (memoryPanelX-465,memoryPanelY-4,59,29,5);
  fill(0);
  text("GENERATE NEW",memoryPanelX-460,memoryPanelY+2,50,60);    
   
  drawThumbnail();
 }
      
void drawThumbnail() {
  
      textSize(12);
      textFont(arial);
      textAlign(LEFT);
     
    if (whichMark == 0) {
       theMarkThumbnail = loadImage ("navelmarksblank.png");
     }
    
    if (whichMark == 1) {
    
         fill(150);
         ellipse (masterstrokeSecondLineX+5,masterstrokeSecondLineY-6, 20,20);
         theMarkThumbnail = loadImage ("NAVEL MARKS_button_1.jpg");
         fill(0);
         text("1",masterstrokeSecondLineX,masterstrokeSecondLineY);
     }
   
    if (whichMark == 2) {
         fill(150);
         ellipse (masterstrokeSecondLineX+25,masterstrokeSecondLineY-6, 20,20);
         theMarkThumbnail = loadImage ("NAVEL MARKS_button_2.jpg");
         fill(0);
         text("2",masterstrokeSecondLineX+20,masterstrokeSecondLineY);
     }
     
   if (whichMark == 3) {
         fill(150);
         ellipse (masterstrokeSecondLineX+45,masterstrokeSecondLineY-6, 20,20);
         theMarkThumbnail = loadImage ("NAVEL MARKS_button_3.jpg");
         fill(0);
         text("3",masterstrokeSecondLineX+40,masterstrokeSecondLineY);
     }
      
   if (whichMark == 4) {
         fill(150);
         ellipse (masterstrokeSecondLineX+65,masterstrokeSecondLineY-6, 20,20);
         theMarkThumbnail = loadImage ("NAVEL MARKS_button_4.jpg");
         fill(0);
         text("4",masterstrokeSecondLineX+60,masterstrokeSecondLineY);
    }
       
    if (whichMark == 5) {
          fill(150);
          ellipse (masterstrokeSecondLineX+85,masterstrokeSecondLineY-6, 20,20);
          theMarkThumbnail = loadImage ("NAVEL MARKS_button_5.jpg");
          fill(0);
          text("5",masterstrokeSecondLineX+80,masterstrokeSecondLineY);
       }
       
  if (whichMark == 6) {
          fill(150);
          ellipse (masterstrokeSecondLineX+105,masterstrokeSecondLineY-6, 20,20);
          theMarkThumbnail = loadImage ("NAVEL MARKS_button_6.jpg");
    
          fill(0);
          text("6",masterstrokeSecondLineX+100,masterstrokeSecondLineY);
      }
  
   if (whichMark == 7) {
         fill(150);
         ellipse (masterstrokeSecondLineX+125,masterstrokeSecondLineY-6, 20,20);
         theMarkThumbnail = loadImage ("NAVEL MARKS_button_7.jpg");
         fill(0);
         text("7",masterstrokeSecondLineX+120,masterstrokeSecondLineY);
       }
  
  if (whichMark == 8) {
         fill(150);
         ellipse (masterstrokeSecondLineX+145,masterstrokeSecondLineY-6, 20,20);
         theMarkThumbnail = loadImage ("NAVEL MARKS_button_8.jpg");
         fill(0);
         text("8",masterstrokeSecondLineX+140,masterstrokeSecondLineY);
  }
  
  if (whichMark == 9) {
        fill(150);
        ellipse (masterstrokeSecondLineX+165,masterstrokeSecondLineY-6, 20,20);
        theMarkThumbnail = loadImage ("NAVEL MARKS_button_9.jpg");
        fill(0);
        text("9",masterstrokeSecondLineX+160,masterstrokeSecondLineY);
    }
    
  if (whichMark == 10) {
       fill(150);
       ellipse (masterstrokeSecondLineX+185,masterstrokeSecondLineY-6, 20,20);
       theMarkThumbnail = loadImage ("NAVEL MARKS_button_10.jpg");
       fill(0);
       text("0",masterstrokeSecondLineX+180,masterstrokeSecondLineY);
    }
    
  if (whichMark == 11) {
      fill(150);
      ellipse (masterstrokeSecondLineX+205,masterstrokeSecondLineY-6, 20,20);
      theMarkThumbnail = loadImage ("NAVEL MARKS_button_-.jpg");
      fill(0);
      text("-",masterstrokeSecondLineX+202,masterstrokeSecondLineY);
     }
     
  if (whichMark == 12) {
       
      fill(150); 
      ellipse (masterstrokeSecondLineX+225,masterstrokeSecondLineY-6, 20,20);
      theMarkThumbnail = loadImage ("NAVEL MARKS_button_=.jpg");
      fill(0);
      text("=",masterstrokeSecondLineX+220,masterstrokeSecondLineY);
    }
   
  image (theMarkThumbnail,masterstrokeControlsX+335,masterstrokeControlsY+8, 150, 84);
}

void drawMarkMarkersAndLabels() {
    if (whichMark == 1) {
        theMarkThumbnail = loadImage ("NAVEL MARKS_button_1.jpg");
    }
    
    if (whichMark == 2) {
        theMarkThumbnail = loadImage ("NAVEL MARKS_button_2.jpg");
     }
  
    if (whichMark == 3) {
       theMarkThumbnail = loadImage ("NAVEL MARKS_button_3.jpg");
    }
  
    if (whichMark == 4) {
       theMarkThumbnail = loadImage ("NAVEL MARKS_button_4.jpg");
     }
  
     if (whichMark == 5) {
       theMarkThumbnail = loadImage ("NAVEL MARKS_button_5.jpg");
     }

    if (whichMark == 6) {
        theMarkThumbnail = loadImage ("NAVEL MARKS_button_6.jpg");
     }
 
    if (whichMark == 7) {
       theMarkThumbnail = loadImage ("NAVEL MARKS_button_7.jpg");
     }
     
    if (whichMark == 8) {
        theMarkThumbnail = loadImage ("NAVEL MARKS_button_8.jpg");
     }
     
  if (whichMark == 9) {
       theMarkThumbnail = loadImage ("NAVEL MARKS_button_9.jpg");
   }
    
  if (whichMark == 10) {
       theMarkThumbnail = loadImage ("NAVEL MARKS_button_10.jpg");
    }
    
  if (whichMark == 11) {
       theMarkThumbnail = loadImage ("NAVEL MARKS_button_-.jpg");
   }
    
   if (whichMark == 12) {
       println("hey! whichMark = 12");
       theMarkThumbnail = loadImage ("NAVEL MARKS_button_=.jpg");
    }
      
     // should I draw the magic indicator here ?
        
   for (int a=0;a<12;a++){
       print (markIntensityArray[a] +", ");
   }
}
 
void keyPressed() {
   if (randomMode < 0) {
     if (autoMode <0) {
    
       if (key == '1') {
           mark1();
           updatePermutation();
       }
      
       if (key == '2') {
           mark2();
            updatePermutation();
      }
    
      if (key == '3') {
           mark3();
            updatePermutation();
      }
   
      if (key == '4') {
           mark4();
            updatePermutation();
       }
    
      if (key == '5') {
          mark5();
           updatePermutation();
      }
    
      if (key == '6') {
          mark6();
           updatePermutation();
      }
    
      if (key == '7') {
          mark7();
           updatePermutation();
      }
    
      if (key == '8') {
          mark8();
           updatePermutation();
      }
    
      if (key == '9') {
          mark9();
           updatePermutation();
      }
    
      if (key == '0') {
          mark10();
           updatePermutation();
      }
    
      if (key == '-') {
          mark11();
           updatePermutation();
      }
    
      if (key == '=') {
          mark12();
          updatePermutation();
      } 
      
       if (key == 'x') {    // erase and fill with solid
          background (205);
      }
      
       if (key == 'z') {     // fill with transparency pinkish orange
          fill (255,170,117,30);
          rect (0,0,width,height);
      }
      
       if (key == 'b') {    // all black
          background (0,0,0);
      }
      
       if (key == 'h')   {
          hairMode = hairMode * -1;
       }
       
       if (key == 'r')   {
          randomMode = randomMode * -1;
       }
       
       if (key == 'a')   {
          autoMode = autoMode * -1;
       }
      
       if (key == 't')   {
         markSet1();
         updatePermutation();
       }
     }
  }
}
 
void updatePermutation() {

  mo = month();
  y = year();
  d = day();
  s = second();  // Values from 0 - 59
  m = minute();  // Values from 0 - 59
  h = hour();    // Values from 0 - 23
  randomPermutation =(int)random(3);
}

void markSet1() {
     for (int i = 0; i < 1; i++) {
            // float randomNumber = random(100);
              
              // reset background
              fill(215,195,175,opacityOfReset);
              
              rect (0,0,width,height-100);
             
              //if (randomNumber > 99) {
              //   pinkFlat();
              // }
              
              mark1();
              mark2();
              mark3();
              mark4();
              mark5();
              mark6();
              mark7();
              mark8();
              mark9();
              mark10();
              mark11();
              mark12();
              updatePermutation();
              whichMark= 0;
            //  animateMarkSet1();
              // animate the sequence of marks on the control panel.
     }
}
   
void animateMarkSet1 () {
    // drawThumbnail();
    // whichMark ++;
    // drawControlPanel();
   if (whichMark <13) {
      // print ("loop animateMarkSet1()");
      // animateMarkSet1();
      // redraw();
   }
}

void makeMark() {
  
  if (whichMark == 1) {
    
     if (mouseX > masterstrokeSecondLineX-10 && mouseX < masterstrokeSecondLineX+10) {
          if (mouseY > masterstrokeSecondLineY-20 && mouseY < masterstrokeSecondLineY ) {
        println("triggeredmark");
        updatePermutation();
        mark1();
     }
    }
  }
  
  if (whichMark == 2) {
    
     if (mouseX > masterstrokeSecondLineX+10 && mouseX < masterstrokeSecondLineX+30) {
    if (mouseY > masterstrokeSecondLineY-20 && mouseY < masterstrokeSecondLineY) {
        println("triggeredmark");
        updatePermutation();
        mark2();
    }
  }
}
  
  if (whichMark == 3) {
     if (mouseX > masterstrokeSecondLineX+30 && mouseX < masterstrokeSecondLineX+50) {
        if (mouseY > masterstrokeSecondLineY-20   && mouseY < masterstrokeSecondLineY) {
        println("triggeredmark");
        updatePermutation();
        mark3();
     }
    }
  }
  
  if (whichMark == 4) {
    
     if (mouseX > masterstrokeSecondLineX+50 && mouseX < masterstrokeSecondLineX+70) {
    if ( mouseY > masterstrokeSecondLineY-20  && mouseY < masterstrokeSecondLineY) {
        println("triggeredmark");
        updatePermutation();
        mark4();
      }
    }
  }
  
  if (whichMark == 5) {
    
     if (mouseX > masterstrokeSecondLineX+70 && mouseX < masterstrokeSecondLineX+90) {
    if ( mouseY > masterstrokeSecondLineY-20  && mouseY < masterstrokeSecondLineY) {
        println("triggeredmark");
        updatePermutation();
        mark5();
    }
  }
  }
  
  if (whichMark == 6) {
    
     if (mouseX > masterstrokeSecondLineX+90 && mouseX < masterstrokeSecondLineX+110) {
    if (mouseY > masterstrokeSecondLineY-20  && mouseY < masterstrokeSecondLineY) {
        println("triggeredmark");
        updatePermutation();
        mark6();
    }
  }
  }
  
  
  if (whichMark == 7) {
    
     if (mouseX > masterstrokeSecondLineX+110 && mouseX < masterstrokeSecondLineX+130) {
         if (mouseY > masterstrokeSecondLineY-20   && mouseY < masterstrokeSecondLineY) {
      
        println("triggeredmark");
        updatePermutation();
        mark7();
      }
    }
  }
  
  if (whichMark == 8) {
    
     if (mouseX > masterstrokeSecondLineX+130 && mouseX < masterstrokeSecondLineX+150) {
    if (mouseY > masterstrokeSecondLineY-20 && mouseY < masterstrokeSecondLineY) {
        println("triggeredmark");
        updatePermutation();
        mark8();
    }
  }
  }
  
  if (whichMark == 9) {
    
     if (mouseX > masterstrokeSecondLineX+150 && mouseX < masterstrokeSecondLineX+170) {
    if (mouseY > masterstrokeSecondLineY-20   && mouseY < masterstrokeSecondLineY) {
        println("triggeredmark");
        updatePermutation();
        mark9();
    }
  }
  }
  
  if (whichMark == 10) {
    
     if (mouseX > masterstrokeSecondLineX+170 && mouseX < masterstrokeSecondLineX+190) {
    if (mouseY > masterstrokeSecondLineY-20   && mouseY < masterstrokeSecondLineY) {
        println("triggeredmark");
        updatePermutation();
        mark10();
    }
  }  
  }
  
  
  if (whichMark == 11) {
    
     if (mouseX > masterstrokeSecondLineX+190 && mouseX < masterstrokeSecondLineX+210) {
    if (mouseY > masterstrokeSecondLineY-20   && mouseY < masterstrokeSecondLineY) {
        println("triggeredmark");
        updatePermutation();
        mark11();
    }
  }
  }
    
   if (whichMark == 12) {
     
      if (mouseX > masterstrokeSecondLineX+210 && mouseX < masterstrokeSecondLineX+230) {
    if ( mouseY > masterstrokeSecondLineY-20   && mouseY < masterstrokeSecondLineY) {
        println("triggeredmark 12!");
        updatePermutation();
        mark12();
     }
   }
}
}

  
void mark1() {
  
  float thisMarkIntensity = markIntensityArray[0];
  //thisMagicNumber = markMagicNumberArray[0]/1000;
    
     if (randomMode == 1 )  {
        thisMarkIntensity = random(0,100);
        thisMagicNumber = random (3.5,6);
        markIntensityArray[0] = (int)thisMarkIntensity;
   }
  
  whichMark = 1;
     
    // the interiorest ellipses.. darkish texture for the navel itself.
    for (int i = 0;i<1*amplification*thisMarkIntensity*1;i++){
      noFill();
      float variation = random (5,490);
      strokeWeight (variation/10);
      float scalar = random (1,2);
      float speed = random (.02);
      float angle = 0;
      float arcX = width/2;
      float arcY = height/thisMagicNumber;
      float arcSize = width/4.618+variation;
      stroke (random(155,255),random(90),random(100),random(6));
      strokeWeight (random(thisMagicNumber*2));
      float Xoffset = random (-890,890); 
      float Yoffset = random (-1060,1060); 
      float x = arcX + Xoffset + cos(angle) * scalar;
      float y = arcY + Yoffset + sin(angle) * scalar;
      ellipse (x, y, arcSize, arcSize); 
      angle += speed;
      scalar += speed;  
   }
   if (makeThumbnails == 1 )  {
          background(thumbnailBackgroundR,thumbnailBackgroundG,thumbnailBackgroundB);
       
          for (int i = 0;i<1*amplification*500;i++){
               noFill();
                float variation = random (5,490);
                strokeWeight (variation/10);
                float scalar = random (1,2);
                float speed = random (.02);
                float angle = 0;
                float arcX = width/2;
                float arcY = height/thisMagicNumber;
                float arcSize = width/4.618+variation;
                stroke (random(155,255),random(90),random(100),random(9));
                strokeWeight (random(10));
                float Xoffset = random (-890,890); 
                float Yoffset = random (-1060,1060); 
                float x = arcX + Xoffset + cos(angle) * scalar;
                float y = arcY + Yoffset + sin(angle) * scalar;
                ellipse (x, y, arcSize, arcSize); 
                angle += speed;
                scalar += speed;  
         }
           saveFrame ("data/NAVEL MARKS_button_1.jpg");
    }
}

void mark2()  {
     
      float thisMarkIntensity = markIntensityArray[1];
     //thisMagicNumber = markMagicNumberArray[1]/1000;
    
    
    if (randomMode == 1 )  {
          thisMarkIntensity = random(0,100);
          thisMagicNumber = random (2.1,magicRandomHigh);
          markIntensityArray[1] = (int)thisMarkIntensity;
    }
      whichMark = 2;
    // drawControlPanel();
     noFill();
     // chaotic cen887tral blast of blue
    for (int i = 0;i<1*amplification*thisMarkIntensity*1;i++)  {
     
         float variation = random (190);
         strokeWeight (variation/20);
         float scalar = random (1,2);
         float speed = random (.02);
         float angle = random (360);
         float arcX = (width/2)+random(-500,500);
         float arcY = ((height/thisMagicNumber)+random(-500,420));
         float arcSize = width/5.618+variation;
         stroke (random(0,120),random(0,125),random(125,255),random(5));    
         strokeWeight (random(12));
         float Xoffset = random (-830,830); 
         float Yoffset = random (-870,870); 
         float x = arcX + Xoffset + cos(angle) * scalar;
         float y = arcY + Yoffset + sin(angle) * scalar;
         angle += speed;
         scalar += speed;
         float arcLength = random (6.28);
         float startRadian = arcLength-(random(arcLength));
         float endRadian = arcLength+(random(arcLength));
         arc (x,y,arcSize,arcSize+variation,startRadian,endRadian);
     }
     
     if (makeThumbnails == 1 )  {
           
        background(thumbnailBackgroundR,thumbnailBackgroundG,thumbnailBackgroundB);
       
         for (int i = 0;i<1*amplification*600;i++)  {
     
           float variation = random (190);
           strokeWeight (variation/20);
           float scalar = random (1,2);
           float speed = random (.02);
           float angle = random (360);
           float arcX = (width/2)+random(-500,500);
           float arcY = ((height/thisMagicNumber)+random(-500,420));
           float arcSize = width/5.618+variation;
           stroke (random(0,120),random(0,125),random(125,255),random(8));    
           strokeWeight (random(12));
           float Xoffset = random (-830,830); 
           float Yoffset = random (-870,870); 
           float x = arcX + Xoffset + cos(angle) * scalar;
           float y = arcY + Yoffset + sin(angle) * scalar;
           angle += speed;
           scalar += speed;
           float arcLength = random (6.28);
           float startRadian = arcLength-(random(arcLength));
           float endRadian = arcLength+(random(arcLength));
           arc (x,y,arcSize,arcSize+variation,startRadian,endRadian);
        }
      saveFrame ("data/NAVEL MARKS_button_2.jpg");
    }
}  
  
 void mark3() {
  
     float thisMarkIntensity =markIntensityArray[2];
    //thisMagicNumber = markMagicNumberArray[2]/1000;
  
      if (randomMode == 1 )  {
           thisMarkIntensity = random(0,100);
           thisMagicNumber = random (3,magicRandomHigh);
           markIntensityArray[2] = (int)thisMarkIntensity;
       }
     
       whichMark = 3;
       // drawControlPanel();
       noFill();
    
       //   broader central reddish fuzz patch - creates indentation  
       for (int i = 0;i<amplification*thisMarkIntensity*1;i++){   
           float startRadian = random (6.28);
           float endRadian = startRadian + random (6.28);
           float variation = random(40,290);
           strokeWeight (variation/10);
           float scalar = random (1,2);
           float speed = random (.02);
           float angle = 0;
           float arcX = width/2;
           float arcY = height/(thisMagicNumber+.618);
           float arcSize = width/1.8+variation;
           stroke (random(155,200),random(20,130),random(20,130),random(3));       
           float Xoffset = random (-width/3,width/3); 
           float Yoffset = random (-width/3,width/3); 
           float x = arcX + Xoffset + cos(angle) * scalar;
           float y = arcY + Yoffset + sin(angle) * scalar;
           ellipse (x, y, arcSize, arcSize);
           angle += speed;
           scalar += speed;
           strokeWeight (random(10));
       }
    
       if (makeThumbnails == 1 )  {
           
         background(thumbnailBackgroundR,thumbnailBackgroundG,thumbnailBackgroundB);
       
         for (int i = 0;i<amplification*800;i++){   
            float startRadian = random (6.28);
            float endRadian = startRadian + random (6.28);
            float variation = random(40,290);
            strokeWeight (variation/10);
            float scalar = random (1,2);
            float speed = random (.02);
            float angle = 0;
            float arcX = width/2;
            float arcY = height/(thisMagicNumber+.618);
            float arcSize = width/1.8+variation;
            stroke (random(155,200),random(20,130),random(20,130),random(6));       
            float Xoffset = random (-width/3,width/3); 
            float Yoffset = random (-width/3,width/3); 
            float x = arcX + Xoffset + cos(angle) * scalar;
            float y = arcY + Yoffset + sin(angle) * scalar;
            ellipse (x, y, arcSize, arcSize);
            angle += speed;
            scalar += speed;
            strokeWeight (random(10));
        }
       saveFrame ("data/NAVEL MARKS_button_3.jpg");    
    }
}
  
void mark4() {
    
     float thisMarkIntensity =markIntensityArray[3];
    // thisMagicNumber = markMagicNumberArray[3]/1000;
     if (randomMode == 1 )  {
        thisMarkIntensity = random(1,100);
        thisMagicNumber = random (3.5,magicRandomHigh);
        markIntensityArray[3] = (int)thisMarkIntensity;
     }
     whichMark = 4;
    
     noFill();
    
     // larger lower version of inner ring  -  for highlight
     for (int i = 0;i<1*amplification*thisMarkIntensity*1;i++)  {
          noFill();
          float startRadian = random (6.28);
          float endRadian = startRadian + random (6.28);
          float variation = random (2,200);
          strokeWeight (variation/10);
          float scalar = random (1,3);
          float speed = random (.02);
          float angle = 0;
          float arcX = width/2;
          float arcY = height/thisMagicNumber;
          float arcSize = width/3.4+variation;
          stroke (random(195,255),random(190,225),random(140,170),random(5));
          float Xoffset = random (-width/1.7,width/1.7); 
          float Yoffset = random (-height/1.9,height/1.9); 
          float x = arcX + Xoffset + cos(angle) * scalar;
          float y = arcY + Yoffset + sin(angle) * scalar;
          ellipse (x, y, arcSize, arcSize);
          angle += speed;
          scalar += speed;
          strokeWeight (random(10));
      }
    
     if (makeThumbnails == 1 )  {
           
         background(thumbnailBackgroundR,thumbnailBackgroundG,thumbnailBackgroundB);
       
       
          for (int i = 0;i<1*amplification*400;i++)  {
                      noFill();
                      float startRadian = random (6.28);
                      float endRadian = startRadian + random (6.28);
                      float variation = random (2,200);
                      strokeWeight (variation/10);
                      float scalar = random (1,3);
                      float speed = random (.02);
                      float angle = 0;
                      float arcX = width/2;
                      float arcY = height/thisMagicNumber;
                      float arcSize = width/3.4+variation;
                      stroke (random(195,255),random(190,225),random(140,170),random(8));
                      float Xoffset = random (-width/1.7,width/1.7); 
                      float Yoffset = random (-height/1.9,height/1.9); 
                      float x = arcX + Xoffset + cos(angle) * scalar;
                      float y = arcY + Yoffset + sin(angle) * scalar;
                      ellipse (x, y, arcSize, arcSize);
                      angle += speed;
                      scalar += speed;
                      strokeWeight (random(10));
           }
       
       saveFrame ("data/NAVEL MARKS_button_4.jpg");
         
    }
    
    
    
}


void mark5() {
  
  float thisMarkIntensity =markIntensityArray[4];
  //thisMagicNumber = markMagicNumberArray[4]/1000;
     if (randomMode == 1 )  {
      thisMarkIntensity = random(1,100);
      thisMagicNumber = random (magicRandomLow,magicRandomHigh);
      markIntensityArray[4] = (int)thisMarkIntensity;
    }
       whichMark = 5;
       
       noFill();
       
       // LIGHT BLUE WISPS above navel
       // here's an attempt to take the above and repurpose for sketchy arching shading strokes above navel knot
       // not liking the look of these (too orderly in their beginnings
      
       for (int x = 1;x<amplification*thisMarkIntensity;x++) { 
         float crevasse1xBegin = width/2  - (navelSize - random (navelSize/2-navelSize/1.1,navelSize/1.3));
         float crevasse1yBegin = height/2 - random (navelSize/thisMagicNumber,navelSize+thisMagicNumber*5);
         float crevasse1xEnd = (width/2) + (navelSize -random (navelSize/2-navelSize/1.6,navelSize/1.3));
         float crevasse1yEnd = height/2 - random (navelSize/thisMagicNumber,navelSize+thisMagicNumber*5);
         float crevasse1cp1X = crevasse1xBegin + random (navelSize/2); 
         float crevasse1cp1Y = crevasse1yBegin - random (350,navelSize+200); 
         float crevasse1cp2X = crevasse1xEnd - random (navelSize/2); 
         float crevasse1cp2Y = crevasse1yEnd - random (350,navelSize+200); 
         stroke (random(20,40),random(30),random(20,40),random(1,4));
         strokeWeight (random (3,12));
         bezier (crevasse1xBegin,crevasse1yBegin,crevasse1cp1X,crevasse1cp1Y,crevasse1cp2X,crevasse1cp2Y,crevasse1xEnd,crevasse1yEnd);
     }
     
     
     
         if (makeThumbnails == 1 )  {
           
         background(thumbnailBackgroundR,thumbnailBackgroundG,thumbnailBackgroundB);
       
       
       for (int x = 1;x<amplification*500;x++) { 
         float crevasse1xBegin = width/2  - (navelSize - random (navelSize/2-navelSize/1.6,navelSize/1.3));
         float crevasse1yBegin = height/2 - random (navelSize/thisMagicNumber,navelSize);
         float crevasse1xEnd = (width/2) + (navelSize -random (navelSize/2-navelSize/1.6,navelSize/1.3));
         float crevasse1yEnd = crevasse1yBegin - random (-navelSize/5,navelSize/5);
         float crevasse1cp1X = crevasse1xBegin + random (navelSize/2); 
         float crevasse1cp1Y = crevasse1yBegin - random (350,navelSize+200); 
         float crevasse1cp2X = crevasse1xEnd - random (navelSize/2); 
         float crevasse1cp2Y = crevasse1yEnd - random (350,navelSize+200); 
         stroke (random(20,40),random(30),random(20,40),random(1,8));
         strokeWeight (random (3,12));
         bezier (crevasse1xBegin,crevasse1yBegin,crevasse1cp1X,crevasse1cp1Y,crevasse1cp2X,crevasse1cp2Y,crevasse1xEnd,crevasse1yEnd);
        }
         
       saveFrame ("data/NAVEL MARKS_button_5.jpg");
    }
}
  
void mark6() {
      noFill();
      whichMark = 6;
      float thisMarkIntensity =markIntensityArray[5];
      //thisMagicNumber = markMagicNumberArray[5]/1000;
      if (randomMode == 1 )  {
         thisMarkIntensity = random(1,100);
         thisMagicNumber = random (magicRandomLow,magicRandomHigh);
         markIntensityArray[5] = (int)thisMarkIntensity;
      }
      
      // under wisps
      for (int x = 0;x<amplification*thisMarkIntensity*1;x++) {
           float crevasse1xBegin = (width/2) - (navelSize - random ((navelSize/6)/thisMagicNumber+40,navelSize-random(thisMagicNumber*3)));
           float crevasse1yBegin = height/2 + height/thisMagicNumber - random (navelSize/(thisMagicNumber*1.4),navelSize/(thisMagicNumber*.4));
           float crevasse1xEnd = (width/2) + (navelSize - random ((navelSize/6)/thisMagicNumber+40,navelSize-random(thisMagicNumber*3)));
           float crevasse1yEnd = crevasse1yBegin + random (-100,100);
           float crevasse1cp1X = crevasse1xBegin + random (navelSize/2); 
           float crevasse1cp1Y = crevasse1yBegin + random (350,(navelSize+navelMargin));   
           float crevasse1cp2X = crevasse1xEnd - random (navelSize/2); 
           float crevasse1cp2Y = crevasse1yEnd + random (350,(navelSize+navelMargin)); 
           stroke (random(10,30),random(20),random(10,20),random(2));
           strokeWeight (random (3,10));
           bezier (crevasse1xBegin,crevasse1yBegin,crevasse1cp1X,crevasse1cp1Y,crevasse1cp2X,crevasse1cp2Y,crevasse1xEnd,crevasse1yEnd);
      }
      
       if (makeThumbnails == 1 )  {
           background(thumbnailBackgroundR,thumbnailBackgroundG,thumbnailBackgroundB);
       
           for (int x = 0;x<amplification*600;x++) {
                float crevasse1xBegin = (width/2) - (navelSize - random ((navelSize/2)/thisMagicNumber+40,navelSize/thisMagicNumber+40));
                float crevasse1yBegin = height/2 + height/thisMagicNumber - random (navelSize/(thisMagicNumber*1.4),navelSize/(thisMagicNumber*.4));
                float crevasse1xEnd = (width/2) + (navelSize - random ((navelSize/2)/magicNumber,navelSize/magicNumber));
                float crevasse1yEnd = crevasse1yBegin + random (-100,100);
                float crevasse1cp1X = crevasse1xBegin + random (navelSize/2); 
                float crevasse1cp1Y = crevasse1yBegin + random (350,(navelSize+navelMargin));   
                float crevasse1cp2X = crevasse1xEnd - random (navelSize/2); 
                float crevasse1cp2Y = crevasse1yEnd + random (350,(navelSize+navelMargin)); 
                stroke (random(10,30),random(20),random(10,20),random(7));
                strokeWeight (random (3,10));
                bezier (crevasse1xBegin,crevasse1yBegin,crevasse1cp1X,crevasse1cp1Y,crevasse1cp2X,crevasse1cp2Y,crevasse1xEnd,crevasse1yEnd);
             }
       saveFrame ("data/NAVEL MARKS_button_6.jpg");
     }
}
  
void mark7() {
  
      float thisMarkIntensity = markIntensityArray[6];
      //thisMagicNumber = markMagicNumberArray[6]/1000;
      if (randomMode == 1 )  {
         thisMarkIntensity = random(1,100);
         thisMagicNumber = random (magicRandomLow,magicRandomHigh);
         markIntensityArray[6] = (int)thisMarkIntensity;
    }
     whichMark = 7;
     
     noFill();
     // the largest arc that goes off to the edges (shading the bottom 
    for (int i = 0;i<amplification*thisMarkIntensity*1;i++)  {
      float startRadian = random (6.28);
      float endRadian = startRadian + random (6.28);
      float variation = random (300,2090);
      strokeWeight (variation/100);
      float scalar = random (1,2);
      float speed = random (.02);
      float angle = 0; 
      float arcX = width/2;
      float arcY = height/thisMagicNumber;
      float arcSize = width/.903+variation;
      stroke (random(20,95),random(0,50),random(20,100),random(3));
      float Xoffset = random (-990,990); 
      float Yoffset = random (-1060,1060); 
      float x = arcX + Xoffset + cos(angle) * scalar;
      float y = arcY + Yoffset + sin(angle) * scalar;
      ellipse (x, y, arcSize, arcSize*1.125);
      angle += speed;
      scalar += speed;
     
   }
   
       if (makeThumbnails == 1 )  {
           
          background(thumbnailBackgroundR,thumbnailBackgroundG,thumbnailBackgroundB);
       
       
       for (int i = 0;i<amplification*900;i++)  {
                 float startRadian = random (6.28);
                  float endRadian = startRadian + random (6.28);
                  float variation = random (300,2090);
                  strokeWeight (variation/100);
                  float scalar = random (1,2);
                  float speed = random (.02);
                  float angle = 0; 
                  float arcX = width/2;
                  float arcY = height/thisMagicNumber;
                  float arcSize = width/.903+variation;
                  stroke (random(20,95),random(0,50),random(20,100),random(8));
                  float Xoffset = random (-990,990); 
                  float Yoffset = random (-1060,1060); 
                  float x = arcX + Xoffset + cos(angle) * scalar;
                  float y = arcY + Yoffset + sin(angle) * scalar;
                  ellipse (x, y, arcSize, arcSize*1.125);
                  angle += speed;
                  scalar += speed;
                  
        }

       saveFrame ("data/NAVEL MARKS_button_7.jpg");
    }
}
  
void mark8() {
  
   float thisMarkIntensity =markIntensityArray[7];
   //thisMagicNumber = markMagicNumberArray[7]/1000;
   
   if (randomMode == 1 )  {
      thisMarkIntensity = random(1,100);
      thisMagicNumber = random (3,5);
      markIntensityArray[7] = (int)thisMarkIntensity;
    }
   
    whichMark = 8;
    noFill();
    
    // inner ring  -  reddish shading
    for (int i = 0;i<amplification*thisMarkIntensity;i++)  {
       
       float startRadian = random (6.28);
       float endRadian = startRadian + random (6.28);
       float variation = random (thisMagicNumber/3);
       strokeWeight (random(.5,variation*(thisMagicNumber)));
       float scalar = random (1,2);
       float speed = random (.02);
       float angle = 0;   
       float arcX = width/2+thisMagicNumber/3;
       float arcY = height/2-thisMagicNumber*10;
       float arcSize = width/(random(1.2+thisMagicNumber));
       stroke (random(6),random(4),random(3),random(9));
       float Xoffset = random (-width/19,width/19); 
       float Yoffset = random (-height/14,height/14);
       float x = arcX + Xoffset + cos(angle) * scalar;
       float y = arcY + Yoffset + sin(angle) * scalar;
       ellipse (x, y, arcSize+(random(thisMagicNumber*thisMagicNumber)),arcSize + random(-thisMagicNumber,thisMagicNumber));
       angle += speed;
       scalar += speed;
    }
   
   if (makeThumbnails == 1 )  {
           
        background(thumbnailBackgroundR,thumbnailBackgroundG,thumbnailBackgroundB);
       
      for (int i = 0;i<amplification*300;i++)  {
             float startRadian = random (6.28);
             float endRadian = startRadian + random (6.28);
             float variation = random (0,thisMagicNumber);
             strokeWeight (random(1,variation));
             float scalar = random (1,2);
             float speed = random (.02);
             float angle = 0;   
             float arcX = width/2+thisMagicNumber/3;
             float arcY = height/2-thisMagicNumber*10;
             float arcSize = width/2.98+variation;
             stroke (random(0,10),random(0,10),random(0,5),random(7));
             float Xoffset = random (-width/19,width/19); 
             float Yoffset = random (-height/14,height/14); 
             float x = arcX + Xoffset + cos(angle) * scalar;
             float y = arcY + Yoffset + sin(angle) * scalar;
             ellipse (x, y, arcSize, arcSize);
             angle += speed;
             scalar += speed;
       }   
       saveFrame ("data/NAVEL MARKS_button_8.jpg");   
    }
}
  
  
  

 
//void mark7() {
//    noFill();
    
//    float thisMarkIntensity =markIntensityArray[6];
//     if (randomMode == 1 )  {
//      thisMarkIntensity = random(0,100);
//      markIntensityArray[6] = (int)thisMarkIntensity;
//    }
//    whichMark = 7;
    
//     // central fuzz pattern
//    for (int i = 0;i<amplification*thisMarkIntensity*1;i++)  {
//      float variation = random (490);
//      strokeWeight (variation/20);
//      float scalar = random (1,2);
//      float speed = random (.02);
//      float angle = random (360);
//      float arcX = (width/2)+random(-200,200);
//      float arcY = ((height/2)+random(-300,220));
//      float arcSize = width/5.618+variation;
//      stroke (random(120),random(125),random(125,255),random(1,4));
//      strokeWeight (random(20));
//      float Xoffset = random (-830,830); 
//      float Yoffset = random (-870,870); 
//      float x = arcX + Xoffset + cos(angle) * scalar;
//      float y = arcY + Yoffset + sin(angle) * scalar;
//      angle += speed;
//      scalar += speed;
//      float arcLength = random (6.28);
//      float startRadian = arcLength-(random(arcLength));
//      float endRadian = arcLength+(random(arcLength));
//      arc (x,y,arcSize,arcSize+variation,startRadian,endRadian);
//   }
   
//       if (makeThumbnails == 1 )  {
           
//         background(thumbnailBackgroundR,thumbnailBackgroundG,thumbnailBackgroundB);
       
       
//       for (int i = 0;i<amplification*3000;i++)  {
//            float variation = random (490);
//            strokeWeight (variation/20);
//            float scalar = random (1,2);
//            float speed = random (.02);
//            float angle = random (360);
//            float arcX = (width/2)+random(-200,200);
//            float arcY = ((height/2)+random(-300,220));
//            float arcSize = width/5.618+variation;
//            stroke (random(120),random(125),random(125,255),random(1,4));
//            strokeWeight (random(20));
//            float Xoffset = random (-830,830); 
//            float Yoffset = random (-870,870); 
//            float x = arcX + Xoffset + cos(angle) * scalar;
//            float y = arcY + Yoffset + sin(angle) * scalar;
//            angle += speed;
//            scalar += speed;
//            float arcLength = random (6.28);
//            float startRadian = arcLength-(random(arcLength));
//            float endRadian = arcLength+(random(arcLength));
//            arc (x,y,arcSize,arcSize+variation,startRadian,endRadian);
//        }
         
       
//       saveFrame ("data/NAVEL MARKS_button_7.jpg");
         
//    }
//}
  
void mark9() {
    noFill();
    
    float thisMarkIntensity = markIntensityArray[8];
   // thisMagicNumber = markMagicNumberArray[8]/1000;
     if (randomMode == 1 )  {
        thisMarkIntensity = random(1,100);
        thisMagicNumber = random (magicRandomLow,magicRandomHigh);
        markIntensityArray[8] = (int)thisMarkIntensity;
    }
    whichMark = 9;
    // SMALLER version of inner ring  -  for highlight
    for (int i = 1;i<amplification*thisMarkIntensity*1;i++)  {
      float startRadian = random (6.28);
      float endRadian = startRadian + random (6.28);
      float variation = random (2,390);
      strokeWeight (variation/8);
      float scalar = random (1,3);
      float speed = random (.02);
      float angle = 0;
      float arcX = width/2;
      float arcY = (height/thisMagicNumber)-80;
      float arcSize = (width/12)+variation;
      stroke (random(155,215),random(150,195),random(100,130),random(2));
      float Xoffset = random (-width/9,width/9); 
      float Yoffset = random (-height/7,height/7); 
      float x = arcX + Xoffset + cos(angle) * scalar;
      float y = arcY + Yoffset + sin(angle) * scalar+150;
      
      ellipse (x, y, arcSize, arcSize);
      angle += speed;
      scalar += speed;
   }
   
       if (makeThumbnails == 1 )  {
           
         background(thumbnailBackgroundR,thumbnailBackgroundG,thumbnailBackgroundB);
       
       for (int i = 1;i<amplification*600;i++)  {
         float startRadian = random (6.28);
      float endRadian = startRadian + random (6.28);
      float variation = random (2,390);
      strokeWeight (variation/8);
      float scalar = random (1,3);
      float speed = random (.02);
      float angle = 0;
      float arcX = width/2;
      float arcY = (height/thisMagicNumber)-80;
      float arcSize = (width/12)+variation;
      stroke (random(155,235),random(150,205),random(100,150),random(3));
      float Xoffset = random (-width/9,width/9); 
      float Yoffset = random (-height/7,height/7); 
      float x = arcX + Xoffset + cos(angle) * scalar;
      float y = arcY + Yoffset + sin(angle) * scalar+150;
      
      ellipse (x, y, arcSize, arcSize);
      angle += speed;
      scalar += speed;
         }
       saveFrame ("data/NAVEL MARKS_button_9.jpg");
     }
}
  
 void mark10() {
    noFill();
     
   float thisMarkIntensity = markIntensityArray[9];
  // thisMagicNumber = markMagicNumberArray[9]/1000;
     if (randomMode == 1 )  {
      thisMarkIntensity = random(1,100);
      thisMagicNumber = random (magicRandomLow,magicRandomHigh);
      markIntensityArray[9] = (int)thisMarkIntensity;
    }
    whichMark = 10;
    
    // navel knot (outer
    for (int i = 1;i<amplification*thisMarkIntensity*1;i++)  {
      
      float startRadian = random (6.28);
      float endRadian = startRadian + random (6.28);
      float variation = random (2,390);
      strokeWeight(random(variation/13,variation/thisMagicNumber));
      float scalar = random (1,5);
      float speed = random (.02);
      float angle = 0;
      float arcX = width/2;
      float arcY = (height/thisMagicNumber)-80;
      float arcSize = (width/7)+variation;
      stroke (random(155,215),random(150,205),random(140,190),random(2));
      float Xoffset = random (-width/9,width/9); 
      float Yoffset = random (-height/7,height/7); 
      float x = arcX + Xoffset + cos(angle) * scalar;
      float y = arcY + Yoffset + sin(angle) * scalar +150;
      
      ellipse (x, y, arcSize, arcSize);
      angle += speed;
      scalar += speed;
   }  
   
   
       if (makeThumbnails == 1 )  {
           
          background(thumbnailBackgroundR,thumbnailBackgroundG,thumbnailBackgroundB);
       
       
      for (int i = 1;i<amplification*600;i++)  {
      
      float startRadian = random (6.28);
      float endRadian = startRadian + random (6.28);
      float variation = random (2,390);
      strokeWeight(random(variation/13,variation/5));
      float scalar = random (1,5);
      float speed = random (.02);
      float angle = 0;
      float arcX = width/2;
      float arcY = (height/thisMagicNumber)-80;
      float arcSize = (width/7)+variation;
      stroke (random(155,245),random(150,245),random(100,210),random(7));
      float Xoffset = random (-width/9,width/9); 
      float Yoffset = random (-height/7,height/7); 
      float x = arcX + Xoffset + cos(angle) * scalar;
      float y = arcY + Yoffset + sin(angle) * scalar+159;
      
      ellipse (x, y, arcSize, arcSize);
      angle += speed;
      scalar += speed;
   } 
         
     saveFrame ("data/NAVEL MARKS_button_10.jpg");  
      
   }
}

void mark11() {
  
     float thisMarkIntensity = markIntensityArray[10];
     //thisMagicNumber = markMagicNumberArray[10]/1000;
      if (randomMode == 1 ) {
         thisMarkIntensity = random(0,100);
         thisMagicNumber = random (1.6,2.3);
         markIntensityArray[10] = (int)thisMarkIntensity;
       }
    
     whichMark = 11;
     noFill();
     for (int b=1;b<amplification*thisMarkIntensity*1;b++) {   //was 110
        crevasse1xBegin = width/2 - random (navelSize-navelMargin+width/10);
        crevasse1yBegin = height/thisMagicNumber + random (-navelSize/thisMagicNumber,navelSize*thisMagicNumber-width/10);
        crevasse1xEnd = (width/2) + navelSize + random (-navelSize-navelMargin ,navelSize-navelMargin);
        crevasse1yEnd = crevasse1yBegin + random (-navelSize/thisMagicNumber,navelSize*thisMagicNumber-width/10);
        float crevasse1cp1X = crevasse1xBegin + random (navelSize/1.3); 
        float crevasse1cp1Y = crevasse1yBegin - random (40,navelSize/thisMagicNumber); 
        float crevasse1cp2X = crevasse1xEnd - random (navelSize/1.3); 
        float crevasse1cp2Y = crevasse1yEnd - random (40,navelSize/thisMagicNumber); 
        strokeWeight (random (1,3));
        float distanceFromCenterBegin = dist (crevasse1xBegin,crevasse1yBegin,width/2,height/2.2);
        float distanceFromCenterEnd = dist (crevasse1xEnd,crevasse1yEnd,width/2,height/thisMagicNumber);
        float crevasseAlpha = random (5,30);   // was 46
        
        if ((distanceFromCenterBegin <= (navelSize-(navelMargin+240))) && (distanceFromCenterEnd <= (navelSize-(navelMargin+250))) && (distanceFromCenterEnd < navelSize-(navelMargin+30))) {         
          
           int howThick = (int)random(9,1200);
           for (int m = 0;m<howThick;m=m+2)  {
               strokeWeight (random (0,thisMagicNumber));
              
               float thicker = random(100);
               if (thicker > 90) {
                   strokeWeight (random (1,4));
               }
              
               //stroke (random(89,180),random(59,89),random(49,99),crevasseAlpha);
              
               stroke (random(60,110),random(30,70),random(7,50),random(crevasseAlpha));
               bezier (crevasse1xBegin+random(-m/100,m/100),crevasse1yBegin-40+random(-m/100,m/100),crevasse1cp1X+random(-m,m),crevasse1cp1Y-60+random(-m,m),crevasse1cp2X+random(-m,m),crevasse1cp2Y-60+random(-m,m),crevasse1xEnd+random(-m/10,m/10),crevasse1yEnd-40+random(-m/100,m/100));
  
               crevasseAlpha=crevasseAlpha-.4;
            }
         }
     }
     
     if (makeThumbnails == 1 )  {
           
          background(thumbnailBackgroundR,thumbnailBackgroundG,thumbnailBackgroundB);
       
          for (int b=1;b<amplification*800;b++) {   //was 110
                 crevasse1xBegin = width/2 - random (navelSize-navelMargin+width/10);
                 crevasse1yBegin = height/thisMagicNumber + random (-navelSize/thisMagicNumber,navelSize*thisMagicNumber-width/10);
                 crevasse1xEnd = (width/2) + navelSize + random (-navelSize-navelMargin ,navelSize-navelMargin);
                 crevasse1yEnd = crevasse1yBegin + random (-navelSize-navelMargin,navelSize-navelMargin);
                 float crevasse1cp1X = crevasse1xBegin + random (navelSize/1.3); 
                 float crevasse1cp1Y = crevasse1yBegin - random (40,navelSize/thisMagicNumber); 
                 float crevasse1cp2X = crevasse1xEnd - random (navelSize/1.3); 
                 float crevasse1cp2Y = crevasse1yEnd - random (40,navelSize/thisMagicNumber); 
                 strokeWeight (random (1,3));
                 float distanceFromCenterBegin = dist (crevasse1xBegin,crevasse1yBegin,width/2,height/thisMagicNumber);
                 float distanceFromCenterEnd = dist (crevasse1xEnd,crevasse1yEnd,width/2,height/thisMagicNumber);
                 float crevasseAlpha = random (5,30);   // was 46
        
        
                 if ((distanceFromCenterBegin <= (navelSize-(navelMargin+200))) && (distanceFromCenterEnd <= (navelSize-(navelMargin+200))) && (distanceFromCenterEnd<navelSize-(navelMargin+10))) {         
          
                      int howThick = (int)random (9,900);
                
                       for (int m = 0;m<howThick;m=m+3)  {
                             strokeWeight (random (0,3));
                             float thicker = random(100);
               
                            if (thicker > 90) {
                                 strokeWeight (random (1,4));
                            }
              
                            //stroke (random(89,180),random(59,89),random(49,99),crevasseAlpha);
              
                            stroke (random(100,120),random(20,40),random(30,50),random(crevasseAlpha)+4);
                            bezier (crevasse1xBegin+random(-m/100,m/100),crevasse1yBegin-80+random(-m/100,m/100),crevasse1cp1X+random(-m,m),crevasse1cp1Y-40+random(-m,m),crevasse1cp2X+random(-m,m),crevasse1cp2Y-40+random(-m,m),crevasse1xEnd+random(-m/10,m/10),crevasse1yEnd-80+random(-m/100,m/100));
  
                            crevasseAlpha=crevasseAlpha-1;
                        }
                  }
           }
           saveFrame ("data/NAVEL MARKS_button_-.jpg");
      }   
}
  
void mark12() {
  
     float thisMarkIntensity = markIntensityArray[11];
     //thisMagicNumber = markMagicNumberArray[11]/1000;
      if (randomMode == 1 ) {
         thisMarkIntensity = random(1,100);
         thisMagicNumber = random (3,5);
         markIntensityArray[11] = (int)thisMarkIntensity;
    }
    
     whichMark = 12;
     noFill();
     for (int b=1;b<amplification*thisMarkIntensity*1;b++) {   //was 110
        crevasse1xBegin = width/2 - random (navelSize-navelMargin+width/10);
        crevasse1yBegin = height/thisMagicNumber + random (-navelSize/thisMagicNumber,navelSize*thisMagicNumber-width/10);
        crevasse1xEnd = (width/2) + navelSize + random (-navelSize-navelMargin ,navelSize-navelMargin);
        crevasse1yEnd = crevasse1yBegin + random (-navelSize-navelMargin,navelSize-navelMargin);
        float crevasse1cp1X = crevasse1xBegin + random (navelSize/1.3); 
        float crevasse1cp1Y = crevasse1yBegin - random (40,navelSize/thisMagicNumber); 
        float crevasse1cp2X = crevasse1xEnd - random (navelSize/1.3); 
        float crevasse1cp2Y = crevasse1yEnd - random (40,navelSize/thisMagicNumber); 
        strokeWeight (random (1,3));
        float distanceFromCenterBegin = dist (crevasse1xBegin,crevasse1yBegin,width/2,height/thisMagicNumber);
        float distanceFromCenterEnd = dist (crevasse1xEnd,crevasse1yEnd,width/2,height/thisMagicNumber);
        float crevasseAlpha = random (5,30);   // was 46
        
        if ((distanceFromCenterBegin <= (navelSize-(navelMargin+200))) && (distanceFromCenterEnd <= (navelSize-(navelMargin+200))) && (crevasse1yEnd-40>height/magicNumber-40)) {         
          
           int howThick = (int)random(9,1200);
           for (int m = 0;m<howThick;m=m+4)  {
               strokeWeight (random (0,3));
              
               float thicker = random(100);
               if (thicker > 90) {
                   strokeWeight (random (1,3));
               }
              
               //stroke (random(89,180),random(59,89),random(49,99),crevasseAlpha);
              
               stroke (random(190,220),random(180,230),random(150,240),random(crevasseAlpha)-5);
               bezier (crevasse1xBegin+random(-m,m),crevasse1yBegin-80+random(-m,m),crevasse1cp1X+random(-m,m),crevasse1cp1Y-40+random(-m,m),crevasse1cp2X+random(-m,m),crevasse1cp2Y-40+random(-m,m),crevasse1xEnd+random(-m,m),crevasse1yEnd-80+random(-m,m));
  
               crevasseAlpha=crevasseAlpha-1;
            }
         }
     }
     
     if (makeThumbnails == 1 )  {
           
          background(thumbnailBackgroundR-20,thumbnailBackgroundG-20,thumbnailBackgroundB-20);
       
          for (int b=1;b<amplification*thisMarkIntensity*610;b++) {   //was 110
         crevasse1xBegin = width/2 - random (navelSize-navelMargin+width/10);
        crevasse1yBegin = height/thisMagicNumber + random (-navelSize/thisMagicNumber,navelSize*thisMagicNumber-width/10);
        crevasse1xEnd = (width/2) + navelSize + random (-navelSize-navelMargin ,navelSize-navelMargin);
        crevasse1yEnd = crevasse1yBegin + random (-navelSize-navelMargin,navelSize-navelMargin);
        float crevasse1cp1X = crevasse1xBegin + random (navelSize/1.3); 
        float crevasse1cp1Y = crevasse1yBegin - random (40,navelSize/thisMagicNumber); 
        float crevasse1cp2X = crevasse1xEnd - random (navelSize/1.3); 
        float crevasse1cp2Y = crevasse1yEnd - random (40,navelSize/thisMagicNumber); 
        strokeWeight (random (1,3));
        float distanceFromCenterBegin = dist (crevasse1xBegin,crevasse1yBegin,width/2,height/thisMagicNumber);
        float distanceFromCenterEnd = dist (crevasse1xEnd,crevasse1yEnd,width/2,height/thisMagicNumber);
        float crevasseAlpha = random (5,30);   // was 46
        
        
        if ((distanceFromCenterBegin <= (navelSize-(navelMargin+200))) && (distanceFromCenterEnd <= (navelSize-(navelMargin+200))) && (crevasse1yEnd-40>height/magicNumber-40)) {         
          
           int howThick = (int)random(9,900);
           for (int m = 0;m<howThick;m=m+1)  {
               strokeWeight (random (0,2));
              
               float thicker = random(100);
               if (thicker > 90) {
                   strokeWeight (random (1,3));
               }
              
               //stroke (random(89,180),random(59,89),random(49,99),crevasseAlpha);
              
               stroke (random(200,250),random(190,240),random(190,250),random(crevasseAlpha)+9);
               bezier (crevasse1xBegin,crevasse1yBegin-80,crevasse1cp1X,crevasse1cp1Y-40-m,crevasse1cp2X,crevasse1cp2Y-40-m,crevasse1xEnd,crevasse1yEnd-80);
  
               crevasseAlpha=crevasseAlpha-1;
               }
             }
        }
       saveFrame ("data/NAVEL MARKS_button_=.jpg");
   } 
   
   if (makeThumbnails == 1) {
        background(190,180,180);
        for (int m = 1;m<10;m++)  {
            mark7();
        }
   }
   makeThumbnails = 0;  
}   
    
   

void pinkFlat() {
     // fill (255,170,117,2);
    // fill (random(200,255),random(200,255),random(200,255), random(2));
   //   rect(0,0,width,height);
   //   updatePermutation();
}
 
void saveNavelgazing () {
   
           saveFrame ("Automated Navelgazing_" + thisPermutationName + ".jpg");
           
           saveLabelOpacity = 235;
           //delay(1000);
          
 }
 
void mousePressed() {
  if (mouseY <= 1057) {
     }
     

     else {
     //if (mouseX > ampX+ampMargin+(amplification*2)-10 && mouseX < ampX+ampMargin+(amplification*2)+10)   {
     //     if (mouseY > ampY+(ampHeight/2)-30 && mouseY < ampY + (ampHeight/2) +10)    {
     //           int ampClick  = mouseX - ampX-ampMargin;
     //           amplification = (int)ampClick/2;
     //           //int alphaClick = mouseX-colorPickerPanelX-55;
     //           //theCurrentA = (int)alphaClick*2;
     //      }
     // }
      
       //rect (hairRandomPanelX, masterstrokeSecondLineY-50, 50, 20,12);
       
       hairRandomPanelX = modePanelX + 120;
    // hair mode click detector and switcher
       if (mouseX > hairRandomPanelX -5 && mouseX < hairRandomPanelX +55)  {
           if (mouseY > masterstrokeSecondLineY-44 && mouseY < masterstrokeSecondLineY-15) {
                hairMode = hairMode * -1;
           }
       }
       
       
    // random mode click detector and switcher   
       if (mouseX > hairRandomPanelX - 5 && mouseX < hairRandomPanelX + 55)  {
           if (mouseY > masterstrokeSecondLineY-14 && mouseY < masterstrokeSecondLineY+15) {
                randomMode = randomMode * -1;
           } 
       }
    
     
    // auto mode click detector and switcher  
       if (mouseX > hairRandomPanelX - 5  && mouseX < hairRandomPanelX + 55)  {
           if (mouseY > masterstrokeSecondLineY+16 && mouseY < masterstrokeSecondLineY+45) {
                autoMode = autoMode * -1;
                
                println("automode clicked = " + autoMode);
                
           } 
       }
       
       
       // click on MEMORY panel?
       
       // LOAD MEM1
       if (mouseX > memoryPanelX-70  && mouseX < memoryPanelX - 50)  {
           if (mouseY > masterstrokeSecondLineY+6 && mouseY < masterstrokeSecondLineY+20) {
       
             fill(0);
             
             textFont(MediumTextFont);
             textSize(12);
             text("1", memoryPanelX-62,memoryPanelY+24);
            
             println("loadMem1");
            
             Table mem1Table = loadTable ("mem1.csv","header");
              
              for (TableRow theRow : mem1Table.rows()) {
                    
                   int mark1 = theRow.getInt("1"); 
                   int mark2 = theRow.getInt("2"); 
                   int mark3 = theRow.getInt("3"); 
                   int mark4 = theRow.getInt("4"); 
                   int mark5 = theRow.getInt("5"); 
                   int mark6 = theRow.getInt("6"); 
                   int mark7 = theRow.getInt("7"); 
                   int mark8 = theRow.getInt("8"); 
                   int mark9 = theRow.getInt("9"); 
                   int mark10 = theRow.getInt("10"); 
                   int mark11 = theRow.getInt("11"); 
                   int mark12 = theRow.getInt("12"); 
               
                   int []  theNewArray = {mark1,mark2,mark3,mark4,mark5,mark6,mark7,mark8,mark9,mark10,mark11,mark12};
                   
                   markIntensityArray = theNewArray;
                }
            }
       }
   
     // LOAD MEM2
       if (mouseX > memoryPanelX-44  && mouseX < memoryPanelX -24)  {
           if (mouseY > masterstrokeSecondLineY+6 && mouseY < masterstrokeSecondLineY+20) {
             textSize(12);
             textFont(MediumTextFont);
             fill(0);
             text("2", memoryPanelX-40,memoryPanelY+24);
            
            println("loadMem2");
            
            
             Table mem2Table = loadTable ("mem2.csv","header");
              
              for (TableRow theRow : mem2Table.rows()) {
                    
                   int mark1 = theRow.getInt("1"); 
                   int mark2 = theRow.getInt("2"); 
                   int mark3 = theRow.getInt("3"); 
                   int mark4 = theRow.getInt("4"); 
                   int mark5 = theRow.getInt("5"); 
                   int mark6 = theRow.getInt("6"); 
                   int mark7 = theRow.getInt("7"); 
                   int mark8 = theRow.getInt("8"); 
                   int mark9 = theRow.getInt("9"); 
                   int mark10 = theRow.getInt("10"); 
                   int mark11 = theRow.getInt("11"); 
                   int mark12 = theRow.getInt("12"); 
               
                   int []  theNewArray = {mark1,mark2,mark3,mark4,mark5,mark6,mark7,mark8,mark9,mark10,mark11,mark12};
                   
                    markIntensityArray = theNewArray;
                }
            }
       }
   
     // LOAD MEM3
       if (mouseX > memoryPanelX-21  && mouseX < memoryPanelX +4)  {
           if (mouseY > masterstrokeSecondLineY+6 && mouseY < masterstrokeSecondLineY+20) {
       
             fill(0);
             textSize(12);
             textFont(MediumTextFont);
             text("3", memoryPanelX-20,memoryPanelY+24);
            
            println("loadMem3");
            
            Table mem3Table = loadTable ("mem3.csv","header");
              
              for (TableRow theRow : mem3Table.rows()) {
                    
                   int mark1 = theRow.getInt("1"); 
                   int mark2 = theRow.getInt("2"); 
                   int mark3 = theRow.getInt("3"); 
                   int mark4 = theRow.getInt("4"); 
                   int mark5 = theRow.getInt("5"); 
                   int mark6 = theRow.getInt("6"); 
                   int mark7 = theRow.getInt("7"); 
                   int mark8 = theRow.getInt("8"); 
                   int mark9 = theRow.getInt("9"); 
                   int mark10 = theRow.getInt("10"); 
                   int mark11 = theRow.getInt("11"); 
                   int mark12 = theRow.getInt("12"); 
               
                   int []  theNewArray = {mark1,mark2,mark3,mark4,mark5,mark6,mark7,mark8,mark9,mark10,mark11,mark12};
                   
                   markIntensityArray = theNewArray;      
               }
           }
       }
   
       fill(0);
       textSize(12);
       textFont(tinyFont);
   
   
       // SAVE MEM1
       
       if (mouseX > memoryPanelX-70  && mouseX < memoryPanelX-50)  {
           if (mouseY > masterstrokeSecondLineY+25 && mouseY < masterstrokeSecondLineY+42) {
                text("SAVE", memoryPanelX-65,memoryPanelY+37);
                println("saveMem1");
                
                mem1 = markIntensityArray;
              
                Table newTable = new Table();
              
                newTable.addColumn ("1");
                newTable.addColumn ("2");
                newTable.addColumn ("3");
                newTable.addColumn ("4");
                newTable.addColumn ("5");
                newTable.addColumn ("6");
                newTable.addColumn ("7");
                newTable.addColumn ("8");
                newTable.addColumn ("9");
                newTable.addColumn ("10");
                newTable.addColumn ("11");
                newTable.addColumn ("12");
              
                TableRow newRow = newTable.addRow();
                newRow.setInt("1",markIntensityArray[0]);
                newRow.setInt("2",markIntensityArray[1]);
                newRow.setInt("3",markIntensityArray[2]);
                newRow.setInt("4",markIntensityArray[3]);
                newRow.setInt("5",markIntensityArray[4]);
                newRow.setInt("6",markIntensityArray[5]);
                newRow.setInt("7",markIntensityArray[6]);
                newRow.setInt("8",markIntensityArray[7]);
                newRow.setInt("9",markIntensityArray[8]);
                newRow.setInt("10",markIntensityArray[9]);
                newRow.setInt("11",markIntensityArray[10]);
                newRow.setInt("12",markIntensityArray[11]);
        
                saveTable (newTable, "data/mem1.csv");
                  
                magic1 = markIntensityArray;
              
                newTable = new Table();
              
                newTable.addColumn ("1");
                newTable.addColumn ("2");
                newTable.addColumn ("3");
                newTable.addColumn ("4");
                newTable.addColumn ("5");
                newTable.addColumn ("6");
                newTable.addColumn ("7");
                newTable.addColumn ("8");
                newTable.addColumn ("9");
                newTable.addColumn ("10");
                newTable.addColumn ("11");
                newTable.addColumn ("12");
              
                newRow = newTable.addRow();
                newRow.setInt("1",markMagicNumberArray[0]);
                newRow.setInt("2",markMagicNumberArray[1]);
                newRow.setInt("3",markMagicNumberArray[2]);
                newRow.setInt("4",markMagicNumberArray[3]);
                newRow.setInt("5",markMagicNumberArray[4]);
                newRow.setInt("6",markMagicNumberArray[5]);
                newRow.setInt("7",markMagicNumberArray[6]);
                newRow.setInt("8",markMagicNumberArray[7]);
                newRow.setInt("9",markMagicNumberArray[8]);
                newRow.setInt("10",markMagicNumberArray[9]);
                newRow.setInt("11",markMagicNumberArray[10]);
                newRow.setInt("12",markMagicNumberArray[11]);
        
                saveTable (newTable, "data/magic1.csv");
            }
       }
    
       // SAVE MEM2
       if (mouseX > memoryPanelX-48  && mouseX < memoryPanelX-27)  {
           if (mouseY > masterstrokeSecondLineY+25 && mouseY < masterstrokeSecondLineY+42) {
                text("SAVE", memoryPanelX-43,memoryPanelY+37);
                println("saveMem2");
                
                mem2 = markIntensityArray;
              
                Table newTable = new Table();
              
                newTable.addColumn ("1");
                newTable.addColumn ("2");
                newTable.addColumn ("3");
                newTable.addColumn ("4");
                newTable.addColumn ("5");
                newTable.addColumn ("6");
                newTable.addColumn ("7");
                newTable.addColumn ("8");
                newTable.addColumn ("9");
                newTable.addColumn ("10");
                newTable.addColumn ("11");
                newTable.addColumn ("12");
              
                TableRow newRow = newTable.addRow();
                newRow.setInt("1",markIntensityArray[0]);
                newRow.setInt("2",markIntensityArray[1]);
                newRow.setInt("3",markIntensityArray[2]);
                newRow.setInt("4",markIntensityArray[3]);
                newRow.setInt("5",markIntensityArray[4]);
                newRow.setInt("6",markIntensityArray[5]);
                newRow.setInt("7",markIntensityArray[6]);
                newRow.setInt("8",markIntensityArray[7]);
                newRow.setInt("9",markIntensityArray[8]);
                newRow.setInt("10",markIntensityArray[9]);
                newRow.setInt("11",markIntensityArray[10]);
                newRow.setInt("12",markIntensityArray[11]);
        
                saveTable (newTable, "data/mem2.csv");
                
                magic2 = markIntensityArray;
              
                newTable = new Table();
              
                newTable.addColumn ("1");
                newTable.addColumn ("2");
                newTable.addColumn ("3");
                newTable.addColumn ("4");
                newTable.addColumn ("5");
                newTable.addColumn ("6");
                newTable.addColumn ("7");
                newTable.addColumn ("8");
                newTable.addColumn ("9");
                newTable.addColumn ("10");
                newTable.addColumn ("11");
                newTable.addColumn ("12");
              
                newRow = newTable.addRow();
                newRow.setInt("1",markMagicNumberArray[0]);
                newRow.setInt("2",markMagicNumberArray[1]);
                newRow.setInt("3",markMagicNumberArray[2]);
                newRow.setInt("4",markMagicNumberArray[3]);
                newRow.setInt("5",markMagicNumberArray[4]);
                newRow.setInt("6",markMagicNumberArray[5]);
                newRow.setInt("7",markMagicNumberArray[6]);
                newRow.setInt("8",markMagicNumberArray[7]);
                newRow.setInt("9",markMagicNumberArray[8]);
                newRow.setInt("10",markMagicNumberArray[9]);
                newRow.setInt("11",markMagicNumberArray[10]);
                newRow.setInt("12",markMagicNumberArray[11]);
        
                saveTable (newTable, "data/magic2.csv");
           }
       }
       
       // SAVE MEM3
       if (mouseX > memoryPanelX-27  && mouseX < memoryPanelX-0)  {
           if (mouseY > masterstrokeSecondLineY+25 && mouseY < masterstrokeSecondLineY+42) {
                text("SAVE", memoryPanelX-23,memoryPanelY+37);
                println("saveMem3");
                     
                mem3 = markIntensityArray;
              
                Table newTable = new Table();
              
                newTable.addColumn ("1");
                newTable.addColumn ("2");
                newTable.addColumn ("3");
                newTable.addColumn ("4");
                newTable.addColumn ("5");
                newTable.addColumn ("6");
                newTable.addColumn ("7");
                newTable.addColumn ("8");
                newTable.addColumn ("9");
                newTable.addColumn ("10");
                newTable.addColumn ("11");
                newTable.addColumn ("12");
              
                TableRow newRow = newTable.addRow();
                newRow.setInt("1",markIntensityArray[0]);
                newRow.setInt("2",markIntensityArray[1]);
                newRow.setInt("3",markIntensityArray[2]);
                newRow.setInt("4",markIntensityArray[3]);
                newRow.setInt("5",markIntensityArray[4]);
                newRow.setInt("6",markIntensityArray[5]);
                newRow.setInt("7",markIntensityArray[6]);
                newRow.setInt("8",markIntensityArray[7]);
                newRow.setInt("9",markIntensityArray[8]);
                newRow.setInt("10",markIntensityArray[9]);
                newRow.setInt("11",markIntensityArray[10]);
                newRow.setInt("12",markIntensityArray[11]);
        
                saveTable (newTable, "data/mem3.csv");    
            }
       }
    
         // rect (memoryPanelX-151,memoryPanelY-3,52,32,19);
    
       // RESET TO MASTER PRESCRIPTION 
       if (mouseX > memoryPanelX-154  && mouseX < memoryPanelX -67)  {
           if (mouseY > memoryPanelY-3 && mouseY < memoryPanelY+30) {
               loadMasterPrescription();
           }
      } 
      
     // textFont (SmallTextFont);
     //   text("SAVE",memoryPanelX-559,memoryPanelY+3,80,40);    
   
      
      // SAVE NAVELGaINGZ
      if (mouseX > memoryPanelX-559  && mouseX < memoryPanelX-500)  {
           if (mouseY > memoryPanelY-3 && mouseY < memoryPanelY+30) { 
               
                 fill(50,40,50,152);
                 rect (memoryPanelX-540,memoryPanelY-1,42,18,5);
  
                 saveNavelgazing();
                 saveLabelOpacity=255;
           }
      }
      
      // generate new
       if (mouseX > memoryPanelX-466  && mouseX < memoryPanelX-5)  {
           if (mouseY > memoryPanelY-5 && mouseY < memoryPanelY+25) { 
               
        
               // rect (memoryPanelX-465,memoryPanelY-4,59,29,5);
  
               println ("generate new button press");
               amplification = 50;
               
               for (int x = 1; x<2; x++)   {
                   markSet1();
               }
                amplification = 1;
           }
         }
      
   
      // magic number control
        if (mouseX >masterstrokeSecondLineX+403  && mouseX < masterstrokeSecondLineX+418)  {
           if (mouseY > masterstrokeSecondLineY-27 && mouseY < masterstrokeSecondLineY+24) { 
 
             
             thisMagicNumber = ((masterstrokeSecondLineY+24)-mouseY)/8.666;
            
             theFixedMagic  =  (int)(thisMagicNumber * 1000);
             
             if (whichMark == 12) { whichMark = 11;}
             
             println("theFixedMagic" + theFixedMagic);
          
             markMagicNumberArray[whichMark] =  theFixedMagic;
             
             println ("clicked on magic number control. whichMark = "+ whichMark + "   thisMagicNumber: " + thisMagicNumber);
             
             
             //masterstrokeSecondLineY+22-(thisMagicNumber*8.667
            
            // saveMagic();
           }
         }
         
         
        // float thisMagicNumber = markMagicNumberArray[3]/1000;
      //noStroke();
      //fill(100);
      //rect (masterstrokeSecondLineX+403, masterstrokeSecondLineY-27,6,51,4);
     
      //fill(20,100);
      //ellipse(masterstrokeSecondLineX+406,masterstrokeSecondLineY+55-(magicNumber*22),6,6); 
      
      //fill (210,140,23);
      //ellipse(masterstrokeSecondLineX+406,masterstrokeSecondLineY+54-(magicNumber*22),6,6); 
      //fill (40);
      //textFont (arial);
      //textSize (14);
      //text("*", masterstrokeSecondLineX+404, masterstrokeSecondLineY+40);
     
      determineWhichMark();
     
      makeMark();
       drawMarkMarkersAndLabels();
     }
}

void saveMagic() {
  
                Table newTable = new Table();
              
                newTable = new Table();
              
                newTable.addColumn ("1");
                newTable.addColumn ("2");
                newTable.addColumn ("3");
                newTable.addColumn ("4");
                newTable.addColumn ("5");
                newTable.addColumn ("6");
                newTable.addColumn ("7");
                newTable.addColumn ("8");
                newTable.addColumn ("9");
                newTable.addColumn ("10");
                newTable.addColumn ("11");
                newTable.addColumn ("12");
              
                TableRow newRow = newTable.addRow();
                newRow = newTable.addRow();
                newRow.setInt("1",markMagicNumberArray[0]);
                newRow.setInt("2",markMagicNumberArray[1]);
                newRow.setInt("3",markMagicNumberArray[2]);
                newRow.setInt("4",markMagicNumberArray[3]);
                newRow.setInt("5",markMagicNumberArray[4]);
                newRow.setInt("6",markMagicNumberArray[5]);
                newRow.setInt("7",markMagicNumberArray[6]);
                newRow.setInt("8",markMagicNumberArray[7]);
                newRow.setInt("9",markMagicNumberArray[8]);
                newRow.setInt("10",markMagicNumberArray[9]);
                newRow.setInt("11",markMagicNumberArray[10]);
                newRow.setInt("12",markMagicNumberArray[11]);
        
                saveTable (newTable, "data/magic3.csv"); 
}



void loadMasterPrescription() {
 
               fill(0);
               textFont(SmallTextFont);
               textSize(9);
                 
               // load the table from the web   
               // put that into the current markIntensityArray
               
               println("masterMemTable" + masterMemTable);
               text("RESET TO MASTER",memoryPanelX-142,memoryPanelY+5,80,40);    
              
               //text("RESET TO MASTER",memoryPanelX-152,memoryPanelY+5,80,40);
               println("RESET TO MASTER1");
              
               masterMemTable = loadTable ("http://www.slopart.com/autonavel/masterMem1.csv","header");
              
               for (TableRow theRow : masterMemTable.rows()) {
                    
                   int mark1 = theRow.getInt("1"); 
                   int mark2 = theRow.getInt("2"); 
                   int mark3 = theRow.getInt("3"); 
                   int mark4 = theRow.getInt("4"); 
                   int mark5 = theRow.getInt("5"); 
                   int mark6 = theRow.getInt("6"); 
                   int mark7 = theRow.getInt("7"); 
                   int mark8 = theRow.getInt("8"); 
                   int mark9 = theRow.getInt("9"); 
                   int mark10 = theRow.getInt("10"); 
                   int mark11 = theRow.getInt("11"); 
                   int mark12 = theRow.getInt("12"); 
                   
                   int []  theNewArray = {mark1,mark2,mark3,mark4,mark5,mark6,mark7,mark8,mark9,mark10,mark11,mark12};
                   markIntensityArray = theNewArray;
               }
                  
               masterMagicNumberTable = loadTable ("http://www.slopart.com/autonavel/mastermagic.csv","header");
              
               for (TableRow theRow : masterMagicNumberTable.rows()) {
                 
                   int magic1 = theRow.getInt("1"); 
                   int magic2 = theRow.getInt("2"); 
                   int magic3 = theRow.getInt("3"); 
                   int magic4 = theRow.getInt("4"); 
                   int magic5 = theRow.getInt("5"); 
                   int magic6 = theRow.getInt("6"); 
                   int magic7 = theRow.getInt("7"); 
                   int magic8 = theRow.getInt("8"); 
                   int magic9 = theRow.getInt("9"); 
                   int magic10= theRow.getInt("10"); 
                   int magic11= theRow.getInt("11"); 
                   int magic12= theRow.getInt("12"); 
                   
                   int []  theNewMagicArray = {magic1,magic2,magic3,magic4,magic5,magic6,magic7,magic8,magic9,magic10,magic11,magic12};
                   
                   markMagicNumberArray = theNewMagicArray;
               }    
               
               println(markMagicNumberArray);           
}

 
void mouseReleased() {
    
  if (mouseY > masterstrokeSecondLineY+0 && mouseY < masterstrokeSecondLineY+35  ) {
    
    if (mouseX > masterstrokeControlsX+5 && mouseX < masterstrokeControlsX+300  )  {
        
       
        int intensityControlY = mouseY; 
        int indicatorOffsetY = (masterstrokeSecondLineY+35)-intensityControlY; 
        
        if (indicatorOffsetY*4 > 100) {
           indicatorOffsetY = 25; 
        }
          
        if (indicatorOffsetY < 0) {
           indicatorOffsetY = 0; 
        }
        
        if (whichMark == 0) {
         }
        else {
            markIntensityArray[whichMark-1] = indicatorOffsetY*4; 
        }
      }
   }
   
   if (mouseX >masterstrokeSecondLineX+403  && mouseX < masterstrokeSecondLineX+418)  {
           if (mouseY > masterstrokeSecondLineY-27 && mouseY < masterstrokeSecondLineY+24) { 
 
             thisMagicNumber = ((masterstrokeSecondLineY+24)-mouseY)/8.666;
            
             theFixedMagic  =  (int)(thisMagicNumber * 1000);
             
             if (whichMark == 12) { whichMark = 11;}
            
             println("theFixedMagic" + theFixedMagic);
          
             markMagicNumberArray[whichMark] = theFixedMagic;
             
             //println ("clicked on magic number control. whichMark = "+ whichMark + "   thisMagicNumber: " + thisMagicNumber);
             
             //masterstrokeSecondLineY+22-(thisMagicNumber*8.667
            
             saveMagic();
             
            println("mouseReleased -- thisMagicNumber = " + thisMagicNumber);
       
           }
         }
   
   
   
   
}