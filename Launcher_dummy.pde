int gameStore = 0; // 0 is the main store page
PImage storePage;
PImage libraryPage;
String tab = "store page";
PImage profilePage;

void setup(){
 size(1366,700);
  storePage = loadImage("storebackground.jpg");
  libraryPage = loadImage("librarybackground.jpg");
  profilePage = loadImage("profilebackground.jpg");
  
  textSize(24);
}

void draw(){
  storePageButtons();
  
  // Changing background based on which menu the user is in
  if(gameStore >= 0 && tab.contains("store page")){
  image(storePage, 0, 0);
  } else if (tab.contains("library page")){
   image(libraryPage, 0, 0); 
  } else if (tab.contains("profile page")){
    image(profilePage,0, 0);
  }
  fill(255);
  
  if(gameStore == 0 && tab.contains("store page")){
  rect(0, 500, 100, 100);
  rect(120, 500, 100, 100);
  rect(240, 500, 100, 100);
  rect(360, 500, 100, 100);
  } else if (gameStore == 1){ 
    fill(0);
    text("This is a first game's store page",50,300);
  } else if (gameStore == 2){
    fill(0);
    text("This is the second game's store page",50,300);
  } else if (gameStore == 3){
    fill(0);
    text("This is the third game's store page",50,300);
  } else if (gameStore == 4){
    fill(0);
    text("This is the fourth game's store page",50,300);
  }
}

void keyPressed(){
 if(key == '`'){
   gameStore = 0;
 }
}

void storePageButtons(){
  if(mousePressed){
    if(mouseX > 0 && mouseX < 100 && mouseY > 500 && mouseY < 600){ // gameStore from 1 to 4 changes what game's store page will appear based on which icon is clicked
      gameStore = 1;
    } else if(mouseX > 120 && mouseX < 220 && mouseY > 500 && mouseY < 600){
      gameStore = 2;
    } else if(mouseX > 240 && mouseX < 340 && mouseY > 500 && mouseY < 600){
      gameStore = 3;
    } else if(mouseX > 360 && mouseX < 460 && mouseY > 500 && mouseY < 600){
      gameStore = 4;
    } else if(mouseX > 190 && mouseX < 330 && mouseY > 40 && mouseY < 80){ // Library Tab
     gameStore = 0;
     tab = "library page";
    } else if (mouseX > 40 && mouseX < 160 && mouseY > 40 && mouseY < 80){ // Store Tab
      gameStore = 0;
      tab = "store page";
    } else if (mouseX > 375 && mouseX < 515 && mouseY > 40 && mouseY < 80){ // Profile Tab
      tab = "profile page";
      gameStore = 0;
    }
  }
}