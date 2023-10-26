import 'package:dio/dio.dart';

Future<DioException> customError(DioException dioException) async {
  if (dioException.type == DioExceptionType.connectionTimeout) {
    return _customErrorReport(dioException, "Connection timeout, try later");
  }

  if (dioException.type == DioExceptionType.connectionError) {
    return _customErrorReport(dioException, "Without internet connection");
  }

  switch (dioException.response?.statusCode) {
    case 400:
      return _customErrorReport(dioException, "Bad request");
    case 401:
      return _customErrorReport(dioException, "Unauthorized");
    case 403:
      return _customErrorReport(dioException, "Forbidden");
    case 404:
      return _customErrorReport(dioException, "Not found");
    case 500:
      return _customErrorReport(dioException, "Internal server error");
    case 503:
      return _customErrorReport(dioException, "Service unavailable");
    default:
      return _customErrorReport(dioException, "Unexpected error");
  }
}

Future<DioException> _customErrorReport(
    DioException dioException, String errorMessage) async {
  return DioException(
      error: errorMessage,
      requestOptions: dioException.requestOptions,
      response: dioException.response,
      type: dioException.type);
}
