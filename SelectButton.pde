class SelectButton {
  PVector Pos = new PVector(0, 0);
  float BWidth = 0;
  float BHeight = 0;
  boolean Pressed = false;
  boolean Clicked = false;
  boolean ButtonHover = false;
  boolean keyPieceSelected = false;

  SelectButton(int x, int y, int w, int h )
  {
    Pos.x = x;
    Pos.y = y;
    BWidth = w;
    BHeight = h;
  }
  void updateHover() {             // must be placed in void Draw  
    if (mouseX >= Pos.x && mouseX <= Pos.x + BWidth && mouseY >= Pos.y && mouseY <= Pos.y + BHeight) {
      noFill();
      rectMode(CORNER);
      stroke(200,80,80);
      strokeWeight(3);
      rect(Pos.x-3, Pos.y-3, BWidth+5, BHeight+5);
    }
  }

  void update() {             // must be placed in void Draw
    if (mousePressed == true && mouseButton == LEFT && Pressed == false) {
      Pressed = true;
      if (mouseX >= Pos.x && mouseX <= Pos.x + BWidth && mouseY >= Pos.y && mouseY <= Pos.y + BHeight) {
        Clicked = true;
      }
    } else {
      Clicked = false;
    }
    if (mousePressed != true) {
      Pressed = false; 
    }
  }

  boolean isClicked() {           // function used in If Statement to check if the Button has been clicked.
    return Clicked;
  }
}
