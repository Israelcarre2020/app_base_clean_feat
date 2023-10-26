import 'package:app_1_clean/core/network/proxy/http_proxy_interface.dart';
import 'package:dio/dio.dart';

import '../interceptors/interceptors.dart';

class ApiClient implements HttpProxyInterface {
  late Dio _http;

  ApiClient() {
    _http = Dio()
      ..interceptors.add(AppInterceptors())
      ..options.baseUrl = 'https://jsonplaceholder.typicode.com'
      ..options.connectTimeout = const Duration(seconds: 30)
      ..options.receiveTimeout = const Duration(seconds: 30);
  }

  @override
  Dio instance() => _http;
}
