import '../entities/user_entity.dart';

abstract class ILocalStorage {
  Future<bool> save(String name, int age);
  Future<UserEntity> get();
}
