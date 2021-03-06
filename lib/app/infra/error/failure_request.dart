class FailureRequest implements Exception {
  final String _message;

  const FailureRequest({required String message}) : _message = message;

  factory FailureRequest.badRequest([String value = '']) {
    return FailureRequest(message: value);
  }

  factory FailureRequest.unauthorized([String value = '']) {
    return FailureRequest(message: value);
  }

  factory FailureRequest.forbidden([String value = '']) {
    return FailureRequest(message: value);
  }

  factory FailureRequest.notFound([String value = '']) {
    return FailureRequest(message: value);
  }

  factory FailureRequest.serverError([String value = '']) {
    return FailureRequest(message: value);
  }

  factory FailureRequest.conflict([String value = '']) {
    return FailureRequest(message: value);
  }

  factory FailureRequest.loginSocialFailure([String value = '']) {
    return FailureRequest(message: value);
  }

  factory FailureRequest.unknownError([String? value]) {
    return const FailureRequest(message: 'unknownError');
  }

  @override
  String toString() {
    return _message;
  }
}
