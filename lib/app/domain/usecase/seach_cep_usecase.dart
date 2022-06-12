import 'package:desafio_bemol/app/domain/entities/address_entity.dart';
import 'package:desafio_bemol/app/domain/error/failure_cep.dart';
import 'package:either_dart/either.dart';

import '../contracts/repositories/search_cep_repository.dart';

class SeachCepUsecase {
  final SearchCepRepository _repository;

  SeachCepUsecase({required SearchCepRepository repository})
      : _repository = repository;

  Future<Either<Exception, AddressEntity>> call(String cep) async {
    if (cep.isEmpty) {
      return Left(FailureCep.emptyAddress());
    }

    if (cep.length != 8) {
      return Left(FailureCep.invalidAddress());
    }

    final result = await _repository.call(cep);

    return result;
  }
}
