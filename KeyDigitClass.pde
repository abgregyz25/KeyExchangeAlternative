class keyDigit {
  boolean oneOrZero;
  float digitStartx;
  float digitStarty;
  float xDgt = 0;
  float yDgt = 0;
  float keyDigitSize;
  float digitCol;
  float digitStrCol;
  String digitStr;

  keyDigit(int dgtSz) {
    keyDigitSize = dgtSz;
    oneOrZero = boolean(int(random(0, 2)));
  } 

  void displayDigit() {
    //xDgt = digitStartx;
    //yDgt = digitStarty;
    //noStroke();
    //textAlign(CENTER,CENTER);
    textSize(keyDigitSize);
    if (oneOrZero) { 
      digitCol = 255;
      digitStrCol = 0;
      digitStr = "1";
    } else {
      digitCol = 0;
      digitStrCol = 255;
      digitStr = "0";
    }
    fill(digitCol);
    if (keyDigitSize > 5) {
    stroke(100);
    }else {
      noStroke();
    }
    rect(xDgt, yDgt, keyDigitSize, keyDigitSize);
    if (keyDigitSize > 10) {
      fill(digitStrCol);
      text(digitStr, xDgt + (keyDigitSize/2), yDgt + (keyDigitSize/2) - (keyDigitSize*0.1));
    }
  }
}
