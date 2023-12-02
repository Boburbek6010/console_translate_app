
import 'dart:io';

import 'package:console_translate_app/menus/main_menu.dart';
import 'package:console_translate_app/menus/register_menu.dart';
import 'package:console_translate_app/services/navigation_service.dart';

import '../services/language_service.dart';

class UserMenu extends Menu{
  static const id = "/user_menu";

  Future<void> selectWhoAreU(String press) async {
    switch(press){
      case "I":{
        print("You chose log in");
      }
      break;

      case "II":{
        await Navigator.push(RegisterMenu());
      }
      default: build();
    }
  }

  @override
  Future<void> build() async{
    print("I. LOG IN");
    print("II. SIGN UP");

    String press = stdin.readLineSync() ?? "";

    await selectWhoAreU(press);


  }

}


