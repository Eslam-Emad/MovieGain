import 'package:dio/dio.dart';

class Failure implements Exception {
  late String message;

  @override
  String toString() => message;

  Failure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        message = "Connection timeout with server";
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout in connection with server";
        break;
      case DioErrorType.sendTimeout:
        message = "Send timeout in connection with server";
        break;
      case DioErrorType.other:
        message = "Connection failed due to internet connection";
        break;
      case DioErrorType.response:
        message = handleError(dioError);
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String handleError(DioError dioError) {
    final statusCodeMessages = {
      500: "Server Error",
      401: "Not Authenticated",
      422: "Data is not valid",
      404: "Data Not Found",
      429: "Too many requests",
      403: "Your Request Is Not Allowed",
    };
    String message =
        statusCodeMessages[dioError.response!.statusCode] ?? dioError.message;
    return message;
  }
}
