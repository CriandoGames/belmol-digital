class AppTranslationRequestErrors {
  AppTranslationRequestErrors._instance();

  static final AppTranslationRequestErrors _singleton =
      AppTranslationRequestErrors._instance();

  factory AppTranslationRequestErrors() => _singleton;

  static String translation(dynamic map) {
    if (map is String) {
      return map;
    }

    if (map == null) {
      return 'error desconhecido';
    }

    String message = map['erro'];

    switch (message) {
      case 'true':
        return 'error desconhecido ou cep não encontrado';
      default:
        return 'error desconhecido';
    }
  }
}
