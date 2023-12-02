
import 'dart:io';

import 'package:console_translate_app/menus/main_menu.dart';
import 'package:console_translate_app/services/navigation_service.dart';

import '../services/language_service.dart';

class AdminMenu extends Menu{
  static const id = "/user_menu";

  Future<void> selectWhoAreU(String press) async {
    switch(press){
      case "I":{
        print("Kirish");
      }
      break;

      default: build();
    }
  }

  @override
  Future<void> build() async{
    print("I. LOG IN");

    String press = stdin.readLineSync() ?? "";

    await selectWhoAreU(press);


  }

}


