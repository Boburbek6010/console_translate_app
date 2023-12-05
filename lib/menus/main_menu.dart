import 'dart:io';
import 'package:console_translate_app/services/extension_service.dart';
import 'package:console_translate_app/services/io_services.dart';
import 'package:console_translate_app/services/network_service.dart';
import 'package:console_translate_app/services/ui_services.dart';
import '../models/history_of_words.dart';
import 'package:console_translate_app/services/navigation_service.dart';

import 'home_menu.dart';



abstract class Menu {
  Future<void> build();
}

///displays the History of searched words by going api and getting data
Future<void> displayHistory() async {
  List<String> searchedCWord = [];
  List<String> searchedWord = [];
  String data = await NetworkService.getData(NetworkService.baseUrlWord,NetworkService.apiWord);
  swFromJson(data).forEach((element) {
    searchedCWord.add(element.searchedWord);
  });

  if(searchedCWord.length > 8){
    for(int i = 0; i <= 8; i++){
      searchedWord.add(searchedCWord[i]);
    }
    displayListofWords(searchedWord,"seerchedWords");
  }else{
    displayListofWords(searchedCWord,"addedWords");
  }
  IOService.write("-->");
  String choice = IOService.read();
  selectMenu(choice);
}
Future<void> selectMenu(String press)async{
  switch(press){
    case "0":{
      exit(0);
    }
    case "1":
      {
        displayMainMenu();
        await Navigator.push(Choices());
        break;
      }
    default:
      print("Noto'g'ri kiritingiz, qayta urining".tr);
      await displayHistory();

  }
}


///if the string is empty returns false
bool checkEmpty(String word){
  if(word == "") return true;
  else return false;
}

///prevents empty input bu asking a question again and again
void preventNull(String? string, String action){
  while(string==""){
    print("$action");
    string = stdin.readLineSync();
  }
}

bool checkLangContain(String lang){
  return true;
}



