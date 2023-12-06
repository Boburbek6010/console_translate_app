
import 'dart:io';

import 'package:console_translate_app/menus/login_menu.dart';
import 'package:console_translate_app/menus/main_menu.dart';
import 'package:console_translate_app/menus/register_menu.dart';
import 'package:console_translate_app/services/extension_service.dart';
import 'package:console_translate_app/services/navigation_service.dart';
import 'package:console_translate_app/services/ui_services.dart';

import '../services/io_services.dart';

class UserMenu extends Menu{
  static const id = "/user_menu";

  Future<void> selectWhoAreU(String press) async {
    switch(press){
      case "1":{
        Navigator.push(LogInMenu());
      }
      break;

      case "2":{
        await Navigator.push(RegisterMenu());
      }
      default:
        IOService.write("tryAgain".tr);
        build();
    }
  }

  @override
  Future<void> build() async{
    List<String> actions = ["1. ${"SignIn".tr} ✅","2. ${"SignUp".tr} ❎"];
    displayMenu(actions, "");
    IOService.write(" ---> ");
    String press = stdin.readLineSync() ?? "";

    await selectWhoAreU(press);


  }

}


