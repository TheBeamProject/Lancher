int gameStore = 0; // 0 is the main store page
int clickable; //the login text clickables
boolean login = false;
PImage libraryGameArt;
PImage storePage;
PImage libraryPage;
PImage profilePage;
PImage loginButton;
PImage Socialisum;
PImage Ruin;
PImage Apoclypse;
PImage MusicHero;
String[] CorrectInfo = {"username", "password"};
String[] AccInfo = {"username", "password"};
String[] Credits = {"100"};
String tab = "store page";
String[] games = {"Socialisum", "Ruin", "Music Hero", "Apocalypse", "game5", "game6", "game7", "game8", "game9", "game10"};
String libraryGames = games[0];
void setup() {
  size(1366, 700);
  CorrectInfo=loadStrings("data/InfoCheck.txt");//loads the correct info
  storePage = loadImage("storebackground.jpg");//loads art
  libraryPage = loadImage("librarybackground.jpg");
  profilePage = loadImage("profilebackground.jpg");
  loginButton = loadImage("data/loginButton.png");
  Ruin = loadImage("data/ruinsi.png");
  Apoclypse = loadImage("data/apocolypsesi.png");
  MusicHero = loadImage("data/musicherosi.png");
  Socialisum = loadImage("data/socialisumsi.png");//loads art
  textSize(24);
}
void draw() {
  storePageButtons();
  // Changing background based on which menu the user is in
  if (gameStore >= 0 && tab.contains("store page")) {
    image(storePage, 0, 0);
  } else if (tab.contains("library page")) {
    image(libraryPage, 0, 0);
  } else if (tab.contains("profile page")) {
    image(profilePage, 0, 0);
  }
  if (tab.contains("login")) {
    image(profilePage, 0, 0);
  }
  fill(255);
  if (login==false) {
    image(loginButton, 1200, 10);
  } else if (login==true) {
    Credits=loadStrings("data/Credits.txt");
    textSize(20);
    fill(0);
    text("Credits:"+Credits[0], 1000, 50);
    text(CorrectInfo[0], 900, 50);
  }
  if (tab.contains("login")) {
    strokeWeight(10);
    line(675, 95, 675, 700);
    textSize(50);
    fill(0);
    text("Login", 250, 200);   
    text("Sign Up", 915, 200);
    text("Username", 50, 300);
    text("Password", 50, 450);
    text("Username", 750, 300);
    text("Password", 750, 450);
    fill(255);
    fill(0);
    fill(255);
    rect(100, 325, 400, 50);
    rect(100, 475, 400, 50);
    rect(775, 325, 400, 50);
    rect(775, 475, 400, 50);
    SignUpButton(890, 600, 225, 75);
    LoginButton(180, 600, 255, 75);
    fill(0);
    if (mouseX > 100 && mouseX < 500 && mouseY > 325 && mouseY < 375 && mousePressed || clickable==1) {
      clickable=1;
      text(AccInfo[0], 115, 365);
    } 
    if (mouseX > 100 && mouseX < 500 && mouseY > 475 && mouseY < 525 && mousePressed || clickable==2) {
      clickable=2;
      text(AccInfo[1], 115, 515);
    } 
    if (mouseX > 775 && mouseX < 1275 && mouseY > 325 && mouseY < 375 && mousePressed || clickable==3) {
      clickable=3;
      text(CorrectInfo[0], 790, 365);
    } 
    if (mouseX > 775 && mouseX < 1275 && mouseY > 475 && mouseY < 525 && mousePressed || clickable==4) {
      clickable=4;
      text(CorrectInfo[1], 790, 515);
    }
    fill(0);
    text("Login", 245, 650);
    text("Sign Up", 915, 650);
  }
  if (tab.contains("library page")) {
    libaryPage();
    librarySelect();
    image(libraryGameArt, 650, 175);
    textSize(60);
    fill(0);
    text(libraryGames, 900, 150);
    textSize(35);
    fill(0);
    text(games[0], 50, 135);
    text(games[1], 50, 195);
    text(games[2], 50, 255);
    text(games[3], 50, 315);
    text(games[4], 50, 375);
    text(games[5], 50, 435);
    text(games[6], 50, 495);
    text(games[7], 50, 555);
    text(games[8], 50, 615);
    text(games[9], 50, 675);
  }
  if (gameStore == 0 && tab.contains("store page")) {
    image(Ruin, 0, 500);
    image(Apoclypse, 120, 500);
    image(Socialisum, 240, 500);
    image(MusicHero, 360, 500);
  } else if (gameStore == 1) { 
    fill(0);
    text("This is a first game's store page", 50, 300);
  } else if (gameStore == 2) {
    fill(0);
    text("This is the second game's store page", 50, 300);
  } else if (gameStore == 3) {
    fill(0);
    text("This is the third game's store page", 50, 300);
  } else if (gameStore == 4) {
    fill(0);
    text("This is the fourth game's store page", 50, 300);
  }
 
  
}
void launchGame(String gameDirect) {
  fill(0);
  if (mouseX > 690 && mouseX <840 && mouseY >110 && mouseY <160 ) {
    fill(150);
  }
  if (mousePressed) {
    if (mouseX > 690 && mouseX <840 && mouseY >110 && mouseY <160) {
      launch(gameDirect);
    }
  }
  rect(690, 110, 150, 50);
  fill(255);
  text("Launch", 705, 150);
}
void keyPressed() {
  if (login==false) {
    if (tab.contains("login")) {
      if (clickable==1) {
        if (keyCode == BACKSPACE) {
          if (AccInfo[0].length() > 0) {
            AccInfo[0] = AccInfo[0].substring(0, AccInfo[0].length()-1);
          }
        } else if (keyCode == DELETE) {
          AccInfo[0]= "";
        } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT && keyCode != LEFT && keyCode !=RIGHT) {
          AccInfo[0] =AccInfo[0] + key;
        }
      }
      if (clickable==2) {
        if (keyCode == BACKSPACE) {
          if (AccInfo[1].length() > 0) {
            AccInfo[1] = AccInfo[1].substring(0, AccInfo[1].length()-1);
          }
        } else if (keyCode == DELETE) {
          AccInfo[1]= "";
        } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT && keyCode != LEFT && keyCode !=RIGHT) {
          AccInfo[1] =AccInfo[1] + key;
        }
      }
      if (clickable==3) {
        if (keyCode == BACKSPACE) {
          if (CorrectInfo[0].length() > 0) {
            CorrectInfo[0] = CorrectInfo[0].substring(0, CorrectInfo[0].length()-1);
          }
        } else if (keyCode == DELETE) {
          CorrectInfo[0]= "";
        } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT && keyCode != LEFT && keyCode !=RIGHT) {
          CorrectInfo[0] =CorrectInfo[0] + key;
        }
      }
      if (clickable==4) {
        if (keyCode == BACKSPACE) {
          if (CorrectInfo[1].length() > 0) {
            CorrectInfo[1] = CorrectInfo[1].substring(0, CorrectInfo[0].length()-1);
          }
        } else if (keyCode == DELETE) {
          CorrectInfo[1]= "";
        } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT && keyCode != LEFT && keyCode !=RIGHT) {
          CorrectInfo[1] =CorrectInfo[1] + key;
        }
      }
    }
  }
  if (key == '`') {
    gameStore = 0;
  }
}
void saveTimer(int timer) {
  timer-=1;
  if (timer <=0) {
  }
}
void SignUpButton(int X, int Y, int SizeX, int SizeY) {
  fill(125);
  if (mouseX > X && mouseX < X+SizeX && mouseY > Y && mouseY < Y+SizeY ) {
    fill(200);
  }
  if (mousePressed) {
    if (mouseX > X && mouseX < X+SizeX && mouseY > Y && mouseY < Y+SizeY ) {
      login=true;
      saveStrings("data/InfoCheck.txt", CorrectInfo);
      tab = "store page";
    }
  }
  rect(X, Y, SizeX, SizeY);
}
void LoginButton(int X, int Y, int SizeX, int SizeY) {
  fill(125);
  if (mouseX > X && mouseX < X+SizeX && mouseY > Y && mouseY < Y+SizeY ) {
    fill(200);
  }
  if (mousePressed) {
    if (mouseX > X && mouseX < X+SizeX && mouseY > Y && mouseY < Y+SizeY ) {
      if (AccInfo[0].equals(CorrectInfo[0])) {
        if (AccInfo[1].equals(CorrectInfo[1])) {
          login=true;
          tab = "store page";
        } else { 
          fill(255, 0, 0);
          textSize(30);
          text("Incorrect password", 75, 575);
        }
      } else { 
        fill(255, 0, 0);
        textSize(30);
        text("Incorrect username/password", 75, 575);
      }
    }
  }
  rect(X, Y, SizeX, SizeY);
}
void librarySelect() { 
  if (libraryGames==games[0]) {
    libraryGameArt=loadImage("data/SocialisumLogo.png");
    launchGame("H:/Lancher-master/Launcher_dummy/games/SkyScreen/me.bat");
  } else if (libraryGames==games[1]) {
    libraryGameArt=loadImage("data/RuinLogo.png");
    launchGame("H:/Lancher-master/Launcher_dummy/games/SkyScreen/me.bat");
  } else if (libraryGames==games[2]) {
    libraryGameArt=loadImage("data/MusicheroLogo.png");
    launchGame("H:/Lancher-master/Launcher_dummy/games/SkyScreen/me.bat");
  } else if (libraryGames==games[3]) {
    libraryGameArt=loadImage("data/ApocolypseLogo.png");
    launchGame("H:/Lancher-master/Launcher_dummy/games/SkyScreen/me.bat");
  } else if (libraryGames==games[4]) {
    libraryGameArt=loadImage("");
    launchGame("H:/Lancher-master/Launcher_dummy/games/SkyScreen/me.bat");
  } else if (libraryGames==games[5]) {
    libraryGameArt=loadImage("");
    launchGame("H:/Lancher-master/Launcher_dummy/games/SkyScreen/me.bat");
  } else if (libraryGames==games[6]) {
    libraryGameArt=loadImage("");
    launchGame("H:/Lancher-master/Launcher_dummy/games/SkyScreen/me.bat");
  } else if (libraryGames==games[7]) {
    libraryGameArt=loadImage("");
    launchGame("H:/Lancher-master/Launcher_dummy/games/SkyScreen/me.bat");
  } else if (libraryGames==games[8]) {
    libraryGameArt=loadImage("");
    launchGame("H:/Lancher-master/Launcher_dummy/games/SkyScreen/me.bat");
  } else if (libraryGames==games[9]) {
    libraryGameArt=loadImage("");
    launchGame("H:/Lancher-master/Launcher_dummy/games/SkyScreen/me.bat");
  }
  if (libraryGameArt == null) {
    libraryGameArt = loadImage("data/error404.jpg");
  }
}
void libaryPage() {
  if (mousePressed) {
    if (mouseX > 50 && mouseX < 175 && mouseY > 100 && mouseY <150) {
      libraryGames=games[0];
    } else if (mouseX > 50 && mouseX < 175 && mouseY > 160 && mouseY <210) {
      libraryGames=games[1];
    } else if (mouseX > 50 && mouseX < 175 && mouseY > 220 && mouseY <270) {
      libraryGames=games[2];
    } else if (mouseX > 50 && mouseX < 175 && mouseY > 280 && mouseY <330) {
      libraryGames=games[3];
    } else if (mouseX > 50 && mouseX < 175 && mouseY > 340 && mouseY <390) {
      libraryGames=games[4];
    } else if (mouseX > 50 && mouseX < 175 && mouseY > 400 && mouseY <450) {
      libraryGames=games[5];
    } else if (mouseX > 50 && mouseX < 175 && mouseY > 460 && mouseY <510) {
      libraryGames=games[6];
    } else if (mouseX > 50 && mouseX < 175 && mouseY > 520 && mouseY <570) {
      libraryGames=games[7];
    } else if (mouseX > 50 && mouseX < 175 && mouseY > 580 && mouseY <630) {
      libraryGames=games[8];
    } else if (mouseX > 50 && mouseX < 175 && mouseY > 640 && mouseY <700) {
      libraryGames=games[9];
    }
  }
}
void storePageButtons() {
  if (mousePressed) {
    if (tab=="store page") {
      if (mouseX > 0 && mouseX < 100 && mouseY > 500 && mouseY < 600) { // gameStore from 1 to 4 changes what game's store page will appear based on which icon is clicked
        gameStore = 1;
      } else if (mouseX > 120 && mouseX < 220 && mouseY > 500 && mouseY < 600) {
        gameStore = 2;
      } else if (mouseX > 240 && mouseX < 340 && mouseY > 500 && mouseY < 600) {
        gameStore = 3;
      } else if (mouseX > 360 && mouseX < 460 && mouseY > 500 && mouseY < 600) {
        gameStore = 4;
      }
    }
    if (mouseX > 190 && mouseX < 330 && mouseY > 40 && mouseY < 80) { // Library Tab
      gameStore = 0;
      tab = "library page";
    } else if (mouseX > 40 && mouseX < 160 && mouseY > 40 && mouseY < 80) { // Store Tab
      gameStore = 0;
      tab = "store page";
    } else if (mouseX > 375 && mouseX < 515 && mouseY > 40 && mouseY < 80) { // Profile Tab
      tab = "profile page";
      gameStore = 0;
    }
    if (login==false) {
      if (mouseX > 1200 && mouseX < 1350 && mouseY > 10 && mouseY < 60) {
        tab = "login";
      }
    }
  }
}