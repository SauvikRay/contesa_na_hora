import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../helpers/dio/dio.dart';
import '../endpoints.dart';

class PostFineApi {
  Future<Map> postFineData(String? billtype, String? name, String? email,
      String? phone, String? message, File? document) async {
    FormData formData = FormData.fromMap({
      'bill_type': billtype!,
      'name': name!,
      'email': email!,
      'phone': phone!,
      'message': message!
    })
      ..files.add(
        MapEntry("documents", await MultipartFile.fromFile(document!.path)),
      );

    final _response = await postHttpNoAuth(Endpoints.postFiles(), formData);

    if (_response.statusCode == 200) {
      Map data = json.decode(json.encode(_response.data));
      return data;
    }
    if (kDebugMode) {
      print(_response.toString);
    }
    Map empty = {};
    return empty;
  }
}



    // var headers = {'Accept': 'application/json'};
    // var request = http.MultipartRequest(
    //     'POST', Uri.parse('https://lawyer.codemen.org/api/fines'));
    // request.fields.addAll({
    //   'bill_type': billtype!,
    //   'name': name!,
    //   'email': email!,
    //   'phone': phone!,
    //   'message': message!
    // });
    // request.files
    //     .add(await http.MultipartFile.fromPath('documents', document!.path));
    // request.headers.addAll(headers);

    // http.StreamedResponse response = await request.send();

    // if (response.statusCode == 200) {
    //   Map data =
    //       json.decode(json.encode(await response.stream.bytesToString()));
    //   return data;
    // }
    // Map empty = {};
    // return empty;