import '../../core/entities/user_entity.dart';
import '../../core/services/local_storage_in_file.dart';
import '../../core/services/local_storage_in_memory.dart';
import '../domain/params/user_params.dart';
import '../domain/usecases/get_user_usecase.dart';
import '../domain/usecases/save_user_usecase.dart';
import '../external/user_datasource.dart';
import '../infra/repositories/user_repository.dart';

class UserController {
  //final _storage = LocalStorageInMemory();
  final _storage = LocalStorageInFile();
  //final storageText
  late SaveUserUsecase _saveUserUsecase;
  late GetUserUsecase _getUserUsecase;

  UserController.init() {
    _getUserUsecase = GetUserUsecase(
      UserRepository(
        UserDatasource(
          _storage,
        ),
      ),
    );

    _saveUserUsecase = SaveUserUsecase(
      UserRepository(
        UserDatasource(
          _storage,
        ),
      ),
    );
  }

  Future<void> save(String name, int age) async {
    final response = await _saveUserUsecase(UserParams(UserEntity(name, age)));
    response.fold((l) {
      print('${l.message} :(');
    }, (r) {
      print('Dados salvos com sucesso!');
    });
  }

  Future<void> get() async {
    final response = await _getUserUsecase();
    response.fold((l) {
      print('${l.message} :(');
    }, (r) {
      print('--- Seus dados --- ');
      print('Nome: ${r.name}');
      print('Idade: ${r.age}');
    });
  }
}
