import 'dart:io';

import 'main_menu.dart';

class HomeMenu extends Menu {
  String? press;

  void selectMenu(){
    print("Welcome to our app");
    press =stdin.readLineSync() ?? "";
    switch(press){
      case "1":
    }
  }

  @override
  Future<void> build() {
    throw UnimplementedError();
  }


}