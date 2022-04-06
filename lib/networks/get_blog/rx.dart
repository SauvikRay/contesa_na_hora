import 'package:rxdart/rxdart.dart';
import 'api.dart';

class GetBloagRX {
  final api = GetBlogApi();
  late Map empty;
  final BehaviorSubject _dataFetcher = BehaviorSubject<Map>();

  ValueStream get getBlogData => _dataFetcher.stream;

  Future<void> fetchBlogData() async {
    try {
      Map blogData = await api.fetchBlogData();
      _dataFetcher.sink.add(blogData);
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
