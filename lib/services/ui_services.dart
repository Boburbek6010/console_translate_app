///prints with border
void pBorder(Object? value){
  print('\x1b[51m $value \x1b[0m');
}

///prints bold
void pBold(Object? value){
  print('\x1B[1m $value \x1B[0m');
}

///prints in red color
void pRed(Object? value){
  print('\x1b[31m $value\x1b[0m');
}

///prints in green color
void pGreen(Object? value){
  print('\x1b[32m $value\x1b[0m');
}

///prints in blue color
void pBlue(Object? value){
  print('\x1b[34m $value\x1b[0m');
}

///prints the beginning of the top of the application
void printBeginning(){
  print("  _________________________________");
  print(" |                                 |");
  print(" |                                 |");
  pBold("|       📚Translate App📚        |");
  print(" |                                 |");

}

///prints the bottom of the application
void printExit() {
  print(" |      0. Exit ❌                 |");
  printVoid();
  print(" |_________________________________|");
}

///prints a void strings in order to fulfill the ui
void printVoid(){
  print(" |                                 |");
  print(" |                                 |");
}

///displays a menu
void displayMenu(List<String> actions, String menuName) {
  printBeginning();
  print("\t\t\t$menuName");
  printVoid(); printVoid();
  actions.forEach((element) {
    print("\t\t$element");
  });
  printExit();
}

///displays the menu after the translation of a word
void displayTranslation({
required String word,
required String translation,
required String fromLang,
required String toLang,
  String? description}){
 printBeginning();
  pRed("     $fromLang:");
  pRed("           $word");
  print(" |---------------------------------|");
  pBlue("     $toLang:");
  pBlue("           $translation");
  print(" |---------------------------------|");
  if (description != null) {
    pGreen("     Description:");
    pGreen("     $description");
    printVoid();
  }else{
    printVoid();
  }
  print(" |      1. Main Menu 🔙            |");
  printExit();
}

///displays a new word that has been added by a user
void displayNewWord({
  required String word,
  required String translation,
  required String fromLang,
  required String toLang,
  required String description
}){
  displayTranslation(
      word: word,
      translation: translation,
      fromLang: fromLang,
      toLang: toLang,
      description: description
  );
}

///displays the history of words that has been searched
void displayHistoryofWords(List<String> words){
  printBeginning();
  print(" |           History📜             |");
  print(" |                                 |");
  for(int i = words.length-1; i>=0; i--){
    print("\t\t⭐️ ${words[i]}");
  }
  printVoid();
  print(" |      1. Main Menu 🔙            |");
  printExit();
}

///displays the setting menu
void displaySettingMenu(){
  List<String> actions = [
    "1. Delete Account",
    "2. Change Language",
    "3. Log Out",
    "\n",
    "4. Main Menu 🔙 "
  ];
  String menuName = "Settings Menu";

  displayMenu(actions, menuName);
}

///displays the main menu
void displayMainMenu() {
  List<String> actions = [
    "1. Translate a word 🔎",
    "2. Add new word ✅",
    "3. History📜",
    "4. Settings"
  ];
  String menu = "Main Menu";
  displayMenu(actions, menu);
}
