// import 'package:get_storage/get_storage.dart';

// class LocalStorage {
//   final _store = GetStorage('vimatone');

//   Future<bool> getAuthorized() async {
//     var isAuthrized = await _store.read("isAuthorized");
//     if (isAuthrized != null) return isAuthrized == 1;
//     return false;
//   }

//   Future<void> setAuthorized(bool isAuthorized) async {
//     int authStatus = isAuthorized ? 1 : 0;
//     await _store.write("isAuthorized", authStatus);
//   }
// }
