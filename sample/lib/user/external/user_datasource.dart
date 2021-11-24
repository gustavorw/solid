import '../../core/errors/datasource_error.dart';
import '../../core/errors/storage_error.dart';
import '../../core/services/i_local_storage.dart';
import '../domain/params/user_params.dart';
import '../../core/entities/user_entity.dart';
import '../infra/datasources/i_user_datasource.dart';

class UserDatasource implements IUserDatasource {
  final ILocalStorage storage;

  UserDatasource(this.storage);
  @override
  Future<UserEntity> get() async {
    try {
      final response = await storage.get();
      return response;
    } on StorageError catch (e, s) {
      throw DatasourceError(
          'Ocorreu um erro ao tentar buscar os dados de usuário', s);
    }
  }

  @override
  Future<bool> save(UserParams params) async {
    try {
      final response = await storage.save(params.user.name, params.user.age);
      return response;
    } on StorageError catch (e, s) {
      throw DatasourceError('Não foi possivel salvar os dados do usuário', s);
    }
  }
}
