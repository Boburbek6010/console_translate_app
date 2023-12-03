import 'dart:convert';

class NewWord{
  late String word;
  late String fromLang;
  late String toLang;
  late String translation;
  late String description;

  NewWord.fromJson(Map<String, dynamic> json){
    word = json["word"];
    fromLang = json["fromLang"];
    toLang = json["toLang"];
    translation = json["translation"];
    description = json["description"];
  }

  Map<String, dynamic> toJson()=>{
    "word":word,
    "fromLang":fromLang,
    "toLang":toLang,
    "translation":translation,
    "description":description,
  };
}


List<NewWord> swFromJson(String data) => List<NewWord>.from(jsonDecode(data).map((e)=>NewWord.fromJson(e)));

String swToJson(NewWord newWord) => jsonEncode(newWord.toJson());