
import 'dart:io';

import 'package:console_translate_app/menus/admin_menu.dart';
import 'package:console_translate_app/menus/main_menu.dart';
import 'package:console_translate_app/models/admin_auth.dart';
import 'package:console_translate_app/services/extension_service.dart';
import 'package:console_translate_app/services/navigation_service.dart';
import 'package:console_translate_app/services/network_service.dart';
import 'package:console_translate_app/services/ui_services.dart';

class AdminLoginMenu extends Menu{
  static const id = "/admin_login_menu";

  Future<void> adminLogIn(String usernameAdmin, String passwordAdmin) async {
  ///result of checking username and password of admin;

  bool resultOfChecking = await AdminLoginMenu.checkAdminUsernamePassword(usernameAdmin, passwordAdmin);

  if(resultOfChecking == false){
    print("Noto'g'ri kiritingiz, qayta urining".tr);
    await Navigator.push(AdminLoginMenu());
    }
   else {
    print('Admin muvofaqiyatli kirdi!'.tr);
    ///Navigate admin actions
    await Navigator.push(AdminMenu());
    }
  }

 static Future<bool> checkAdminUsernamePassword(String usernameAdmin, String passwordAdmin) async{
    String dataAdmin = await NetworkService.getData(NetworkService.baseUrlAdminAuth, NetworkService.apiAdminAuth);
    List<AdminAuth> adminAuth =adminListFromData(dataAdmin);
    for(int i = 0; i<adminAuth.length; i++){
      if(adminAuth[i].username == usernameAdmin && adminAuth[i].password == passwordAdmin){
        return true;
      }
    }
    return false;
 }

  @override
  Future<void> build() async{
    ///Asking username and paaword of admin
    print('Iltimos, admin usernameni kiriting: '.tr);
    String usernameAdmin = stdin.readLineSync()!;
    print('Iltimos, admin passwordini kiriting: '.tr);
    String passwordAdmin = stdin.readLineSync()!;
    adminLogIn(usernameAdmin, passwordAdmin);
  }



}


