import 'dart:io';

import 'package:console_translate_app/services/network_service.dart';

import '../services/language_service.dart';
import 'main_menu.dart';


class LogInMenu extends Menu {
  static const id = "/login_menu";

  Future<void> logIn(password, username) async {
    int counter =0;
    Map<String, dynamic> checkMap = await NetworkService.getData(NetworkService.baseUrlUserAuth, NetworkService.apiUserAuth) as Map<String, dynamic>;
    List? usernameValues;
    checkMap.forEach((key, value) {
      usernameValues?.add(value);
    });
    if(usernameValues!.contains(username)){
      ///starting to check password
      counter++;
      List<String>? passwordValues;
      Map<String, String> checkMap2 = await NetworkService.getData(NetworkService.baseUrlUserAuth, NetworkService.apiUserAuth) as Map<String, String>;
      checkMap2.forEach((key, value) {
        passwordValues?.add(value);
      });
      if(passwordValues!.contains(password)){

      }
    }
    if(counter == 0){
      print("Siz ro'yxatdan o'tmagansiz!");
      logIn(password, username);
    }
    else{
      print("Iltimos qaytadan urinib koring");
    }

    /*
    switch (press) {
      case "I":
        {
          LanguageService.setLanguage = Language.uz;
        }
        break;
      case "II":
        {
          LanguageService.setLanguage = Language.ru;
        }
        break;
      case "III":
        {
          LanguageService.setLanguage = Language.en;
        }
      default:
        build();
    }
    */
  }

  @override
  Future<void> build()async {
    print('Iltimos, foydalanuvchi nomini kiriting: ');
    String username = stdin.readLineSync()!;
    print('Iltimos password kiriting');
    String password = stdin.readLineSync()!;
    await logIn(password, username);




  }


}
