import '../../../core/entities/user_entity.dart';
import '../../domain/params/user_params.dart';

abstract class IUserDatasource {
  Future<bool> save(UserParams params);
  Future<UserEntity> get();
}
