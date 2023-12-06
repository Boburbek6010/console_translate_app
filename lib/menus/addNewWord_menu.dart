
import 'dart:io';

import 'package:console_translate_app/menus/home_menu.dart';
import 'package:console_translate_app/menus/main_menu.dart';
import 'package:console_translate_app/services/extension_service.dart';
import 'package:console_translate_app/services/io_services.dart';
import 'package:console_translate_app/services/ui_services.dart';
import 'package:console_translate_app/services/navigation_service.dart';


import '../models/language_model.dart';
import '../services/network_service.dart';

class AddNewWord extends Menu{

  static const id = "/addNewWord_menu";
  Future<void> selectMenu(String press)async{
    switch(press){
      case "0":{
        exit(0);
      }
      case "1":{
        displayMainMenu();
        await Navigator.push(Choices());
        break;
      }

    }
  }

  @override
  Future<void> build() async{
   addNewWord();
  }

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
Future<void> addNewWord() async{
  List<String> answers = [];
  List<String> actions = [
    "fromLang".tr,
    "toLang".tr,
    "word".tr,
    "translation".tr,
    "description".tr
  ];

  actions.forEach((e) {
    print(e);
    String eh = IOService.read();
    if(eh.isEmpty) eh.preventNull();
    answers.add(eh);
  });
  addNewWordProcess(answers);
}

Future<void> addNewWordProcess(List<String> answers) async {
  Map<String, String> newWord = {
    "currentLang": answers[0],
    "desiredLang": answers[1],
    "word": answers[2],
    "translation": answers[3],
    "description": answers[4],
  };
  print("CurrentLang - ${newWord["currentLang"]}");
  List listOfAvailable  =
  ['auto - Automatic\n'
      'af - Afrikaans\n'
      'sq - Albanian\n'
      'am - Amharic\n'
      'ar - Arabic\n'
      'hy - Armenian\n'
      'az - Azerbaijani\n'
      'eu - Basque\n'
      'be - Belarusian\n'
      'bn - Bengali\n'
      'bs - Bosnian\n'
      'bg - Bulgarian\n'
      'ca - Catalan\n'
      'ceb - Cebuano\n'
      'ny - Chichewa\n'
      'zh-cn - Chinese Simplified\n'
      'zh-tw - Chinese Traditional\n'
      'co - Corsican\n'
      'hr - Croatian\n'
      'cs - Czech\n'
      'da - Danish\n'
      'nl - Dutch\n'
      'en - English\n'
      'eo - Esperanto\n'
      'et - Estonian\n'
      'tl - Filipino\n'
      'fi - Finnish\n'
      'fr - French\n'
      'fy - Frisian\n'
      'gl - Galician\n'
      'ka - Georgian\n'
      'de - German\n'
      'el - Greek\n'
      'gu - Gujarati\n'
      'ht - Haitian Creole\n'
      'ha - Hausa\n'
      'haw - Hawaiian\n'
      'iw - Hebrew\n'
      'hi - Hindi\n'
      'hmn - Hmong\n'
      'hu - Hungarian\n'
      'is - Icelandic\n'
      'ig - Igbo\n'
      'id - Indonesian\n'
      'ga - Irish\n'
      'it - Italian\n'
      'ja - Japanese\n'
      'jw - Javanese\n'
      'kn - Kannada\n'
      'kk - Kazakh\n'
      'km - Khmer\n'
      'ko - Korean\n'
      'ku - Kurdish (Kurmanji)\n'
      'ky - Kyrgyz\n'
      'lo - Lao\n'
      'la - Latin\n'
      'lv - Latvian\n'
      'lt - Lithuanian\n'
      'lb - Luxembourgish\n'
      'mk - Macedonian\n'
      'mg - Malagasy\n'
      'ms - Malay\n'
      'ml - Malayalam\n'
      'mt - Maltese\n'
      'mi - Maori\n'
      'mr - Marathi\n'
      'mn - Mongolian\n'
      'my - Myanmar (Burmese)\n'
      'ne - Nepali\n'
      'no - Norwegian\n'
      'ps - Pashto\n'
      'fa - Persian\n'
      'pl - Polish\n'
      'pt - Portuguese\n'
      'pa - Punjabi\n'
      'ro - Romanian\n'
      'ru - Russian\n'
      'sm - Samoan\n'
      'gd - Scots Gaelic\n'
      'sr - Serbian\n'
      'st - Sesotho\n'
      'sn - Shona\n'
      'sd - Sindhi\n'
      'si - Sinhala\n'
      'sk - Slovak\n'
      'sl - Slovenian\n'
      'so - Somali\n'
      'es - Spanish\n'
      'su - Sundanese\n'
      'sw - Swahili\n'
      'sv - Swedish\n'
      'tg - Tajik\n'
      'ta - Tamil\n'
      'te - Telugu\n'
      'th - Thai\n'
      'tr - Turkish\n'
      'uk - Ukrainian\n'
      'ur - Urdu\n'
      'uz - Uzbek\n'
      'ug - Uyghur\n'
      'vi - Vietnamese\n'
      'cy - Welsh\n'
      'xh - Xhosa\n'
      'yi - Yiddish\n'
      'yo - Yoruba\n'
      'zu - Zulu\n'];

  while(!checkLangContain(newWord["currentLang"]!)){
    IOService.write("${"errorchosedfromlan".tr}\n${"awailableLangs".tr}\n${listOfAvailable}\n${"fromLang".tr}");
    newWord["currentLang"] = IOService.read();
  }

  while(!checkLangContain(newWord["desiredLang"]!)){
    IOService.write("${"errorchosedtolan".tr} \n${"awailableLangs".tr}\n${listOfAvailable}\n${"toLang".tr}");
    newWord["desiredLang"] = IOService.read();
  }

  await NetworkService.postData(
      newWord, NetworkService.baseUrlWord, NetworkService.apiNewWord);
  displayNewWord(word: newWord["word"]!,
      translation: newWord["translation"]!,
      fromLang: newWord["currentLang"]!,
      toLang: newWord["desiredLang"]!,
      description: newWord["description"]!);
  IOService.write("--->");
  String choice = IOService.read();
  await selectMenu(choice);
}
}


bool checkLangContain(String lang){
  if(LanguageList.contains(lang)) return true;
  else return false;
}

