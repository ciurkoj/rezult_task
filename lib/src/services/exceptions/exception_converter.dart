import 'package:dio/dio.dart';
import 'exceptions.dart';

class RestExceptionConverter {
  static Exception catchDioError(
    DioException exception,
  ) {
    switch (exception.type) {
      case DioException.badResponse:
        return RequestCanceledError();
      case DioException.connectionTimeout:
        return ConnectionTimeoutError();
      case DioException.connectionError:
        return ConnectionError();
      case DioException.receiveTimeout:
        return ReceiveTimeoutError();
      case DioException.requestCancelled:
        return RequestCanceledError();
      case DioException.sendTimeout:
        return SendTimeoutError();
      default:
        return UnexpectedError();
    }
  }
}
