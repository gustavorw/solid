import '../entities/user_entity.dart';
import '../errors/storage_error.dart';
import 'i_local_storage.dart';

class LocalStorage implements ILocalStorage {
  UserEntity? db;

  @override
  Future<UserEntity> get() async {
    if (db == null) {
      throw StorageError('Não há dados salvos', StackTrace.current);
    }
    return db!;
  }

  @override
  Future<bool> save(String name, int age) async {
    db = UserEntity(name, age);
    if (db == null) {
      throw StorageError(
          'Não foi possivel salvar os dados', StackTrace.current);
    }
    return true;
  }
}
