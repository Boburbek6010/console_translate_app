enum
Language { en, uz, ru }

class LanguageService {
  static Language _language = Language.en;

  static Language get currentLanguage => _language;

  static set switchLanguage(String lang) {
    switch (lang) {
      case "1":
        _language = Language.uz;
        break;
      case "2":
        _language = Language.ru;
        break;
      case "3":
        _language = Language.en;
        break;
    }
  }

  static set setLanguage(Language language) {
    _language = language;
  }

  static void switchLanguageByName(String lang) {
    switch (lang) {
      case "I":
        _language = Language.uz;
        break;
      case "II":
        _language = Language.ru;
        break;
      case "III":
        _language = Language.en;
        break;
    }
  }
}
