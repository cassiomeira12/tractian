import 'package:shared_preferences/shared_preferences.dart';
import 'package:tractian/domain/domain.dart';

class LocalStorageUseCase implements ILocalStorageUseCase {
  @override
  Future<void> clearAll() async {
    final pref = await SharedPreferences.getInstance();
    await pref.clear();
  }

  @override
  Future<bool> delete(String key) async {
    final pref = await SharedPreferences.getInstance();
    return await pref.remove(key);
  }

  @override
  Future<dynamic> get(String key) async {
    final pref = await SharedPreferences.getInstance();
    return pref.get(key);
  }

  @override
  Future<bool> set(String key, dynamic value) async {
    final pref = await SharedPreferences.getInstance();
    switch (value.runtimeType.toString()) {
      case 'bool':
        return await pref.setBool(key, value);
      case 'double':
        return await pref.setDouble(key, value);
      case 'int':
        return await pref.setInt(key, value);
      case 'String':
        return await pref.setString(key, value);
      case 'List<String>':
        return await pref.setStringList(key, value);
      default:
        throw Exception('type not accepted');
    }
  }
}
