import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../errors/custom_exceptions.dart';

class ConnectivityInterceptor extends Interceptor {

  @override
  void onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.none)) {
      handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.connectionError,
          error: NoInternetError()
        ),
      );
      return;
    }

    super.onRequest(options, handler);
  }
}