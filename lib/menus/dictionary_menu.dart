import 'dart:io';

import 'package:console_translate_app/menus/check_with_ai.dart';
import 'package:console_translate_app/menus/home_menu.dart';
import 'package:console_translate_app/menus/setting_menu.dart';
import 'package:console_translate_app/services/extension_service.dart';
import 'package:console_translate_app/services/ui_services.dart';
import 'package:translator/translator.dart';
import 'package:console_translate_app/services/navigation_service.dart';
import 'package:console_translate_app/services/io_services.dart';


import '../services/io_services.dart';
import '../services/network_service.dart';
import 'main_menu.dart';

class DictionaryMenu extends Menu {
  static const id = "/dictionary_menu";

  Future<void> selectMenu(String press) async {
    switch (press) {
      case "1":
        {
          await translateWord();
        }
        break;
      case "2":
        {
          await Navigator.push(CheckWAi());
        }
      case "3":
        {
          displayMainMenu();
          await Navigator.push(Choices());
        }
      default:
        build();
    }
  }

  @override
  Future<void> build() async {
    displayMenu(["globTranslate".tr, "checkWAI".tr], "dictionaryMenu".tr);
    IOService.write("chooseFT".tr);
    String press = IOService.read();
    await selectMenu(press);
    await translateWord();
  }

  Future<void> selectMenu1(press) async {
    switch (press) {
      case "0":
        exit(0);
      case "1":
        displayMainMenu();
        await Navigator.push(Choices());
        break;
      default:
        IOService.write("tryAgain".tr);
        build();
    }
  }


  ///asks to enter a word in order to translate
  Future<void> translateWord() async {
    List<String> answers = [];
    List<String> actions = [
      "fromLang".tr,
      "toLang".tr,
      "word".tr
    ];
    actions.forEach((e) {
      print(e);
      String eh = stdin.readLineSync() ?? "";
      if (checkEmpty(eh)) preventNull(eh, e);
      answers.add(eh);
    });
    translateWordProcess(answers);
  }

  ///gets the answers of user and posts the searched word to api
  Future<void> translateWordProcess(List<String> answers) async {
    String fromLang = answers[0];
    String toLang = answers[1];
    String word = answers[2];
    translate(word: word, fromLang: fromLang, toLang: toLang);
    Map<String, String> searchedWord = {"searchedWord": word};
    await NetworkService.postData(
        searchedWord, NetworkService.baseUrlWord, NetworkService.apiWord);
  }

  ///translates the word using translator service
  Future<void> translate({
    required String word,
    required String fromLang,
    required String toLang}) async {
    Translation translation = await word.translate(from: fromLang, to: toLang);
    displayTranslation(
        word: word,
        translation: translation.toString(),
        fromLang: fromLang,
        toLang: toLang
    );
    String choice = IOService.read();
    await selectMenu1(choice);
  }

}