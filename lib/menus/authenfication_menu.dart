
import 'dart:io';

import 'package:console_translate_app/menus/admin_login_menu.dart';
import 'package:console_translate_app/menus/main_menu.dart';
import 'package:console_translate_app/menus/user_menu.dart';
import 'package:console_translate_app/services/extension_service.dart';
import 'package:console_translate_app/services/io_services.dart';
import 'package:console_translate_app/services/navigation_service.dart';
import 'package:console_translate_app/services/ui_services.dart';


class AuthenficationMenu extends Menu{
  static const id = "/authenfiaction_menu";

  Future<void> selectWhoAreU(String press) async {
    switch(press){
      case "1":{
         await Navigator.push(UserMenu());
         break;
      }
      break;

      case "2":{
        await Navigator.push(AdminLoginMenu());
        break;
      }
      case "0":{
        exit(0);
      }
      default: build();
    }
  }

  @override
  Future<void> build() async{
    List<String> actions = [
      "1.${"user".tr} 👥",
      "2.${"admin".tr} 👨🏻‍💻"
    ];
    displayMenu(actions, " ");
    IOService.write(" ---> ");
    String press = stdin.readLineSync() ?? "";
    await selectWhoAreU(press);


  }

}


