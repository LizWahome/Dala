
import 'package:dio/dio.dart';

/// NetworkServiceInterceptor will override the onRequest method from  Dio Interceptor class
/// onRequest method will add out custom headers

class NetworkServiceInterceptor extends Interceptor {
  NetworkServiceInterceptor();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Read the access token form the secure storage
    //String? accessToken = AuthService.instance.authUser?.access;

    // ignore: unnecessary_null_comparison
    // if (accessToken != null) {
    //   options.headers['Accept'] = 'application/json';
    //   options.headers['contentType'] = 'application/json';
    //   options.headers['Authorization'] = 'Bearer $accessToken';
    // } else {
    //   options.headers['Accept'] = 'application/json';
    //   options.headers['contentType'] = 'application/json';
    // }

    // super.onRequest(options, handler);
  }
}
