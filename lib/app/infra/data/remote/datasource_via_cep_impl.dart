import 'package:desafio_bemol/app/domain/contracts/gateways/http_service.dart';
import 'package:either_dart/either.dart';

import '../../error/app_translation_request_error.dart';
import '../../error/failure_request.dart';
import '../end_points/end_point_via_cep.dart';
import './datasource_via_cep.dart';

class DatasourceViaCepImpl implements DatasourceViaCep {
  final HttpService _httpService;

  DatasourceViaCepImpl(this._httpService);
  @override
  Future<Either<Exception, HttpResponse>> call(String cep) async {
    final response = await _httpService.get(
      EndPointViaCep.apod(cep),
    );

    return _handleResponse(response);
  }
}

Either<FailureRequest, HttpResponse> _handleResponse(HttpResponse response) {
  switch (response.statusCode) {
    case 200:
      return response.data['erro'] != 'true'
          ? Right(response)
          : Left(FailureRequest.badRequest(
              AppTranslationRequestErrors.translation(response.data),
            ));
    case 400:
      return Left(FailureRequest.badRequest(
        AppTranslationRequestErrors.translation(response.data),
      ));
    case 404:
      return Left(FailureRequest.notFound(
        AppTranslationRequestErrors.translation(response.data),
      ));
    case 500:
      return Left(FailureRequest.serverError(
        AppTranslationRequestErrors.translation(
            {'error': 'Ops, algo deu errado, tente novamente mais tarde'}),
      ));
    case 401:
      return Left(FailureRequest.unauthorized(
        AppTranslationRequestErrors.translation(response.data),
      ));
    case 409:
      return Left(FailureRequest.conflict(
        AppTranslationRequestErrors.translation(response.data),
      ));
    case 403:
      return Left(FailureRequest.forbidden(
        AppTranslationRequestErrors.translation(response.data),
      ));
    default:
      return Left(FailureRequest.unknownError(
        AppTranslationRequestErrors.translation(response.data),
      ));
  }
}
