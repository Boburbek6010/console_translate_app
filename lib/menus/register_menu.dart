
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
      print("acceptedPassword".tr);
      passwordPost = password;
    }else if (counter > 0) {
      print("passwordNotContainSpace".tr);
      enterPassword();
    } else {
      print("notAcceptedPassword".tr);
      print("passwordCUcLc8ch".tr);
      enterPassword();
    }
  }
  Future<void> enterUsername() async {
    int counter = 0;
    int counter1 = 0;
    print("askUsername".tr);
    String username = stdin.readLineSync()!;
    String data = await NetworkService.getData(NetworkService.baseUrlUserAuth, NetworkService.apiUserAuth);
    List<UserAuth> userAuth = userListFromData(data);
    for (int i = 0; i < userAuth.length; i++) {
      if (userAuth[i].username == username) {
          counter1++;
      }
    }
    for (int i = 0; i < username.length; i++) {
      if (username[i] == " "){
        counter++;
      }
    }
    if (username.length < 3 || username.length > 16) {
      print("username3ch16chNot".tr);
      enterUsername();
    }else if (counter != 0) {
      print("usernameNotContainSpace".tr);
      enterUsername();
    }else if(counter1 != 0){
      print("alreadyHave".tr);
      enterUsername();
    }
    else{
      print("acceptedUsername".tr);
      usernamePost = username;
    }

  }


  Future<void> enterAndCheckPhoneNum() async {
    print("askPhoneNumber".tr);
    stdout.write('+998');
    String phoneNum = stdin.readLineSync() ?? "";
    if (phoneNum.length == 9) {
      int? phoneNumberInt = int.tryParse(phoneNum);
      if (phoneNumberInt == null) {
        print("enterOnlyNum".tr);
        enterAndCheckPhoneNum();
      } else {
        print("acceptedPN".tr);
        phoneNumPost = phoneNum;
      }
    } else {
      print("only9digit".tr);
      enterAndCheckPhoneNum();
    }
  }

  Future<void> checkData( ) async {
    await enterUsername();
    await enterAndCheckPhoneNum();
    await enterPassword();

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
}
