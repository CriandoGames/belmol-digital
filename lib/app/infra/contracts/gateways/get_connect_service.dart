import 'package:get/get_connect/connect.dart';

import '../../../domain/contracts/gateways/http_service.dart';

class GetConnectService implements HttpService {
  final _client = GetConnect();

  @override
  Future<GetConnectService> getInstance() async {
    return this;
  }

  @override
  Future<HttpResponse> delete(String url,
      {required Map<String, dynamic> body,
      Map<String, String>? headers}) async {
    final response = await _client.delete(
      url,
      headers: headers,
    );
    return HttpResponse(data: response.body, statusCode: response.statusCode);
  }

  @override
  Future<HttpResponse> get(String url, {Map<String, String>? headers}) async {
    final response = await _client.get(url, headers: headers);
    return HttpResponse(data: response.body, statusCode: response.statusCode);
  }

  @override
  Future<HttpResponse> patch(String url,
      {required body, Map<String, String>? headers}) async {
    final response = await _client.patch(url, body, headers: headers);
    return HttpResponse(data: response.body, statusCode: response.statusCode);
  }

  @override
  Future<HttpResponse> post(String url,
      {required Map<String, dynamic> body,
      Map<String, String>? headers}) async {
    final response = await _client.post(url, body, headers: headers);
    return HttpResponse(data: response.body, statusCode: response.statusCode);
  }

  @override
  Future<HttpResponse> put(String url,
      {required dynamic body, Map<String, String>? headers}) async {
    final response = await _client.put(url, body, headers: headers);
    return HttpResponse(data: response.body, statusCode: response.statusCode);
  }
}
