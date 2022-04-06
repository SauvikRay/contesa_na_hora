import 'package:contesta_na_hora/helpers/dio/Log.dart';
import 'package:contesta_na_hora/networks/endpoints.dart';
import 'package:dio/dio.dart';

class DioSingleton {
  static final DioSingleton _singleton = new DioSingleton._internal();

  DioSingleton._internal();

  static DioSingleton get instance => _singleton;

  late Dio dio;

  void update(String auth) {
    print("Dio update");
    BaseOptions options = BaseOptions(
      headers: {
        "accept": "text/plain",
        "Authorization": "Bearer $auth",
      },
      baseUrl: url,
      connectTimeout: 100000,
      receiveTimeout: 100000,
    );
    dio.options = options;
  }

  void create() {
    BaseOptions options = BaseOptions(
      baseUrl: url,
      connectTimeout: 100000,
      receiveTimeout: 100000,
    );
    dio = Dio(options)..interceptors.add(Logger());
  }
}

Future postHttp(String path, String auth, [dynamic data]) =>
    DioSingleton.instance.dio.post(
      path,
      data: data,
      options: Options(
        headers: {
          "accept": "text/plain",
          "Authorization": "Bearer $auth",
        },
      ),
    );

Future postHttpNoAuth(String path, [dynamic data]) =>
    DioSingleton.instance.dio.post(
      path,
      data: data,
      options: Options(
        headers: {
          "accept": "text/plain",
        },
      ),
    );

Future getHttp(String path, String auth, [dynamic data]) =>
    DioSingleton.instance.dio.get(
      path,
      options: Options(
        headers: {
          "accept": "text/plain",
          "Authorization": "Bearer $auth",
        },
      ),
    );

Future getHttpNoAuth(String path, [dynamic data]) =>
    DioSingleton.instance.dio.get(
      path,
      options: Options(
        headers: {
          "accept": "text/plain",
        },
      ),
    );