// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SharedPrefHelper {
//   // private constructor as I don't want to allow creating an instance of this class itself.
//   SharedPrefHelper._();

//   /// Removes a value from SharedPreferences with given [key].
//   static Future<void> removeData(String key) async {
//     debugPrint('SharedPrefHelper : data with key : $key has been removed');
//     final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     await sharedPreferences.remove(key);
//   }

//   /// Removes all keys and values in the SharedPreferences
//   static Future<void> clearAllData() async {
//     debugPrint('SharedPrefHelper : all data has been cleared');
//     final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     await sharedPreferences.clear();
//   }

//   /// Saves a [value] with a [key] in the SharedPreferences.
//   static Future<Null> setData(String key, value) async {
//     final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     debugPrint('SharedPrefHelper : setData with key : $key and value : $value');
//     switch (value.runtimeType) {
//       case const (String):
//         await sharedPreferences.setString(key, value);
//         break;
//       case const (int):
//         await sharedPreferences.setInt(key, value);
//         break;
//       case const (bool):
//         await sharedPreferences.setBool(key, value);
//         break;
//       case const (double):
//         await sharedPreferences.setDouble(key, value);
//         break;
//       default:
//         return null;
//     }
//   }

//   /// Gets a bool value from SharedPreferences with given [key].
//   static Future<bool> getBool(String key) async {
//     debugPrint('SharedPrefHelper : getBool with key : $key');
//     final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     return sharedPreferences.getBool(key) ?? false;
//   }

//   /// Gets a double value from SharedPreferences with given [key].
//   static Future<double> getDouble(String key) async {
//     debugPrint('SharedPrefHelper : getDouble with key : $key');
//     final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     return sharedPreferences.getDouble(key) ?? 0.0;
//   }

//   /// Gets an int value from SharedPreferences with given [key].
//   static Future<int> getInt(String key) async {
//     debugPrint('SharedPrefHelper : getInt with key : $key');
//     final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     return sharedPreferences.getInt(key) ?? 0;
//   }

//   /// Gets an String value from SharedPreferences with given [key].
//   static Future<String> getString(String key) async {
//     debugPrint('SharedPrefHelper : getString with key : $key');
//     final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     return sharedPreferences.getString(key) ?? '';
//   }

//   /// Saves a [value] with a [key] in the FlutterSecureStorage.
//   static Future<void> setSecuredString(String key, String value) async {
//     const flutterSecureStorage = FlutterSecureStorage();
//     debugPrint(
//         'FlutterSecureStorage : setSecuredString with key : $key and value : $value');
//     await flutterSecureStorage.write(key: key, value: value);
//   }

//   /// Gets an String value from FlutterSecureStorage with given [key].
//   static Future<String> getSecuredString(String key) async {
//     const flutterSecureStorage = FlutterSecureStorage();
//     debugPrint('FlutterSecureStorage : getSecuredString with key :');
//     return await flutterSecureStorage.read(key: key) ?? '';
//   }

//   /// Removes all keys and values in the FlutterSecureStorage
//   static Future<void> clearAllSecuredData() async {
//     debugPrint('FlutterSecureStorage : all data has been cleared');
//     const flutterSecureStorage = FlutterSecureStorage();
//     await flutterSecureStorage.deleteAll();
//   }
// }
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  factory SharedPref() {
    return preferences;
  }

  SharedPref._internal();
  static final SharedPref preferences = SharedPref._internal();

  static late SharedPreferences sharedPreferences;

  ///Below method is to initialize the SharedPreference instance.
  Future<dynamic> instantiatePreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  ///Below method is to return the SharedPreference instance.
  SharedPreferences getPreferenceInstance() {
    return sharedPreferences;
  }

  ///Below method is to set the string value in the SharedPreferences.
  Future<dynamic> setString(String key, String stringValue) async {
    await sharedPreferences.setString(key, stringValue);
  }

  ///Below method is to get the string value from the SharedPreferences.
  String? getString(String key) {
    return sharedPreferences.getString(key);
  }

  ///Below method is to set the boolean value in the SharedPreferences.
  Future<dynamic> setBoolean(String key, bool booleanValue) async {
    await sharedPreferences.setBool(key, booleanValue);
  }

  ///Below method is to get the boolean value from the SharedPreferences.
  bool? getBoolean(String key) {
    return sharedPreferences.getBool(key);
  }

  ///Below method is to set the double value in the SharedPreferences.
  Future<dynamic> setDouble(String key, double doubleValue) async {
    await sharedPreferences.setDouble(key, doubleValue);
  }

  ///Below method is to set the double value from the SharedPreferences.
  double? getDouble(String key) {
    return sharedPreferences.getDouble(key);
  }

  ///Below method is to set the int value in the SharedPreferences.
  Future<dynamic> setInt(String key, int intValue) async {
    await sharedPreferences.setInt(key, intValue);
  }

  ///Below method is to get the int value from the SharedPreferences.
  int? getInt(String key) {
    return sharedPreferences.getInt(key);
  }

  ///Below method is to remove the received preference.
  Future<dynamic> removePreference(String key) async {
    await sharedPreferences.remove(key);
  }

  ///Below method is to check the availability of the received preference .
  bool containPreference(String key) {
    if (sharedPreferences.get(key) == null) {
      return false;
    } else {
      return true;
    }
  }

  ///Below method is to clear the SharedPreference.
  Future<dynamic> clearPreferences() async {
    await sharedPreferences.clear();
  }
}