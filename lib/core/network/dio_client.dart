import 'package:dio/dio.dart';
import 'package:movie_stream_app/core/network/api_endpoint.dart';
import 'package:movie_stream_app/core/network/dio_interceptor.dart';

class DioClient {
  late final Dio dio;
  DioClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoint.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    dio.interceptors.add(DioInterceptor());
  }
}
