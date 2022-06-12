class EndPointViaCep {
  static String apod(String cep) {
    return 'https://viacep.com.br/ws/$cep/json/';
  }
}
