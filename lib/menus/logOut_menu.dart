import 'dart:io';

import 'package:console_translate_app/menus/authenfication_menu.dart';
import 'package:console_translate_app/menus/setting_mainMenu.dart';
import 'package:console_translate_app/services/extension_service.dart';

import '../services/navigation_service.dart';
import 'main_menu.dart';

class LogOutMenu extends Menu{
  static const id = "/logOut_menu";

  Future<void> selectMenu(String press) async {
    switch(press){
      case "1":{
        await Navigator.push(AuthenficationMenu());
      }
      break;
      case "2":{
        await Navigator.push(SettingMainMenu());
      }
      default: build();
    }
  }

  @override
  Future<void> build()async{
    print("LogOut".tr);
    print("1. ${"yes".tr}");
    print("2. ${"no".tr}");

    String press = stdin.readLineSync() ?? "";

    await selectMenu(press);
  }



}