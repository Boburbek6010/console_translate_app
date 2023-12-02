import 'dart:io';

import '../services/language_service.dart';
import 'main_menu.dart';


class SettingMenu extends Menu{
  static const id = "/settings_menu";

  Future<void> selectMenu(String press) async {
    switch(press){
      case "I":{
        LanguageService.setLanguage = Language.uz;
      }
      break;
      case "II":{
        LanguageService.setLanguage = Language.ru;
      }
      break;
      case "III":{
        LanguageService.setLanguage = Language.en;
      }
      default: build();
    }
  }


  @override
  Future<void> build()async{
    print("I. UZ");
    print("II. RU");
    print("III. EN");

    String press = stdin.readLineSync() ?? "";

    await selectMenu(press);


  }

}