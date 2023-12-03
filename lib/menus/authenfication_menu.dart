
import 'package:console_translate_app/menus/main_menu.dart';

import '../services/language_service.dart';

class Authenfication extends Menu{
  static const id = "/authenfiaction_menu";

  Future<void> selectWhoAreU(String press) async {
    switch(press){
      case "I":{
        // await Navigator.push(());
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
  Future<void> build() {
    throw UnimplementedError();
  }


}