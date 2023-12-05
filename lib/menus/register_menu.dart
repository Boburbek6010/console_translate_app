
import 'dart:io';


import 'package:console_translate_app/menus/user_menu.dart';
import 'package:console_translate_app/models/user_auth.dart';
import 'package:console_translate_app/services/extension_service.dart';
import 'package:console_translate_app/services/navigation_service.dart';
import 'package:console_translate_app/services/network_service.dart';
import 'main_menu.dart';



class RegisterMenu extends Menu {
  static const id = "/register_menu";
  String usernamePost = "";
  String passwordPost = "";
  String phoneNumPost = "";
  bool isNameCorrect = false;

  Future<void> checkData( ) async {

    await enterUsername();
    if(isNameCorrect) {
      await enterAndCheckPhoneNum();
      await enterPassword();
    }


    UserAuth userdata = UserAuth(id, password: passwordPost,
        phoneNum: phoneNumPost,
        username: usernamePost);
    String response = await NetworkService.postData(
        userdata.toJson(), NetworkService.baseUrlUserAuth,
        NetworkService.apiUserAuth);
    print(response);

    Navigator.push(UserMenu());
  }

  @override
  Future<void> build() async {
    await checkData();
  }

  Future<void> enterPassword() async {
    int counter = 0;
    print("askPassword".tr);
    String password = stdin.readLineSync() ?? "";
    RegExp hasUpperCase = RegExp(r'[A-Z]');
    RegExp hasLowerCase = RegExp(r'[a-z]');
    RegExp hasDigit = RegExp(r'\d');
    for (int i = 0; i < password.length; i++) {
      if (password[i] == " ") {
        counter++;
      }}
    if (password.length >= 8 && password.contains(hasUpperCase) &&
        password.contains(hasLowerCase) && password.contains(hasDigit)) {
      print("Password qabul qilindi");
      passwordPost = password;
    }else if (counter != 0) {
      print("Password can not contain white space");
      enterPassword();
    } else {
      print("Password qabul qilinmadi!");
      print("Password katta harf, son, kichik harfdan iborat bo'lishi va umumiy 8ta belgidan iborat bo'lishi kerak");
      enterPassword();
    }
  }
  Future<void> enterUsername() async {
    int counter = 0;
    int counter1 = 0;
    print("askUsername".tr);
    String username = stdin.readLineSync()!;
    for (int j = 0;j < username.length; j++) {
      int? a = int.tryParse(username[0]);
      if (username[j] == " "){
        counter++;
      }else if(a != null){
        print("First character of username cannot be a digit!");
        await enterUsername();
      }
    }
    if (username.length < 3 || username.length > 16) {
      print("Username 3ta belgidan kam va 16ta belgidan ko'p bo'lishi mumkin emas");
      await enterUsername();
    }else if (counter != 0) {
      print("Username can not contain white space");
      await enterUsername();
    }else{
      String data = await NetworkService.getData(NetworkService.baseUrlUserAuth, NetworkService.apiUserAuth);
      List<UserAuth> userAuth = userListFromData(data);
      for (int i = 0; i < userAuth.length; i++) {
        if (userAuth[i].username == username) {
          counter1++;
        }
      }
      if(counter1 == 0){
        print("Username qabul qilindi");
        usernamePost = username.toLowerCase();
        isNameCorrect = true;
      }else if(counter1 != 0){
        print("Bu usernamedan allaqoachon foydalanilgan!");
        await enterUsername();
      }else{
        await enterUsername();
      }
    }

  }


  Future<void> enterAndCheckPhoneNum() async {
    print("askPhoneNumber".tr);
    stdout.write('+998');
    String phoneNum = stdin.readLineSync() ?? "";
    if (phoneNum.length == 9) {
      int? phoneNumberInt = int.tryParse(phoneNum);
      if (phoneNumberInt == null) {
        print("Faqat raqam kiriting");
        enterAndCheckPhoneNum();
      } else {
        print("Qabul qilindi");
        phoneNumPost = phoneNum;
      }
    } else {
      print("Faqat 9ta raqam kiriting!");
      enterAndCheckPhoneNum();
    }
  }


}
