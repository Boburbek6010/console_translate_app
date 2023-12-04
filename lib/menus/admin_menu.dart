import 'dart:io';

import 'package:console_translate_app/menus/setting_menu.dart';
import 'package:console_translate_app/menus/users_information_list_menu.dart';
import 'package:console_translate_app/services/extension_service.dart';
import 'package:console_translate_app/services/ui_services.dart';

import '../services/navigation_service.dart';
import 'authenfication_menu.dart';
import 'main_menu.dart';

class AdminMenu extends Menu{
  static const id = "/home_menu";

  Future<void> selectMenu(String press) async {
    switch(press){
      case "1":{
        await Navigator.push(UsersInformationListMenu());
      }
      break;
      case "2":{
        await Navigator.push(AuthenficationMenu());
      }
      default: build();
    }
  }

  @override
  Future<void> build()async{
    print("${"welcome".tr} **ADMIN**");
    adminMenuUi();

    String press = stdin.readLineSync() ?? "";

    await selectMenu(press);
  }



}