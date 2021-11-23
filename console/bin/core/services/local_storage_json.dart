import 'dart:convert';
import 'dart:io';
import '../entities/user_entity.dart';
import '../errors/storage_error.dart';
import 'i_local_storage.dart';

class LocalStorageJson implements ILocalStorage {
  late File file =
      File('C:/Users/gusta/Desktop/solid/console/bin/core/services/db.json');

  @override
  Future<UserEntity> get() async {
    if (await file.exists()) {
      final lines = await file.readAsString();
      final map = json.decode(lines);
      String name = map['name'];
      int age = map['age'];
      return UserEntity(name, age);
    } else {
      throw StorageError('Não existe banco de dados', StackTrace.current);
    }
  }

  @override
  Future<bool> save(String name, int age) async {
    if (await file.exists()) {
      await file.writeAsString(json.encode({"name": "Beatriz", "age": 21}));

      return true;
    } else {
      throw StorageError('Não existe banco de dados', StackTrace.current);
    }
  }
}
