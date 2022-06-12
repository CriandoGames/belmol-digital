import 'package:desafio_bemol/app/domain/error/failure.dart';

class FailureCep implements Failure {
  final String _message;

  const FailureCep({required String message}) : _message = message;

  factory FailureCep.invalidAddress() {
    return const FailureCep(message: 'cep inválido');
  }

  factory FailureCep.emptyAddress() {
    return const FailureCep(
      message: 'cep não pode ser vazio.',
    );
  }

  get message => _message;
}
