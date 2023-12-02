import 'dart:io';

import 'package:console_translate_app/menus/authenfication_menu.dart';
import 'package:console_translate_app/menus/setting_menu.dart';
import 'package:console_translate_app/services/extension_service.dart';
import 'package:console_translate_app/services/navigation_service.dart';
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
      default: build();
    }
  }

  @override
  Future<void> build()async{
    print("welcome".tr);
    print("1. ${"setting".tr}");
    print("2. ${"start".tr}");

    String press = stdin.readLineSync() ?? "";

    await selectMenu(press);


  }

}
