class AddressModel {
  final String street;
  final String cep;
  final String city;
  final String neighborhood;

  const AddressModel({
    required this.street,
    required this.cep,
    required this.city,
    required this.neighborhood,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      street: json['logradouro'] as String,
      cep: json['cep'],
      city: json['localidade'] as String,
      neighborhood: json['bairro'] as String,
    );
  }
}
