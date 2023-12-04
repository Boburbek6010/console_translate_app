
import 'dart:io';

import 'package:console_translate_app/services/extension_service.dart';
import 'package:console_translate_app/services/ui_services.dart';

import 'main_menu.dart';

class DictionaryMenu extends Menu{
  static const id = "/dictionary_menu";

  @override
  Future<void> build() async {
    print('fromLang:'.tr);
    String fromLang = stdin.readLineSync()!;
    print('toLang:'.tr);
    String toLang = stdin.readLineSync()!;
    print('word: '.tr);
    String word = stdin.readLineSync()!;
    print('translation: '.tr);
    String translation = stdin.readLineSync()!;
    displayTranslation(word: word, translation: translation, fromLang: fromLang, toLang: toLang);
  }


}