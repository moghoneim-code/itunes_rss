import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../errors/dio_exceptions.dart';
import '../interceptors/connectivity_interceptor.dart';
import '../network_const/network_constants.dart';

Dio baseDioClient() {
  Dio dio = Dio();
  dio.options = BaseOptions(
    baseUrl:
    NetworkConstants.baseUrl,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  );
  if (kDebugMode) {
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  dio.interceptors.add(ConnectivityInterceptor());

  dio.interceptors.add(
    InterceptorsWrapper(
      onError: (DioException error, ErrorInterceptorHandler handler) {
        final customError = DioExceptions.fromDioError(error);
        return handler.reject(DioException(
          requestOptions: error.requestOptions,
          error: customError.message,
          type: error.type,
          response: error.response,
        ));
      },
    ),
  );
  return dio;
}
