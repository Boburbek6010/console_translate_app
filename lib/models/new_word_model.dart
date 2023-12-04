import 'dart:convert';
class NewWord{
  late String word;
  late String currentLang;
  late String desiredLang;
  late String translation;
  late String description;

  NewWord.fromJson(Map<String, dynamic> json){
    word = json["word"];
    currentLang = json["currentLang"];
    desiredLang = json["desiredLang"];
    translation = json["translation"];
    description = json["description"];
  }

  Map<String, dynamic> toJson()=>{
    "word":word,
    "currentLang":currentLang,
    "desiredLang":desiredLang,
    "translation":translation,
    "description":description,
  };
}
List<NewWord> nwFromJson(String data) => List<NewWord>.from(jsonDecode(data).map((e)=>NewWord.fromJson(e)));
String nwToJson(NewWord newWord) => jsonEncode(newWord.toJson());