import 'objectbox.g.dart';

class DataBase {
  Store? _store;

  Future<Store> getStore() async {
    return _store ??= await openStore();
  }
}
