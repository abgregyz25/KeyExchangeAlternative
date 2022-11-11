class Button {
  PVector Pos = new PVector(0, 0);
  float BWidth = 0;
  float BHeight = 0;
  color BCol;
  String BText;
  Boolean MouseBtnPressed = false;
  Boolean MousePressedHeld = false;
  Boolean Clicked = false;

  Button(int x, int y, int w, int h, String t, int r, int g, int b)
  {
    Pos.x = x;
    Pos.y = y;
    BWidth = w;
    BHeight = h;
    BCol = color(r, g, b);
    BText = t;
  }

  void render() {        //render must be placed in void Draw
    fill(BCol);
    rectMode(CORNER);
    strokeWeight(2);
    stroke(0);
    rect(Pos.x, Pos.y, BWidth, BHeight, 3);
    stroke(155);
    rect(Pos.x, Pos.y, BWidth-1, BHeight-1, 3);

    fill(0);
    textAlign(CENTER, CENTER);
    textSize(14);
    text(BText, Pos.x + (BWidth/2)-1, Pos.y + (BHeight/2)-1);
  }
  void renderHover() {             // must be placed in void Draw  
    if (mouseX >= Pos.x && mouseX <= Pos.x +BWidth && mouseY >= Pos.y && mouseY <= Pos.y +BHeight) {
      fill(100, 150, 150, 30);
      rectMode(CORNER);
      strokeWeight(1);
      stroke(100, 150, 150);
      rect(Pos.x-2, Pos.y-2, BWidth+4, BHeight+4, 7);
    }
  }
  void renderBtnDown() {             // must be placed in void Draw  
    if (mouseX >= Pos.x && mouseX <= Pos.x +BWidth && mouseY >= Pos.y && mouseY <= Pos.y +BHeight && MousePressedHeld == true) {
      fill(BCol);
      rectMode(CORNER);
      strokeWeight(2);
      stroke(0);
      rect(Pos.x, Pos.y, BWidth, BHeight, 3);
      stroke(155);
      rect(Pos.x+1, Pos.y+1, BWidth-1, BHeight-1, 3);
      fill(0);
      textAlign(CENTER, CENTER);
      textSize(14);
      text(BText, Pos.x + (BWidth/2), Pos.y + (BHeight/2));
    }
  }

  void updateButtonDown()                 // must be placed in void Draw
  {             
    if (mousePressed == true && mouseButton == LEFT && MouseBtnPressed == false) 
    {
      MouseBtnPressed = true;
      if (mouseX >= Pos.x  
        && mouseX <= Pos.x +BWidth 
        && mouseY >= Pos.y
        && mouseY <= Pos.y +BHeight
        ) 
      {   
        MousePressedHeld = true;
      }
    } else 
    {
      Clicked = false;
    }
  }

  void updateButtonReleased()                 // must be placed in void Draw
  {
    if (!mousePressed) {
      if (mouseX >= Pos.x  
        && mouseX <= Pos.x +BWidth 
        && mouseY >= Pos.y
        && mouseY <= Pos.y +BHeight        
        && MouseBtnPressed == true
        && MousePressedHeld == true
        ) 
      {
        MousePressedHeld = false;
      } else 
      {
        MouseBtnPressed = false;
        MousePressedHeld = false;
        Clicked = false;
      }
      if (MouseBtnPressed == true
        && MousePressedHeld == false)
      {
        Clicked = true;
      } else
      {
        MouseBtnPressed = false;
        MousePressedHeld = false;
        Clicked = false;
      }
    }
  }

  void AllBtnLogic() {
    render();
    renderHover();
    updateButtonDown();
    renderBtnDown();
    updateButtonReleased();
  }

  boolean isClicked() {           // function used in If Statement to check if the Button has been clicked.
    return Clicked;
  }
}
