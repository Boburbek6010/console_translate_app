import 'package:console_translate_app/menus/home_menu.dart';
import 'package:console_translate_app/menus/setting_menu.dart';
import 'package:console_translate_app/my_app.dart';
import 'package:console_translate_app/services/language_service.dart';


Future<void> main() async {
  MyApp(
    home: HomeMenu(),
    lang: Language.uz,
    routes: {
      HomeMenu.id:HomeMenu(),
      SettingMenu.id:SettingMenu()
    },
  );
}
