
import 'dart:io';

import 'package:console_translate_app/services/extension_service.dart';

import '../models/new_word_model.dart';
import '../services/network_service.dart';
import '../services/ui_services.dart';
import 'main_menu.dart';

class HistoryMenu extends Menu{
  static const id = "/history_menu";

  @override
  Future<void> build() async{
    historyMenuUi();
    print('choose'.tr);
    int choice = int.parse(stdin.readLineSync()!);
    switch(choice){
      case 0:
        exit(0);
      case 1:
       displayHistory();
      case 2:
        displayAddedWord();
      default:
        print("Noto'g'ri kiritingiz, qayta urining".tr);
        build();
    }
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


