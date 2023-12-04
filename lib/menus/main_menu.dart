import 'dart:io';
import 'package:console_translate_app/services/network_service.dart';
import 'package:console_translate_app/services/ui_services.dart';
import '../models/history_of_words.dart';
import 'package:translator/translator.dart';

abstract class Menu {
  Future<void> build();
}

///asks to enter a word in order to translate
void translateWord() {
  List<String> answers = [];
  List<String> actions = [
    "Enter the current Language: ",
    "Enter the desired Language: ",
    "Enter a word: "
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

  }

void addNewWord() {
  List<String> answers = [];
  List<String> actions = [
    "Enter the current Language: ",
    "Enter the desired Language: ",
    "Enter a word: ",
    "Enter translation of this word:",
    "Enter its description"
  ];

  actions.forEach((e) {
    print(e);
    String eh = stdin.readLineSync() ?? "";
    if(checkEmpty(eh)) preventNull(eh, e);
    answers.add(eh);
  });
  addNewWordProcess(answers);
}

Future<void> addNewWordProcess(List<String> answers) async{
  Map<String, String> newWord = {
    "currentLang" : answers[0],
    "desiredLang" : answers[1],
    "word" : answers[2],
    "translation" : answers[3],
    "description" : answers[4],
  };
  await NetworkService.postData(newWord, NetworkService.baseUrlWord, NetworkService.apiNewWord);
  displayNewWord(word: newWord["word"]!, translation: newWord["translation"]!, fromLang: newWord["currentLang"]!, toLang: newWord["desiredLang"]!, description: newWord["description"]!);
}

///displays the History of searched words by going api and getting data
Future<void> displayHistory() async {
  List<String> searchedCWord = [];
  List<String> searchedWord = [];
  String data = await NetworkService.getData(NetworkService.baseUrlWord,NetworkService.apiWord);
  swFromJson(data).forEach((element) {
    searchedCWord.add(element.searchedWord);
  });

  if(searchedCWord.length > 8){
    for(int i = 0; i <= 8; i++){
      searchedWord.add(searchedCWord[i]);
    }
    displayHistoryofWords(searchedWord);
  }else{
    displayHistoryofWords(searchedCWord);
  }
}

///if the string is empty returns false
bool checkEmpty(String word){
  if(word == "") return true;
  else return false;
}

///prevents empty input bu asking a question again and again
void preventNull(String? string, String action){
  while(string==""){
    print("$action");
    string = stdin.readLineSync();
  }
}

bool checkLangContain(String lang){
  return true;
}