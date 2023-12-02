import 'dart:io';

import 'package:console_translate_app/services/ui_services.dart';

abstract class Menu {
  Future<void> build();
}



void translateWord() {
  List<String> welwelwell = [];

  List<String> actions = [
    "Enter the current Language: ",
    "Enter the desired Language: ",
    "Enter a word: "
  ];

  actions.forEach((e) {
    print(e);
    String eh = stdin.readLineSync() ?? "";
    if(checkEmpty(eh)) preventNull(eh, e);
    welwelwell.add(eh);
  });

  print(welwelwell);
}

bool checkEmpty(String word){
  if(word == "") return true;
  else return false;
}

void preventNull(String? string, String action){
  while(string==""){
    print("$action");
    string = stdin.readLineSync();
  }
}



//
// void translateWord() {
//   print("Enter the current Language: ");
//   String? word = stdin.readLineSync();
//
//   print("Enter the desired Language: ");
//
//   print("Enter a word: ");
//
// }
//
// bool checkNull(String word){
//   if(word == null) return true;
//   else return false;
// }
//
// void preventNull(String? string, String action){
//   while(string==null){
//     print("$action");
//     string = stdin.readLineSync();
//   }
// }

void translateWordProcess(String word) {
  String translation = "";
  String fromLang = "";
  String toLang = "";
  displayTranslation(word: word, translation: translation, fromLang: fromLang, toLang: toLang);
}

void addNewWord() {
  print("Enter a new word: ");
  String? word = stdin.readLineSync()??" ";
  while(word!.isEmpty){
    print("Enter a word: ");
    word = stdin.readLineSync();
  }
  translateWordProcess(word);

}

void displayHistory() {}