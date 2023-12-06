import 'dart:io';

import 'package:console_translate_app/menus/authenfication_menu.dart';
import 'package:console_translate_app/menus/setting_mainMenu.dart';
import 'package:console_translate_app/menus/setting_menu.dart';
import 'package:console_translate_app/services/extension_service.dart';
import 'package:console_translate_app/services/io_services.dart';
import 'package:console_translate_app/services/navigation_service.dart';
import '../services/io_services.dart';
import '../services/ui_services.dart';
import 'addNewWord_menu.dart';
import 'dictionary_menu.dart';
import 'history_menu.dart';
import 'main_menu.dart';

class HomeMenu extends Menu{
  static const id = "/home_menu";

  Future<void> selectMenu(String press) async {
    switch(press){
      case "1":{
        await Navigator.push(SettingMenu());
      }
      break;
      case "2":{
        await Navigator.push(AuthenficationMenu());
      }
      default:
        IOService.write("tryAgain".tr);
        build();
    }
  }

  @override
  Future<void> build()async{
    print("welcome".tr);
    print("1. ${"ChangeLan".tr} ⚙️");
    print("2. ${"start".tr} ▶️");

    String press = stdin.readLineSync() ?? "";

    await selectMenu(press);
  }



}
class Choices extends Menu {


  @override
  Future<void> build() async {
    IOService.write('choose'.tr);
    String choice = IOService.read();
    switch (choice) {
      case "0":
        exit(0);
      case "1":
        await Navigator.push(AddNewWord());
        break;
      case "2":
        await Navigator.push(HistoryMenu());
        break;
      case "3":
        await Navigator.push(DictionaryMenu());
        break;
      case "4":
       await Navigator.push(SettingMainMenu());
       break;
      default:
        print("tryAgain".tr);
        displayMainMenu();
        build();
        break;
    }
  }
}
