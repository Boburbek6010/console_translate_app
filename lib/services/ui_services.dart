import 'package:console_translate_app/services/extension_service.dart';

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
  print("  ______________________________________________  ");
  print(" |                                              | ");
  print(" |                                              | ");
  pBold("|                  📚TranslateApp📚              | ");
  print(" |                                              | ");

}

///prints the bottom of the application
void printExit() {
  print(" |                   0. Exit ❌                  |");
  printVoid();
  print(" |_______________________________________________|");
}

///prints a void strings in order to fulfill the ui
void printVoid(){
  print(" |                                               |");
  print(" |                                               |");
}

///displays a menu
void displayMenu(List<String> actions, String menuName) {
  printBeginning();
  print("\t\t\t\t\t$menuName");
  printVoid(); printVoid();
  for (var element in actions) {
    print("\t\t$element");
  }
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
  print(" |-----------------------------------------------|");
  pBlue("     $toLang:");
  pBlue("           $translation");
  print(" |-----------------------------------------------|");
  if (description != null) {
    pGreen("Description".tr);
    pGreen("     $description");
    printVoid();
  }else{
    printVoid();
  }
  print(" |       1. ${"mainMenu".tr}🔙                          |");
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
void displayListofWords(List<String> words, String menu){
  printBeginning();
  print(" |               ${"historyMenu".tr}📜                      |");
  print("             $menu");
  for(int i = words.length-1; i>=0; i--){
    print("\t\t\t⭐️ ${words[i]}");
  }
  printVoid();
  print(" \t\t\t1. Main Menu 🔙");
  print(" |               1. ${"mainMenu".tr}🔙              |");
  printExit();
}


///displays the setting menu
void displaySettingMenu(){
  List<String> actions = [
    "1. ${"deleteAccount".tr}",
    "2. ${"LogOut".tr}\n",
    "3. ${"mainMenu".tr}🔙"
  ];
  String menuName = "settingsMenu".tr;

  displayMenu(actions, menuName);
}

///displays the main menu
void displayMainMenu() {
  List<String> actions = [
    "1. ${"AddNewWord".tr} ✅",
    "2. ${"history".tr}📜",
    "3. ${"dictionary".tr}🔎",
    "4. ${"settings".tr}"
  ];
  String menu = "mainMenu".tr;
  displayMenu(actions, menu);
}

///display admin menu ui
void adminMenuUi(){
  List<String> actionsAdmin = [
    "1. ${"usersInfo".tr}",
    "2. ${"deleteWrongWords".tr}"
  ];
  String adminMenu = "adminMenu".tr;
  displayMenu(actionsAdmin, adminMenu);
}

void historyMenuUi(){
  List<String> actionsH = [
    "1. ${"searchedWords".tr}",
    "2. ${"addedWords".tr}",
    "3. ${"goBack".tr}"
  ];
  String historyM = "historyMenu".tr;
  displayMenu(actionsH, historyM);
}

