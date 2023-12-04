
import 'dart:io';

import 'package:console_translate_app/services/extension_service.dart';

import '../services/ui_services.dart';
import 'main_menu.dart';

class HistoryMenu extends Menu{
  static const id = "/history_menu";

  @override
  Future<void> build() async{
    historyMenuUi();
    print('Tanlang: '.tr);
    int choice = int.parse(stdin.readLineSync()!);
    switch(choice){
      case 0:
        exit(0);
      case 1:
       displayHistoryofWords(["book", "apple", "car", "pencil"]);
      case 2:
        displayHistoryofWords(["book", "apple", "car", "pencil"]);
      default:
        print("Noto'g'ri kiritingiz, qayta urining".tr);
        build();
    }
  }


}