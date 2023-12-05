import 'dart:io';

import 'package:console_translate_app/menus/home_menu.dart';
import 'package:console_translate_app/services/navigation_service.dart';

import '../services/language_service.dart';
import 'main_menu.dart';
import 'authenfication_menu.dart';


class SettingMenu extends Menu{
  static const id = "/settings_menu";

  Future<void> selectMenu(String press) async {
    switch(press){
      case "1":{
        LanguageService.setLanguage = Language.uz;
        await Navigator.push(HomeMenu());
      }

      case "2":{
        LanguageService.setLanguage = Language.ru;
        await Navigator.push(HomeMenu());
      }

      case "3":{
        LanguageService.setLanguage = Language.en;
        await Navigator.push(HomeMenu());
      }

      default: build();
    }
  }

  @override
  Future<void> build()async{
    print("1. UZ");
    print("2. RU");
    print("3. EN");

    String press = stdin.readLineSync() ?? "";

    await selectMenu(press);


  }

}