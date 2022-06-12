import 'package:desafio_bemol/app/infra/data/remote/datasource_via_cep.dart';
import 'package:desafio_bemol/app/infra/model/address_model.dart';

import 'package:desafio_bemol/app/domain/entities/address_entity.dart';
import 'package:either_dart/either.dart';

import '../../../domain/contracts/repositories/search_cep_repository.dart';

class SearchCepRepositoryImpl implements SearchCepRepository {
  final DatasourceViaCep _datasourceViaCep;

  SearchCepRepositoryImpl(this._datasourceViaCep);
  @override
  Future<Either<Exception, AddressEntity>> call(String cep) async {
    final response = await _datasourceViaCep.call(cep);

    if (response.isRight) {
      return Right(
          AddressEntity.fromDomain(AddressModel.fromJson(response.right.data)));
    } else {
      return Left(response.left);
    }
  }
}
