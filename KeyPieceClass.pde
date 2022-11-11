//classes...
class keyPiece {
  float blockSizeWidth;
  float blockSizeSquared;
  keyDigit[] keyBlock;
  int KPkeyDigitSize;
  float xBlockDigit;
  float yBlockDigit;
  float digitCount = 0;

  keyPiece(float xBlockDigitStartPos, float yBlockDigitStartPos, int mainBlockSize, int mainkeyDigitSize) {
    blockSizeWidth = mainBlockSize;
    blockSizeSquared = sq(blockSizeWidth);
    KPkeyDigitSize = mainkeyDigitSize;
    xBlockDigit = xBlockDigitStartPos;
    yBlockDigit = yBlockDigitStartPos;
    keyBlock = new keyDigit[int(blockSizeSquared)];
    for (int i = 0; i < blockSizeSquared; i++) {
      keyBlock[i] = new keyDigit(KPkeyDigitSize);
      keyBlock[i].xDgt = xBlockDigit;
      keyBlock[i].yDgt = yBlockDigit;
      xBlockDigit += keyBlock[i].keyDigitSize;
      digitCount += 1;
      if (digitCount > blockSizeWidth - 1){
        yBlockDigit += keyBlock[i].keyDigitSize;
        xBlockDigit -= keyBlock[i].keyDigitSize * blockSizeWidth;
        digitCount = 0;
      }
    }
  }

  //keyPiece(float xBlockDigitStartPos, float yBlockDigitStartPos, int mainBlockSize, int mainkeyDigitSize) {
  //  blockSizeWidth = mainBlockSize;
  //  blockSizeSquared = sq(blockSizeWidth);
  //  KPkeyDigitSize = mainkeyDigitSize;
  //  xBlockDigit = xBlockDigitStartPos;
  //  yBlockDigit = yBlockDigitStartPos;
  //  keyBlock = new keyDigit[int(blockSizeSquared)];
  //  for (int i = 0; i < blockSizeSquared; i++) {
  //    keyBlock[i] = new keyDigit(KPkeyDigitSize);
  //    keyBlock[i].xDgt = xBlockDigit;
  //    keyBlock[i].yDgt = yBlockDigit;
  //    xBlockDigit += keyBlock[i].keyDigitSize;
  //    digitCount += 1;
  //    if (digitCount > blockSizeWidth - 1){
  //      yBlockDigit += keyBlock[i].keyDigitSize;
  //      xBlockDigit -= keyBlock[i].keyDigitSize * blockSizeWidth;
  //      digitCount = 0;
  //    }
  //  }
  //}  
  void displayKey() {
    for (int i = 0; i < blockSizeSquared; i++) {
      keyBlock[i].displayDigit();
    }
  }
}
