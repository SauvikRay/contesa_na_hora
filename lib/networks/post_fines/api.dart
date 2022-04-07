import 'dart:convert';
import 'dart:io';

import '../../helpers/dio/dio.dart';
import '../endpoints.dart';
import 'package:http/http.dart' as http;

class PostFineApi {
  Future<Map> postFineData(String? billtype, String? name, String? email,
      String? phone, String? message, File? document) async {
    var headers = {'Accept': 'application/json'};
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://lawyer.codemen.org/api/fines'));
    request.fields.addAll({
      'bill_type': billtype!,
      'name': name!,
      'email': email!,
      'phone': phone!,
      'message': message!
    });
    request.files
        .add(await http.MultipartFile.fromPath('documents', document!.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      Map data = json.decode(json.encode(response.stream.bytesToString()));
      return data;
    }
    Map empty = {};
    return empty;

    // final _response = await postHttpNoAuth(
    //     Endpoints.postFiles(
    //       billtype: billtype,
    //       name: name,
    //       email: email,
    //       phone: phone,
    //       message: message,
    //     ),
    //     document);

    // if (_response.statusCode == 200) {
    //   Map data = json.decode(json.encode(_response.data));
    //   return data;
    // }
    // print(_response.toString);
    // Map empty = {};
    // return empty;
  }
}
