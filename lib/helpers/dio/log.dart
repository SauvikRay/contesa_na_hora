import 'dart:convert';

import 'package:contesta_na_hora/helpers/navigation_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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

    Map map = err.response as Map;
    List list = map.values.first;
    String text = list[0].toString();
    var snackBar = SnackBar(
      content: Text(text),
    );
    ScaffoldMessenger.of(NavigationService.context).showSnackBar(snackBar);
    return super.onError(err, handler);
  }
}
