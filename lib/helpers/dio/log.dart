import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class Logger extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      print("= = = Dio Request = = =");
      print(options.headers);
      print(options.data);
      print(options.contentType);
      print(options.extra);
      print(options.baseUrl + "" + options.path);
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print("= = = Dio Success Response = = =");
      print(json.encode(response.data));
      print(response.headers);
      print(response.extra);
    }
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print("= = = Dio Error Response = = =");
      print('Error Response: ${err.response}');
      print('Error Message: ${err.message}');
      print('Error Type: ${err.type}');
    }
    return super.onError(err, handler);
  }
}
