enum Language{en,uz,ru}

class LanguageService{
  static Language _language = Language.en;

  static Language get getLanguage => _language;

  static set switchLanguage(String lang){
    switch(lang){
      case "1": {Language.uz;} break;
      case "2": {Language.ru;} break;
      case "3": {Language.en;} break;
    }
  }
}