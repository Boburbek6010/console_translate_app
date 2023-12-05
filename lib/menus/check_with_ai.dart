
import 'package:console_translate_app/services/extension_service.dart';
import 'package:console_translate_app/services/io_services.dart';
import 'package:translator/translator.dart';

import '../models/new_word_model.dart';
import '../services/network_service.dart';
import '../services/ui_services.dart';
import 'main_menu.dart';

class CheckWAi extends Menu{
  static const id = "/history_menu";

  @override
  Future<void> build() async {
   await displayCheck();
  }

}


Future<void> displayCheck() async{
  List<String> words = [];
  List<String> translates = [];
  List<String> froms = [];
  List<String> tos = [];
  String data = await NetworkService.getData(NetworkService.baseUrlWord,NetworkService.apiNewWord);
  nwFromJson(data).forEach((element) {
    words.add(element.word);
    translates.add(element.translation);
    tos.add(element.desiredLang);
    froms.add(element.currentLang);
  });
  dAddedWords(words: words, tr: translates, from: froms, to: tos);
}

Future<void> dAddedWords (
    { required List<String> words, required List<String> tr, required List<String> from, required List<String> to}) async{
  printBeginning();
  print("\t\t\t${"Check With AI Technology".tr}");
  print(" |                                              |");
  for(int i = 0; i< words.length; i++){
    print("\t\t\t${i+1}. ${words[i]}");
  }
  printVoid();
  print(" |          \t 0. Main Menu 🔙");
  printVoid();
  print(" |______________________________________________|");
  IOService.write("\n\tEnter a number ---> ");
  int n = IOService.read().parsing()!;
  while(n > words.length){
    n = IOService.read().parsing()!;
  }
  n--;
  await checkProcess(word: words[n], trans: tr[n], from: from[n], to: to[n]);

}

Future<void> checkProcess({ required String word, required String trans, required String to, required String from}) async{
  bool match = false;
  Translation gtr = await word.translate(from: to, to: from);
  if(gtr.toString().toLowerCase() == trans.toLowerCase()) match = true;
  displayCheckResult(word: word, translation: trans, gtr: gtr.toString().toLowerCase(), match: match);
}

void displayCheckResult({
  required String word,
  required String translation,
  required String gtr,
  required bool match
  }){
  printBeginning();
  pBold(" \t\t\t\t  << ${word.toUpperCase()} >>\n");
  pRed("    User's version:                     ");
  pRed("           \t\t$translation");
  print(" |----------------------------------------------|");
  pBlue("     AI version:");
  pBlue("           \t\t$gtr");
  print(" |----------------------------------------------|");
  print(" |   Result:                                    |");
  if(match){
    pGreen("\n\t User's version and AI version");
    pGreen(" \t\t\t     MATCHES! \n");
  }else{
    pRed("\n\t User's version and AI version ");
    pRed(" \t\t\t      DOES NOT MATCH!\n");
  }
  print(" |          1. Main Menu 🔙                     |");
  printExit();
}
