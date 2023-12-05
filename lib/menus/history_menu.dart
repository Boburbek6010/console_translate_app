
import 'dart:io';

import 'package:console_translate_app/menus/home_menu.dart';
import 'package:console_translate_app/services/extension_service.dart';
import 'package:console_translate_app/services/io_services.dart';

import '../models/new_word_model.dart';
import '../services/network_service.dart';
import '../services/ui_services.dart';
import 'main_menu.dart';
import 'package:console_translate_app/services/navigation_service.dart';

class HistoryMenu extends Menu{
  static const id = "/history_menu";
 Future<void> selectMenu(String press) async{
   switch(press){
     case "0":{
         exit(0);
       }
     case "1":
       {
        await displayHistory();
         break;
       }
     case "2":{
       await displayAddedWord();
       break;
     }
     case "3":{
       displayMainMenu();
       await Navigator.push(Choices());
       break;
     }
     default:
       print("Noto'g'ri kiritingiz, qayta urining".tr);
       build();
   }
}
  @override
  Future<void> build() async{
    historyMenuUi();
    print('choose'.tr);
    String choice = IOService.read();
    await selectMenu(choice);
  }
}


Future<void> displayAddedWord() async {
  List<String> addedCWord = [];
  List<String> addedWord = [];
  String data = await NetworkService.getData(NetworkService.baseUrlWord,NetworkService.apiNewWord);
  nwFromJson(data).forEach((element) {
    addedCWord.add(element.word);
  });
  if(addedCWord.length > 10){
    for(int i = 0; i <= 10; i++){
      addedWord.add(addedCWord[i]);
    }
    displayListofWords(addedWord,"addedWords".tr);
  }else{
    displayListofWords(addedCWord,"addedWords".tr);
  }
}


