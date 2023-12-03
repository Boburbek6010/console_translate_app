
import 'dart:io';

import '../services/ui_services.dart';
import 'main_menu.dart';

class HistoryMenu extends Menu{
  static const id = "/history_menu";

  @override
  Future<void> build() async{
    historyMenuUi();
    print('Tanlang: ');
    int choice = int.parse(stdin.readLineSync()!);
    switch(choice){
      case 0:
        exit(0);
      case 1:
       displayHistoryofWords(["book", "apple", "car", "pencil"]);
      case 2:
        displayHistoryofWords(["book", "apple", "car", "pencil"]);
      default:
        print("Noto'g'ri raqam yozildi qaytadan urining");
        build();
    }
  }


}