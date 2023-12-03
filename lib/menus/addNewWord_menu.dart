
import 'dart:io';

import 'package:console_translate_app/menus/main_menu.dart';
import 'package:console_translate_app/services/ui_services.dart';

class AddNewWord extends Menu{

  static const id = "/addNewWord_menu";
  void displayNewW({
    required String word,
    required String translation,
    required String fromLang,
    required String toLang,
    required String description
  }){
    displayNewWord(
        word: word,
        translation: translation,
        fromLang: fromLang,
        toLang: toLang,
        description: description);
  }
  @override
  Future<void> build() async{
    print('Input fromLang: ');
    String fromLang = stdin.readLineSync()!;
    print('Input toLang: ');
    String toLang = stdin.readLineSync()!;
    print('Input word: ');
    String newWord = stdin.readLineSync()!;
    print('Input translation: ');
    String translation = stdin.readLineSync()!;
    print('Input description: ');
    String description = stdin.readLineSync()!;
    displayNewW(word: newWord, translation: translation, fromLang: fromLang, toLang: toLang, description: description);
  }

}
