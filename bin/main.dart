import 'package:console_translate_app/menus/history_menu.dart';
import 'package:console_translate_app/menus/setting_menu.dart';
import 'package:console_translate_app/my_app.dart';
import 'package:console_translate_app/services/language_service.dart';


Future<void> main() async {
  MyApp(
    home: HistoryMenu(),
    lang: Language.uz,
    routes: {
      HistoryMenu.id:HistoryMenu(),
      SettingMenu.id:SettingMenu()
    },
  );
}
