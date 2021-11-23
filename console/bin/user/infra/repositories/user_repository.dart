import 'package:dartz/dartz.dart';
import '../../../core/entities/user_entity.dart';
import '../../../core/errors/datasource_error.dart';
import '../../../core/errors/i_error.dart';
import '../../domain/params/user_params.dart';
import '../../domain/repositories/i_user_repository.dart';
import '../datasources/i_user_datasource.dart';

class UserRepository implements IUserRepository {
  final IUserDatasource datasource;

  UserRepository(this.datasource);
  @override
  Future<Either<IError, bool>> save(UserParams params) async {
    try {
      final response = await datasource.save(params);
      return Right(response);
    } on DatasourceError catch (err) {
      return Left(err);
    } catch (e, s) {
      // quando não tiver um erro coletivo
      print(s);
      // coloquei só pro linter não chorar
      throw Exception('Erro não conhecido');
    }
  }

  @override
  Future<Either<IError, UserEntity>> get() async {
    try {
      final response = await datasource.get();
      return Right(response);
    } on DatasourceError catch (err) {
      return Left(err);
    } catch (e, s) {
      // quando não tiver um erro coletivo
      print(s);
      // coloquei só pro linter não chorar
      throw Exception('Erro não conhecido');
    }
  }
}
