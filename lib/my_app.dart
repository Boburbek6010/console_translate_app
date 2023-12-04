
import 'package:console_translate_app/services/language_service.dart';

import 'menus/main_menu.dart';

// void main() {
//   // displaySettingMenu();
//   // displayNewWord(word: "word",
//   //     translation: "translation",
//   //     fromLang: "fromLang",
//   //     toLang: "toLang",
//   //     description: "this is description");
//   List<String> words = ["hello","hi","ehehhe","Muslima"];
//   displayHistoryofWords(words);
// }

class MyApp{

  static Map<String, Menu> routeMenu = {};

  MyApp({
    required Menu home,
    required Map<String, Menu> routes,
    required Language lang,
  }){
    LanguageService.setLanguage = lang;
    routeMenu = routes;
    _runApp(home);
  }

  Future<void> _runApp(Menu menu)async{
    // while(true){
      await menu.build();
    // }


  }


}