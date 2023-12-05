import 'package:console_translate_app/services/language_service.dart';
import '../data/locale/enEn.dart';
import '../data/locale/ruRU.dart';
import '../data/locale/uzUZ.dart';

extension LanguageExtension on String{
  String get tr{
    switch(LanguageService.getLanguage){
      case Language.uz: return uz[this] ?? this;
      case Language.ru: return ru[this] ?? this;
      case Language.en: return en[this] ?? this;
    }
  }
}

extension TextFormat on String{

  String textBold(){
    return "\x1B[1m$this\x1B[0m";
  }
  String textItalic(){
    return "\x1B[3m$this\x1B[0m";
  }
  String textUnderline(){
    return "\x1B[4m$this\x1B[0m";
  }
  String textInvertColor(){
    return "\x1B[7m$this\x1B[0m";
  }
  String textCrossedOut(){
    return "\x1B[9m$this\x1B[0m";
  }
  String textUnderlineBold(){
    return "\x1B[21m$this\x1B[0m";
  }
  String textFrame(){
    return "\x1B[51m$this\x1B[0m";
  }

}