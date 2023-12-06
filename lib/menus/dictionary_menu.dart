import 'dart:io';

import 'package:console_translate_app/menus/check_with_ai.dart';
import 'package:console_translate_app/menus/home_menu.dart';
import 'package:console_translate_app/services/extension_service.dart';
import 'package:console_translate_app/services/ui_services.dart';
import 'package:translator/translator.dart';
import 'package:console_translate_app/services/navigation_service.dart';


import '../models/language_model.dart';
import '../services/io_services.dart';
import '../services/network_service.dart';
import 'main_menu.dart';

class DictionaryMenu extends Menu{
  static const id = "/dictionary_menu";
  Future<void> selectMenu(String press) async {
    switch(press){
      case "1":{
        await translateWord();
      }
      break;
      case "2":{
        await Navigator.push(CheckWAi());
      }
      case "3":{
        await Navigator.push(Choices());
      }
      default: build();
    }
  }
  @override
  Future<void> build() async {
    IOService.write("Tanlang:\n1.Global translate.\n2.Check with AI.\n3.Go back\n");
    String press = IOService.read();
    await selectMenu(press);
    // await translateWord();

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
    if(checkEmpty(eh)) preventNull(eh, e);
    answers.add(eh);
  });
  translateWordProcess(answers);
}
///gets the answers of user and posts the searched word to api
Future<void> translateWordProcess(List<String> answers) async {
  String fromLang = answers[0];
  String toLang = answers[1];
  String word = answers[2];
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

  while(!checkLangContain(fromLang)){
    IOService.write("${"errorchosedfromlan".tr}\n${"awailableLangs".tr}\n${listOfAvailable}\n${"fromLang".tr}");
    fromLang = IOService.read();
  }

  while(!checkLangContain(toLang)){

    IOService.write("${"errorchosedtolan".tr} \n${"awailableLangs".tr}\n${listOfAvailable}\n${"toLang".tr}");
    toLang = IOService.read();
  }

  translate(word: word, fromLang: fromLang, toLang: toLang);
  Map<String, String> searchedWord = {"searchedWord": word};
  await NetworkService.postData(searchedWord, NetworkService.baseUrlWord, NetworkService.apiWord);
}
///translates the word using translator service
Future<void> translate ({
  required String word,
  required String fromLang,
  required String toLang}) async{
  Translation translation = await word.translate(from: fromLang, to: toLang);

  displayTranslation(
      word: word,
      translation: translation.toString(),
      fromLang: fromLang,
      toLang: toLang
  );
  String press = IOService.read();
  selectMenu1(press);

}
Future<void> selectMenu1(String press)async{
  switch(press){
    case "0":{
      exit(0);
    }
    case "1":
      {
        displayMainMenu();
        await Navigator.push(Choices());
        break;
      }
    default:
      IOService.write("tryAgain".tr);
      await displayHistory();
  }
}


bool checkLangContain(String lang){
  if(LanguageList.contains(lang)) return true;
  else return false;
}
