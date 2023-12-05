import 'package:console_translate_app/menus/dictionary_menu.dart';
import 'package:console_translate_app/menus/history_menu.dart';
import 'package:console_translate_app/services/language_service.dart';
import 'menus/main_menu.dart';

void main() {
  // addNewWord();
  // displayCheck();
  // translateWord();
  displayAddedWord();
}


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
      await menu.build();
  }
}