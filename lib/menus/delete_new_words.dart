import 'package:console_translate_app/services/extension_service.dart';

import 'delete_incorrect_words_menu.dart';
import 'main_menu.dart';
import '../models/history_of_words.dart';
import '../services/io_services.dart';
import '../services/network_service.dart';
import '../services/navigation_service.dart';
class DeleteNewWords extends Menu {
  static const id = "/delete_searched_menu";

  Future<void> selectMenu(String press) async {
    switch (press) {
      case"1":
        {
          await deleteNewWordsFromList();
        }
      case"2":
        {
          await Navigator.push(DeleteIncorrectWords());
        }
      default:
        build();
    }
  }

  @override
  Future<void> build() async {
    await newWordList();
    IOService.write("chooseFT".tr);
    IOService.write("deleteWords".tr);
    IOService.write("goBack".tr);
    String press = IOService.read();
    await selectMenu(press);
  }
  static Future<void> newWordList()async{
    String data =  await NetworkService.getData(NetworkService.baseUrlWord, NetworkService.apiNewWord);
    List<SearchedWord> list = swFromJson(data);
    for (int i = 0; i<list.length; i++) {
      print("${i+1}. ${list[i].searchedWord} id: ${list[i].id}\n");
    }
  }

  Future<void> deleteNewWordsFromList()async{
    print("enterWordsSD".tr);
    String? idChecker = IOService.read();
    int? idChekerInt = int.tryParse(idChecker);
    int counter = 0;
    String data =  await NetworkService.getData(NetworkService.baseUrlWord, NetworkService.apiNewWord);
    List<SearchedWord> list = swFromJson(data);
    if(idChekerInt == null || idChekerInt > list.length){
      IOService.write("enterOnlyNum".tr);
      deleteNewWordsFromList();
    }else{
      for (int i=0;  i<list.length; i++) {
        if(list[idChekerInt-1] == list[i]){
          counter++;
        }
      }
    }

    if(counter!=0){
      await NetworkService.deleteData(NetworkService.baseUrlWord, NetworkService.apiWord, list[idChekerInt!-1].id);
      IOService.write("deleteWords".tr);
      await build();
    }
  }

}