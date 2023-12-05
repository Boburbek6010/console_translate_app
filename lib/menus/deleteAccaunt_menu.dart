
import 'package:console_translate_app/menus/authenfication_menu.dart';
import 'package:console_translate_app/menus/setting_mainMenu.dart';
import 'package:console_translate_app/services/extension_service.dart';
import 'package:console_translate_app/services/navigation_service.dart';
import 'package:console_translate_app/services/io_services.dart';

import '../models/user_auth.dart';
import '../services/network_service.dart';
import 'main_menu.dart';

class DeleteAccountMenu extends Menu {
  static const id = "/deleteAccount_menu";

  static Future<void> checkPassword(password) async {
    bool passwordCheck = await DeleteAccountMenu.check( password);

    if (passwordCheck == false) {
      print("tryAgain".tr);
      await Navigator.push(SettingMainMenu());
    }else {
      print("successDelete".tr);
      await Navigator.push(AuthenficationMenu());
    }
  }
  @override
  Future<void> build() async {
    IOService.write("enterPassword".tr);
    String password = IOService.read();
    await  checkPassword(password);
  }

  static Future<bool> check(String password) async {
    String data = await NetworkService.getData(NetworkService.baseUrlUserAuth, NetworkService.apiUserAuth);
    List<UserAuth> userAuth = userListFromData(data);
    for (int i = 0; i < userAuth.length; i++) {
      if (userAuth[i].password == password) {

     await NetworkService.deleteData(NetworkService.baseUrlUserAuth, NetworkService.apiUserAuth, userAuth[i].id);

      return true;
      }
    }
    return false;
  }

}