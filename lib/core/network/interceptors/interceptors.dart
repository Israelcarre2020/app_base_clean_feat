import 'dart:developer';

import 'package:app_1_clean/core/network/network_util/error_handler.dart';
import 'package:dio/dio.dart';

class AppInterceptors extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    handler.next(await customError(err));
  }

  @override
  Future<dynamic> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    log(response.toString(), name: 'Response: ${response.requestOptions.path}');

    handler.next(response);
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    log(options.data.toString(), name: 'Request Body: ${options.path}');
    super.onRequest(options, handler);
  }
}
