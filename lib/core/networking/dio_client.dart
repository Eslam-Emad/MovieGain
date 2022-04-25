import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../service_locator.dart';
import 'interceptors/app_interceptor.dart';
import 'interceptors/pretty_dio_logger.dart';

/// Handle Http Request
class DioClient {
  static Dio instanceDio() {
    Dio dio = sl();
    dio.interceptors.add(AppInterceptors(sl()));
    if(kDebugMode){
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90));
    }
    return dio;
  }

  Future<Response> post(String path,
      {data, queryParameters, headers, formData}) async {
    return instanceDio().post(path,
        data: data ?? FormData.fromMap(formData),
        queryParameters: queryParameters,
        options: Options(headers: headers));
  }

  Future<Response> put(String path, {data, queryParameters, headers}) async {
    return instanceDio().put(path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers));
  }

  Future<Response> patch(String path, {data, queryParameters, headers}) async {
    return instanceDio().patch(path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers));
  }

  Future<Response> get(String path,
      {dynamic queryParameters, token, headers}) async {
    return instanceDio().get(path,
        queryParameters: queryParameters, options: Options(headers: headers));
  }

  static Future<Response> delete(String path,
      {queryParameters, token, headers}) {
    return instanceDio().delete(path,
        queryParameters: queryParameters, options: Options(headers: headers));
  }
}
