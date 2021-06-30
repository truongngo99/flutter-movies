// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:teq_flutter_core/teq_flutter_core.dart';

// class CacheManager extends StorageData {
//   static late CacheManager _singleton;
//   static late SharedPreferences _sharedPreferences;

//   CacheManager._internal();

//   static Future<CacheManager> getInstance() async {
//     if (_singleton == null) {
//       _singleton = CacheManager._internal();
//       _sharedPreferences = await SharedPreferences.getInstance();
//       await _sharedPreferences.setString('test1', 'value1');
//       await _sharedPreferences.setString('test2', 'value2');
//     }
//     return _singleton;
//   }

//   @override
//   Future clearAll() => _sharedPreferences.clear();

//   @override
//   List<Map<String, dynamic>> getAllData() {
//     return _sharedPreferences
//         .getKeys()
//         .map<Map<String, dynamic>>((e) => {e: _sharedPreferences.get(e)})
//         .toList();
//     ;
//   }

//   @override
//   Future remove(String key) => _sharedPreferences.remove(key);

//   @override
//   Future logout() {
//     // TODO: implement logout
//     throw UnimplementedError();
//   }
// }
