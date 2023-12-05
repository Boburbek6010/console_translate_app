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