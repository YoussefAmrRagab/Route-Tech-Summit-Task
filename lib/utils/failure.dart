import 'package:dio/dio.dart';

class Failure {
  final String message;
  final int? code;

  Failure({required this.message, this.code});

  factory Failure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        return Failure(message: "Request to the server was cancelled");
      case DioExceptionType.connectionTimeout:
        return Failure(message: "Connection timeout with the server");
      case DioExceptionType.receiveTimeout:
        return Failure(
          message: "Receive timeout in connection with the server",
        );
      case DioExceptionType.sendTimeout:
        return Failure(message: "Send timeout in connection with the server");
      case DioExceptionType.badResponse:
        return Failure.fromResponse(dioError.response!);
      case DioExceptionType.unknown:
        if (dioError.message!.contains("SocketException")) {
          return Failure(message: "No Internet connection");
        }
        return Failure(message: "Unexpected error occurred");
      default:
        return Failure(message: "Something went wrong");
    }
  }

  factory Failure.fromResponse(Response response) {
    String message = "Something went wrong";
    int code = response.statusCode ?? 0;

    if (response.data != null && response.data is Map<String, dynamic>) {
      if (response.data['message'] != null) {
        message = response.data['message'];
      } else if (response.data['error'] != null) {
        message = response.data['error'];
      }
    }

    return Failure(message: message, code: code);
  }

  @override
  String toString() => 'Failure(message: $message, code: $code)';
}
