import 'package:either_dart/either.dart';

import '../../entities/address_entity.dart';

abstract class SearchCepRepository {
  Future<Either<Exception, AddressEntity>> call(String cep);
}
