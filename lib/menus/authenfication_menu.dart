
import 'dart:io';

import 'package:console_translate_app/menus/admin_menu.dart';
import 'package:console_translate_app/menus/main_menu.dart';
import 'package:console_translate_app/menus/user_menu.dart';
import 'package:console_translate_app/services/navigation_service.dart';


class AuthenficationMenu extends Menu{
  static const id = "/authenfiaction_menu";

  Future<void> selectWhoAreU(String press) async {
    switch(press){
      case "I":{
         await Navigator.push((UserMenu()));
      }
      break;

      case "II":{
        await Navigator.push((AdminMenu()));
      }
      default: build();
    }
  }

  @override
  Future<void> build() async{
    print("I. USER");
    print("II. ADMIN");

    String press = stdin.readLineSync() ?? "";

    await selectWhoAreU(press);


  }

}


