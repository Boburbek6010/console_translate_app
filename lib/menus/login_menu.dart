
import 'dart:io';
import 'package:console_translate_app/menus/home_menu.dart';
import 'package:console_translate_app/menus/user_menu.dart';
import 'package:console_translate_app/models/user_auth.dart';
import 'package:console_translate_app/services/network_service.dart';
import '../services/navigation_service.dart';
import '../services/ui_services.dart';
import 'main_menu.dart';


class LogInMenu extends Menu {
  static const id = "/login_menu";

  static Future<void> logIn(username,  password) async {
    /// Check if the username exists in the mock API data
    bool usernameExists = await LogInMenu.checkMap(username, password);

    if (usernameExists == false) {
      print("Siz ro'yxatdan o'tmagansiz!");
      await Navigator.push((UserMenu()));
    }else {
      print("Kirish muvaffaqiyatli!");
      /// Navigate to the main menu
      displayMainMenu();
      await Navigator.push(Choices());

    }
  }

  @override
  Future<void> build() async {
    print('Iltimos, foydalanuvchi nomini kiriting: ');
    String username = stdin.readLineSync()!;
    print('Iltimos password kiriting');
    String password = stdin.readLineSync()!;
    logIn(username, password);
  }

  static Future<bool> checkMap(String username,String password) async {
    String data = await NetworkService.getData(NetworkService.baseUrlUserAuth, NetworkService.apiUserAuth);
    List<UserAuth> userAuth = userListFromData(data);
    for (int i = 0; i < userAuth.length; i++) {
      if (userAuth[i].username == username && userAuth[i].password == password) {
        return true;
      }
    }
    return false;
  }

}










