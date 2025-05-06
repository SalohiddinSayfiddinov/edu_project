import 'package:dio/dio.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();
  factory ApiClient() => _instance;

  late Dio dio;

  ApiClient._internal() {
    dio = Dio(BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: Duration(seconds: 30),
      receiveTimeout: Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
       
      },
    ));

    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
      request: true,
      responseHeader: false,
      requestHeader: true,
    ));
  }

  String get _baseUrl => 'https://2ef0-90-156-198-203.ngrok-free.app/api/v1/';
}
