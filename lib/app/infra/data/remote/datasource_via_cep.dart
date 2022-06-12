import 'package:either_dart/either.dart';

import '../../../domain/contracts/gateways/http_service.dart';

abstract class DatasourceViaCep {
  Future<Either<Exception, HttpResponse>> call(String cep);
}
