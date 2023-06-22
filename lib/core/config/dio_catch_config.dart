import 'package:dio/dio.dart';

class DioCatchError {
  static String catchError(DioError e) {
    switch (e.type) {
      case DioErrorType.connectionTimeout:
        return "Connection Time out";
      case DioErrorType.sendTimeout:
        return "Send Time out";
      case DioErrorType.receiveTimeout:
        return "Recieve Time out";
      case DioErrorType.unknown:
        return "No Internet Connction";
      default:
        return "Some thing went wrong";
    }
  }
}