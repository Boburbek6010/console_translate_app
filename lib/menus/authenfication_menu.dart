
import 'dart:io';

import 'package:console_translate_app/menus/admin_menu.dart';
import 'package:console_translate_app/menus/main_menu.dart';
import 'package:console_translate_app/menus/user_menu.dart';
import 'package:console_translate_app/services/navigation_service.dart';


class AuthenficationMenu extends Menu{
  static const id = "/authenfiaction_menu";

  Future<void> selectWhoAreU(String press) async {
    switch(press){
      case "1":{
         await Navigator.push((UserMenu()));
      }
      break;

      case "2":{
        await Navigator.push((AdminMenu()));
      }
      default: build();
    }
  }

  @override
  Future<void> build() async{
    print("1. USER");
    print("2. ADMIN");

    String press = stdin.readLineSync() ?? "";

    await selectWhoAreU(press);


  }

}


