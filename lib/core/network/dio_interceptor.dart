import 'package:dio/dio.dart';

class DioInterceptor extends Interceptor {
  DioInterceptor();

  static const _token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzNmMyMTg5MTMxMjJiN2FmYTVmZjA3Nzk4M2U3YTQxMiIsIm5iZiI6MTc4MTk4Mzk4Ni45MTEsInN1YiI6IjZhMzZlYWYyYzFlNzg3MGI5Y2U3MDM2MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.9Cne9CwiEpH5Q0ES9MwgNuCtdH3x2RpRdY1aoRXawHA';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      'Authorization': 'Bearer $_token',
      'accept': 'application/json',
    });

    handler.next(options);
  }
}
