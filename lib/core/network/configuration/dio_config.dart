import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
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
  return dio;
}
