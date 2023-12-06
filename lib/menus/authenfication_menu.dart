
import 'dart:io';

import 'package:console_translate_app/menus/admin_login_menu.dart';
import 'package:console_translate_app/menus/main_menu.dart';
import 'package:console_translate_app/menus/user_menu.dart';
import 'package:console_translate_app/services/extension_service.dart';
import 'package:console_translate_app/services/navigation_service.dart';


class AuthenficationMenu extends Menu{
  static const id = "/authenfiaction_menu";

  Future<void> selectWhoAreU(String press) async {
    switch(press){
      case "1":{
         await Navigator.push(UserMenu());
      }
      break;

      case "2":{
        await Navigator.push(AdminLoginMenu());
      }
      default: build();
    }
  }

  @override
  Future<void> build() async{
    print("1.${"user".tr} 👥");
    print("2.${"admin".tr} 👨🏻‍💻");

    String press = stdin.readLineSync() ?? "";

    await selectWhoAreU(press);


  }

}


