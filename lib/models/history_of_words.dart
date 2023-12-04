import 'dart:convert';

class SearchedWord{
  late String id;
  late String searchedWord;
  SearchedWord.fromJson(Map<String, dynamic> json){
    id = json["id"];
    searchedWord = json["searchedWord"];
  }
  Map<String,dynamic> toJson()=>{
    "id":id,
    "searchedWord":searchedWord
  };
}

List<SearchedWord> swFromJson(String data) => List<SearchedWord>.from(jsonDecode(data).map((e)=>SearchedWord.fromJson(e)));

String swToJson(SearchedWord searchedWord) => jsonEncode(searchedWord.toJson());