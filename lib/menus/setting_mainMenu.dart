import 'dart:io';

import 'package:console_translate_app/menus/deleteAccaunt_menu.dart';
import 'package:console_translate_app/menus/main_menu.dart';
import 'package:console_translate_app/services/ui_services.dart';
import 'package:console_translate_app/services/navigation_service.dart';

import 'admin_menu.dart';

class SettingMainMenu extends Menu{
  static const id = "/setting_mainMenu";
  void settingMainMenuChoices()async{
    print("Tanlang: ");
    int choice = int.parse(stdin.readLineSync()!);
    switch(choice){
      case 1:
        await Navigator.push(DeleteAccountMenu());
      case 2:
    ///settings in main menu 2
      case 3:
    ///settings in main menu 3
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