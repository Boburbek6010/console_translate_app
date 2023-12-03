
import 'dart:io';

import 'package:console_translate_app/menus/user_menu.dart';
import 'package:console_translate_app/services/extension_service.dart';
import 'package:console_translate_app/services/navigation_service.dart';
import 'main_menu.dart';

class RegisterMenu extends Menu{
  static const id = "/register_menu";

  Future<void> checkData() async {
    enterUsername();
    enterAndCheckPhoneNum();
    enterPassword();
    print("successful".tr);
    Navigator.push(UserMenu());

  }

  @override
  Future<void> build()async{

    await checkData();
  }

  Future<void> enterPassword()async {
    print("askPassword".tr);
    String password = stdin.readLineSync() ?? "";
    RegExp hasUpperCase = RegExp(r'[A-Z]');
    RegExp hasLowerCase = RegExp(r'[a-z]');
    RegExp hasDigit = RegExp(r'\d');
    if(password.length>=8 &&  password.contains(hasUpperCase)&& password.contains(hasLowerCase) && password.contains(hasDigit)){
      print("Password qabul qilindi");
    }else{
      print("Password qabul qilinmadi! Password katta harf, son, kichik harfdan iborat bo'lishi va umumiy 8ta belgidan iborat bo'lishi kerak");
      enterPassword();
    }

  }


  Future<void> enterUsername()async{
    print("askUsername".tr);
    String username  = stdin.readLineSync() ?? "";
    print(username.toLowerCase());
    if(username.length <6){
      print("Username 6ta belgidan kam bo'lishi mumkin emas");
      enterUsername();
    }else{
      print("Username qabul qilindi");
    }
  }

  Future<void> enterAndCheckPhoneNum()async{
    print("askPhoneNumber".tr);
    stdout.write('+998');
    String phoneNum = stdin.readLineSync() ?? "";
    if(phoneNum.length == 9){
      int? phoneNumberInt = int.tryParse(phoneNum);
      if(phoneNumberInt == null){
        print("Faqat raqam kiriting");
        enterAndCheckPhoneNum();
      }else{
        print("Qabul qilindi");
      }
    }else{
      print("Faqat 7ta raqam kiriting!");
      enterAndCheckPhoneNum();
    }

  }


  Future<void> checkPhoneNum(String phoneNumber)async{

  }


}