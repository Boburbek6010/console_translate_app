import 'dart:io';

import 'package:console_translate_app/services/ui_services.dart';

import 'main_menu.dart';

class HomeMenu extends Menu {

  void selectMenu(){
   displayMainMenu();
   print("ENTER NUMBER:");
   String press = stdin.readLineSync() ?? "";
    switch(press){
      case "0":
        exit(0);
      case "1":
        translateWord();
        break;
      case "2":
        addNewWord();
        break;
      case "3":
        displayHistory();
        break;
      case "4":
        displaySettingMenu();
        break;
      default:
        selectMenu();
    }
  }

  @override
  Future<void> build() async {
    selectMenu();
  }
}
