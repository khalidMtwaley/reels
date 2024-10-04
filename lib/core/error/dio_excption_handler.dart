import 'package:dio/dio.dart';
import 'package:reels/core/error/exception.dart';

mixin DioExceptionHandlerS {
  Future<T> apifunction<T>(
    Future<T> Function() func, {
    String defaultErrorMessage = '',
  }) async {
    try {
      return await func();
    } catch (exception) {
      String message;

      if (exception is DioException) {
        switch (exception.type) {
          case DioExceptionType.cancel:
            message = 'Request to the server was cancelled.';
            break;
          case DioExceptionType.connectionTimeout:
            message = 'Connection timeout with the server.';
            break;
          case DioExceptionType.sendTimeout:
            message = 'Send timeout in connection with the server.';
            break;
          case DioExceptionType.receiveTimeout:
            message = 'Receive timeout in connection with the server.';
            break;
          case DioExceptionType.badResponse:
            message = exception.response?.data.toString() ??
                'Received an invalid response from the server.';
            break;
          case DioExceptionType.connectionError:
            message = 'No internet connection or server is unreachable.';
            break;
          case DioExceptionType.unknown:
            message = 'An unknown error occurred: ${exception.message}';
            break;
          case DioExceptionType.badCertificate:
            message = 'Invalid SSL certificate.';
            break;
        }
      } else {
        message = exception.toString();
      }

      throw RemoteException(message);
    }
  }
}
