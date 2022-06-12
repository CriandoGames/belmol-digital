import 'package:desafio_bemol/app/infra/model/address_model.dart';

class AddressEntity {
  final String street;
  final String cep;
  final String city;
  final String neighborhood;

  const AddressEntity({
    required this.street,
    required this.cep,
    required this.city,
    required this.neighborhood,
  });

  factory AddressEntity.fromDomain(AddressModel model) {
    return AddressEntity(
      street: model.street,
      cep: model.cep,
      city: model.city,
      neighborhood: model.neighborhood,
    );
  }

  @override
  String toString() {
    return 'AddressEntity{street: $street, cep: $cep, city: $city, neighborhood: $neighborhood}';
  }

}
