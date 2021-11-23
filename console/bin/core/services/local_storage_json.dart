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
      final decode = json.decode(lines);
      return UserEntity(decode['name'], decode['age']);
    } else {
      throw StorageError('Não existe banco de dados', StackTrace.current);
    }
  }

  @override
  Future<bool> save(String name, int age) async {
    if (await file.exists()) {
      await file.writeAsString(json.encode({"name": name, "age": age}));
      return true;
    } else {
      throw StorageError('Não existe banco de dados', StackTrace.current);
    }
  }
}
