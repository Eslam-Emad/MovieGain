import 'package:dio/dio.dart';

import '../../SharedPreference/pereferences.dart';
import '../../constants/api_path.dart';


/// APP Interceptor
/// This Interceptor handle error and response request for each dio request
class AppInterceptors extends Interceptor {
  // Header field name
  static const acceptLangHeader = "Accept-Language";
  static const acceptHeader = 'accept';
  static const contentEncodingHeader = 'content-encoding';
  static const contentLengthHeader = 'content-length';
  static const contentTypeHeader = 'content-type';
  static const authenticateHeader = 'Authorization';
  static const applicationJson = "application/json";
  static const bearer = "Bearer ";

  final SharedPreferencesHelper sharedPreferencesHelper;

  AppInterceptors(this.sharedPreferencesHelper);

  // @override
  // void onResponse(Response response, ResponseInterceptorHandler handler) {
  //   super.onResponse(response, handler);
  // }

  @override
  Future onRequest(RequestOptions options, handler) async {
    final token = await sharedPreferencesHelper.getToken();
    options.baseUrl = baseEndpoint;

    /// Create Time out for sending
    options.sendTimeout = 120 * 1000;

    /// Create Time out for Connect
    options.connectTimeout = 120 * 1000;

    /// Redirects true
    options.followRedirects = true;

    /// Add Header Accepted
    options.headers.addAll({
      Headers.acceptHeader: applicationJson,
      Headers.contentTypeHeader: applicationJson,
      acceptLangHeader: "en",
    });

    if (token != null) {
      options.headers.addAll({authenticateHeader: bearer + token});
    }

    return super.onRequest(options, handler);
  }

  @override
  Future<void> onError(DioError err, handler) async {
    return super.onError(err, handler);
  }
}
