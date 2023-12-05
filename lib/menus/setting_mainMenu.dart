
import 'dart:io';

import 'package:console_translate_app/menus/home_menu.dart';
import 'package:console_translate_app/menus/logOut_menu.dart';
import 'package:console_translate_app/menus/deleteAccaunt_menu.dart';
import 'package:console_translate_app/menus/main_menu.dart';
import 'package:console_translate_app/services/ui_services.dart';

import '../services/navigation_service.dart';


class SettingMainMenu extends Menu{
  static const id = "/setting_mainMenu";
  void settingMainMenuChoices()async{
    print("Tanlang: ");
    int choice = int.parse(stdin.readLineSync()!);
    switch(choice){
        case 1:{
         await Navigator.push(DeleteAccountMenu());
         break;
        }
        case 2:{
          await Navigator.push(LogOutMenu());
          break;
          }
          case 3:{
          await Navigator.push(Choices());
          break;
        }
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