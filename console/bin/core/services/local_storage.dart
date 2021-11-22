import 'package:shared_preferences/shared_preferences.dart';
import '../entities/user_entity.dart';
import 'i_local_storage.dart';

class LocalStorage implements ILocalStorage {
  late final SharedPreferences db;
  Future<void> _init() async {
    db = await SharedPreferences.getInstance();
  }

  @override
  Future<UserEntity> get() async {
    await _init();
    String? name = db.getString('name');
    int? age = db.getInt('age');
    return UserEntity(name!, age!);
  }

  @override
  Future<bool> save(String name, int age) async {
    await _init();
    final ageIsSaved = await db.setInt('age', age);
    final nameIsSaved = await db.setString('name', name);
    if (nameIsSaved && ageIsSaved) {
      return true;
    }
    return false;
  }
}
