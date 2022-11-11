////variables...
float count = 60;
float x;
float  y = 20;
float radius = 20;

//page details...
float pageStart = 0;
float pageLength = 0;
float pageEnd = 0;
boolean scrollNeeded = false;

//Scroll...
float scrollLength = 0;
float scrollStart = 0;
float scrollEnd;
float scrollWidth = 4;
boolean scrolling = false;

//keyPiece Parameters... 
int keyPieceDigitSqRtCount = 4;
int keyPieceDigitWidth = 14;
int keyPieceCount = 4;
int keyPieceSpacing = 5;//int(keyPieceDigitWidth*0.7);
float keyPieceX;
float keyPieceY; // = pageStart + (keyPieceDigitSqRtCount * keyPieceDigitWidth) + ((keyPieceDigitSqRtCount * keyPieceDigitWidth)*0.3);
float mixKeyPieceX;
float mixKeyPieceY;

keyPiece keyPieceCompare1;
keyPiece keyPieceCompare2;
keyPiece keyPieceResults;
keyPiece keyPieceCompare3;

ArrayList<keyPiece> A = new ArrayList<keyPiece>();
ArrayList<keyPiece> B = new ArrayList<keyPiece>();
ArrayList<keyPiece> Amix = new ArrayList<keyPiece>();
ArrayList<keyPiece> Bmix = new ArrayList<keyPiece>();
ArrayList<keyPiece> EavesMix = new ArrayList<keyPiece>();

// buttons..
Button Ashare;
Button Bshare;
ArrayList<SelectButton> KeypieceSelect = new ArrayList<SelectButton>();

////setup...
void setup() {
  //size(1000, 600); 
  fullScreen();

  Ashare = new Button((width/2) - 165, 10, 60, 25, "A Share", 200, 200, 200);
  Bshare = new Button((width/2) + 105, 10, 60, 25, "B Share", 200, 200, 200);
  textAlign(CENTER, CENTER);
  strokeCap(PROJECT);

  // for client A...  
  keyPieceX = 100;
  keyPieceY = 5;
  mixKeyPieceX = 5;
  mixKeyPieceY = (keyPieceDigitSqRtCount*keyPieceDigitWidth) + ((keyPieceDigitSqRtCount*keyPieceDigitWidth)*0.3);
  for (int i = 0; i < keyPieceCount; i++) {  
    A.add(new keyPiece(keyPieceX, keyPieceY, keyPieceDigitSqRtCount, keyPieceDigitWidth));
    Amix.add(new keyPiece(mixKeyPieceX, mixKeyPieceY, keyPieceDigitSqRtCount, keyPieceDigitWidth));
    KeypieceSelect.add(new SelectButton(int(mixKeyPieceX), int(mixKeyPieceY), (keyPieceDigitSqRtCount * keyPieceDigitWidth) +1, (keyPieceDigitSqRtCount * keyPieceDigitWidth) +1));      
    mixKeyPieceX += keyPieceDigitSqRtCount*keyPieceDigitWidth + keyPieceSpacing;
    Amix.add(new keyPiece(mixKeyPieceX, mixKeyPieceY, keyPieceDigitSqRtCount, keyPieceDigitWidth));
    KeypieceSelect.add(new SelectButton(int(mixKeyPieceX), int(mixKeyPieceY), (keyPieceDigitSqRtCount * keyPieceDigitWidth) +1, (keyPieceDigitSqRtCount * keyPieceDigitWidth) +1));      
    keyPiece partAmix = Amix.get(i*2);
    keyPiece partAmixInv = Amix.get((i*2)+1);
    keyPiece partA = A.get(i);
    for (int j =0; j < sq(keyPieceDigitSqRtCount); j++) {        
      partAmix.keyBlock[j].oneOrZero = partA.keyBlock[j].oneOrZero;
      partAmixInv.keyBlock[j].oneOrZero = !(partA.keyBlock[j].oneOrZero);
    }
    keyPieceX += keyPieceDigitSqRtCount*keyPieceDigitWidth + keyPieceSpacing;
    mixKeyPieceX += keyPieceDigitSqRtCount*keyPieceDigitWidth + keyPieceSpacing;
  }
  
  
  ////-------------------
  //int AmixIntStart;
  //int AmixNextInt = 1;
  //int AmixLastFixed;
  //int AmixLenEnd;
  //AmixIntStart = 0;
  //AmixLenEnd = Amix.size();
  //for (int i = AmixIntStart; i < AmixLenEnd; i++) {
  //  keyPieceResults = new keyPiece(mixKeyPieceX, mixKeyPieceY, keyPieceDigitSqRtCount, keyPieceDigitWidth);
  //  keyPieceCompare1 = Amix.get(i);
  //  keyPieceCompare2 = Amix.get(AmixNextInt);
  //  for (int k =0; k < sq(keyPieceDigitSqRtCount); k++) {
  //    if (keyPieceCompare1.keyBlock[k].oneOrZero == keyPieceCompare2.keyBlock[k].oneOrZero) {
  //      keyPieceResults.keyBlock[k].oneOrZero = false;
  //    } else {
  //      keyPieceResults.keyBlock[k].oneOrZero = true;
  //    }
  //  }
  //  Amix.add(keyPieceResults);
  //  mixKeyPieceX += keyPieceDigitSqRtCount*keyPieceDigitWidth + keyPieceSpacing;
  //}
  ////---------------

  //boolean digitMatch = true;
  //boolean keyPieceMatch = true;
  //boolean existFinished = true;
  //while (existFinished) {
  //  existFinished = false;
  //  keyPieceResults = new keyPiece(mixKeyPieceX, mixKeyPieceY, keyPieceDigitSqRtCount, keyPieceDigitWidth);
  //  for (int i = 0; i < Amix.size(); i++) {
  //    keyPieceCompare1 = Amix.get(i);
  //    for (int j = 0; j < Amix.size(); j++) {
  //      keyPieceCompare2 = Amix.get(j);
  //      for (int k =0; k < sq(keyPieceDigitSqRtCount); k++) {
  //        if (keyPieceCompare1.keyBlock[k].oneOrZero == keyPieceCompare2.keyBlock[k].oneOrZero) {
  //          keyPieceResults.keyBlock[k].oneOrZero = false;
  //        } else {
  //          keyPieceResults.keyBlock[k].oneOrZero = true;
  //        }
  //      }        
  //      for (int l = 0; l < Amix.size(); l++) {
  //        keyPieceCompare3 = Amix.get(l);
  //        for (int m =0; m < sq(keyPieceDigitSqRtCount); m++) {
  //          if (keyPieceResults.keyBlock[m].oneOrZero == keyPieceCompare3.keyBlock[m].oneOrZero) {
  //            digitMatch = false;
  //            break;
  //          }            
  //        }
  //        if (digitMatch == false) {
  //          keyPieceMatch = false;
  //        }

  //        digitMatch = true;
  //      }
  //      if (keyPieceMatch == false){
  //        existFinished = true;
  //        Amix.add(keyPieceResults);
  //      } else {
  //        existFinished = false;
  //      }
  //    }
  //  }
  //}
  println(Amix.size());

  //mixKeyPieceX += keyPieceDigitSqRtCount*keyPieceDigitWidth + keyPieceSpacing;
  //keyPieceResults = new keyPiece(mixKeyPieceX, mixKeyPieceY, keyPieceDigitSqRtCount, keyPieceDigitWidth);
  //keyPieceCompare1 = Amix.get(0);
  ////for (int j = 0; j < 6; j++) {
  //keyPieceCompare2 = Amix.get(2);
  //for (int k =0; k < sq(keyPieceDigitSqRtCount); k++) {

  //  if (keyPieceCompare1.keyBlock[k].oneOrZero == keyPieceCompare2.keyBlock[k].oneOrZero) {
  //    keyPieceResults.keyBlock[k].oneOrZero = false;
  //  } else {
  //    keyPieceResults.keyBlock[k].oneOrZero = true;
  //  }
  //  //}
  //  //}
  //}
  //Amix.add(keyPieceResults);


  //for client B...
  keyPieceX = width/2 + 180;
  keyPieceY = 5;
  for (int i = 0; i < keyPieceCount; i++) {
    B.add(new keyPiece(keyPieceX, keyPieceY, keyPieceDigitSqRtCount, keyPieceDigitWidth));   
    KeypieceSelect.add(new SelectButton(int(keyPieceX), int(keyPieceY), (keyPieceDigitSqRtCount * keyPieceDigitWidth) +1, (keyPieceDigitSqRtCount * keyPieceDigitWidth) +1));
    keyPieceX += keyPieceDigitSqRtCount*keyPieceDigitWidth + keyPieceSpacing;
  }
}

////draw...
void draw() {
  background(155, 185, 235);
  noStroke();
  fill(255, 205, 145);
  rectMode(CENTER);
  rect(width/2, height/2, 200, height +1);
  stroke(125);
  strokeWeight(1);
  rectMode(CORNER);
  noFill();
  y = pageStart + 20;
  for ( int i = 0; i< count; i++) {  
    //rect(x, y, radius, radius);
    y += 50;
    x += (width-40)/count;
  }
  pageEnd = y;
  pageLength = dist(0, pageStart, 0, pageEnd);
  y = y - (count*50);
  x = 20;
  for (int i = 0; i < Amix.size(); i++) {
    keyPiece partAmix = Amix.get(i);
    partAmix.displayKey();
    //keyPiece partB = B.get(i);    
    //partB.displayKey();
  }
  for (int i = 0; i < Amix.size()+ Bmix.size(); i++) { // needs redesign. should be total count of all keyPieces
    SelectButton part = KeypieceSelect.get(i);
    if (part.isClicked()) {
      rect(width/2, height/2, 20, 20);
    }
    part.update();
    part.updateHover();
    strokeWeight(1);
  }

  //Headers...
  stroke(125);
  rectMode(CORNER);
  fill(155, 145, 215, 230);
  rect(0, 0, (width/2) - 100, (keyPieceDigitSqRtCount*keyPieceDigitWidth) + ((keyPieceDigitSqRtCount*keyPieceDigitWidth)*0.2));
  rect((width/2) + 100, 0, width, (keyPieceDigitSqRtCount*keyPieceDigitWidth) + ((keyPieceDigitSqRtCount*keyPieceDigitWidth)*0.2)); 
  fill(235, 185, 125, 230);
  rect((width/2) - 101, 0, 201, (keyPieceDigitSqRtCount*keyPieceDigitWidth) + ((keyPieceDigitSqRtCount*keyPieceDigitWidth)*0.2));
  textSize(20);
  fill(255);
  text("Client A", 50, ((keyPieceDigitSqRtCount*keyPieceDigitWidth) + ((keyPieceDigitSqRtCount*keyPieceDigitWidth)*0.2))/2 + 1);
  text("Client B", width - 50, ((keyPieceDigitSqRtCount*keyPieceDigitWidth) + ((keyPieceDigitSqRtCount*keyPieceDigitWidth)*0.2))/2 +1);
  text("Eaves Droppers", (width/2) + 2, ((keyPieceDigitSqRtCount*keyPieceDigitWidth) + ((keyPieceDigitSqRtCount*keyPieceDigitWidth)*0.2))/2 + 1);
  fill(0);
  text("Client A", 50, ((keyPieceDigitSqRtCount*keyPieceDigitWidth) + ((keyPieceDigitSqRtCount*keyPieceDigitWidth)*0.2))/2);
  text("Client B", width - 50, ((keyPieceDigitSqRtCount*keyPieceDigitWidth) + ((keyPieceDigitSqRtCount*keyPieceDigitWidth)*0.2))/2);
  text("Eaves Droppers", (width/2), ((keyPieceDigitSqRtCount*keyPieceDigitWidth) + ((keyPieceDigitSqRtCount*keyPieceDigitWidth)*0.2))/2);
  for (int i = 0; i < keyPieceCount; i++) {
    keyPiece partB = B.get(i);    
    partB.displayKey();
    keyPiece partA = A.get(i);    
    partA.displayKey();
  }
  Ashare.AllBtnLogic();
  if (Ashare.isClicked()) {
    rect(width/2, height/2, 20, 20);
  }
  Bshare.AllBtnLogic();
  if (Bshare.isClicked()) {
    rect(width/2, height/2, 20, 20);
  }
  scrollLength = (height/pageLength)*height;
  scrollEnd = scrollStart + scrollLength;
  noStroke();
  if (pageEnd >= height) {
    scrollNeeded = true;
  }
  if (scrollNeeded) {
    fill(135,150);
    rectMode(CORNER);
    rect(width-scrollWidth, 0, scrollWidth, height);
    fill(195,150);
    rect(width-scrollWidth, scrollStart, scrollWidth, scrollLength);
    //println(scrollStart +" : " + scrollLength + " : " + scrollEnd + "  : " + pageLength);
    if (mouseX > width-14 && mouseY > 0 && mouseY < height || scrolling == true) {
      if (scrollWidth < 14) {
        scrollWidth +=1;
      }
    } else {
      if (scrollWidth > 4) {
        scrollWidth -= 1;
      }
    }
    if (mousePressed==true) {
      if (mouseX > width-14 && mouseY > scrollStart && mouseY < scrollEnd) { 
        scrolling = true;
      }
      if (scrolling == true) {
        scrollStart = scrollStart - (pmouseY - mouseY);
        pageStart += ((pmouseY - mouseY)/ ( height / pageLength));
        pageAdjust();
      }
    } else {
      scrolling = false;
    }
    //scroll limits..
    if (scrollStart < 0) {
      scrollStart = 0;
    }
    if (scrollStart + scrollLength > height) {
      scrollStart = height - scrollLength;
      pageStart = height - pageLength;
    }
    //page limits..
    if (pageStart > 0) {
      pageStart = 0;
      pageEnd = pageStart + pageLength;
      pageAdjust();
    }
  }
}

void pageAdjust() {
  y = pageStart + 20;
  for (int i = 0; i < Amix.size() + Bmix.size(); i++) {
    int digitID = 0;
    for (int j =0; j < keyPieceDigitSqRtCount; j++) {
      for (int k = 0; k < keyPieceDigitSqRtCount; k++) {
        keyPiece partAmix = Amix.get(i);
        partAmix.keyBlock[digitID].yDgt = pageStart + mixKeyPieceY;
        //keyPiece partB = B.get(i);
        //partBmix.keyBlock[digitID].yDgt = pageStart + mixkeyPieceY;

        digitID += 1;
      }
      mixKeyPieceY += keyPieceDigitWidth;
    }
    mixKeyPieceY -= keyPieceDigitWidth*keyPieceDigitSqRtCount;
    SelectButton partKPSelect = KeypieceSelect.get(i);
    partKPSelect.Pos.y = pageStart + mixKeyPieceY;
  }
}
