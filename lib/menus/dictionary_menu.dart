
import 'dart:io';

import 'package:console_translate_app/services/ui_services.dart';

import 'main_menu.dart';

class DictionaryMenu extends Menu{
  static const id = "/dictionary_menu";

  @override
  Future<void> build() async {
    print('Input fromLang: ');
    String fromLang = stdin.readLineSync()!;
    print('Input toLang: ');
    String toLang = stdin.readLineSync()!;
    print('Input word: ');
    String word = stdin.readLineSync()!;
    print('Input translation: ');
    String translation = stdin.readLineSync()!;
    displayTranslation(word: word, translation: translation, fromLang: fromLang, toLang: toLang);
  }


}