import 'dart:io';

import 'package:rxdart/rxdart.dart';
import 'api.dart';

class PostFileRX {
  final api = PostFineApi();
  late Map empty;
  final BehaviorSubject _dataFetcher = BehaviorSubject<Map>();

  ValueStream get getFileData => _dataFetcher.stream;

  Future<void> postFileData(String? billtype, String? name, String? email,
      String? phone, String? message, File? document) async {
    try {
      Map fileData = await api.postFineData(
          billtype, name, email, phone, message, document);
      _dataFetcher.sink.add(fileData);
    } catch (e) {
      _dataFetcher.sink.addError(e);
    }
  }

  void clean() {
    _dataFetcher.sink.add(empty);
  }

  void dispose() {
    _dataFetcher.close();
  }
}
