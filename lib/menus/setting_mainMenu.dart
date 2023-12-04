import 'dart:io';

import 'package:console_translate_app/menus/logOut_menu.dart';
import 'package:console_translate_app/menus/main_menu.dart';
import 'package:console_translate_app/services/ui_services.dart';

import '../services/navigation_service.dart';


class SettingMainMenu extends Menu{
  static const id = "/setting_mainMenu";
  void settingMainMenuChoices()async{
    print("Tanlang: ");
    int choice = int.parse(stdin.readLineSync()!);
    switch(choice){
      case 1:
        ///settings in main menu 1
      case 2:
    ///settings in main menu 2
      case 3:
      await Navigator.push(LogOutMenu());
      case 4:
    ///settings in main menu 4
      default:
        print("Noto'g'ri raqam kiritildi");
        build();
    }
  }

  @override
  Future<void> build() async {
  displaySettingMenu();
  settingMainMenuChoices();
  }
}