
import 'dart:io';

import 'package:console_translate_app/menus/home_menu.dart';
import 'package:console_translate_app/menus/main_menu.dart';
import 'package:console_translate_app/services/extension_service.dart';
import 'package:console_translate_app/services/io_services.dart';
import 'package:console_translate_app/services/ui_services.dart';
import 'package:console_translate_app/services/navigation_service.dart';


import '../models/language_model.dart';
import '../services/network_service.dart';

class AddNewWord extends Menu{

  static const id = "/addNewWord_menu";
  Future<void> selectMenu(String press)async{
    switch(press){
      case "0":{
        exit(0);
      }
      case "1":{
        displayMainMenu();
        await Navigator.push(Choices());
        break;
      }

    }
  }

  @override
  Future<void> build() async{
   addNewWord();
  }

  void displayNewW({
    required String word,
    required String translation,
    required String fromLang,
    required String toLang,
    required String description
  }){
    displayNewWord(
        word: word,
        translation: translation,
        fromLang: fromLang,
        toLang: toLang,
        description: description);
  }
Future<void> addNewWord() async{
  List<String> answers = [];
  List<String> actions = [
    "fromLang".tr,
    "toLang".tr,
    "word".tr,
    "translation".tr,
    "description".tr
  ];

  actions.forEach((e) {
    print(e);
    String eh = stdin.readLineSync() ?? "";
    if(checkEmpty(eh)) preventNull(eh, e);
    answers.add(eh);
  });
  addNewWordProcess(answers);
}

Future<void> addNewWordProcess(List<String> answers) async {
  Map<String, String> newWord = {
    "currentLang": answers[0],
    "desiredLang": answers[1],
    "word": answers[2],
    "translation": answers[3],
    "description": answers[4],
  };

  while(!checkLangContain(newWord["currentLang"]!)){
    IOService.write("Tanlangan til noto'g'ri kiritilgan! Qaytadan kiriting! ${"fromLang".tr}");
    newWord["currentLang"] = IOService.read();
  }

  while(!checkLangContain(newWord["desiredLang"]!)){
    IOService.write(" til noto'g'ri kiritilgan! Qaytadan kiriting! ${"toLang".tr}");
    newWord["desiredLang"] = IOService.read();
  }

  await NetworkService.postData(
      newWord, NetworkService.baseUrlWord, NetworkService.apiNewWord);
  displayNewWord(word: newWord["word"]!,
      translation: newWord["translation"]!,
      fromLang: newWord["currentLang"]!,
      toLang: newWord["desiredLang"]!,
      description: newWord["description"]!);
  IOService.write("--->");
  String choice = IOService.read();
  await selectMenu(choice);
}
}


bool checkLangContain(String lang){
  if(LanguageList.contains(lang)) return true;
  else return false;
}

