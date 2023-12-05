import 'package:console_translate_app/menus/check_with_ai.dart';
import 'package:console_translate_app/services/language_service.dart';
import 'menus/main_menu.dart';

void main() {
  // addNewWord();
  // translateWord();
  // displayAddedWord();
displayCheck();
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