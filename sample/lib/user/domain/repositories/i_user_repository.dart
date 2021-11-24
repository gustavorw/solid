import 'package:dartz/dartz.dart';

import '../../../core/entities/user_entity.dart';
import '../../../core/errors/i_error.dart';
import '../params/user_params.dart';

abstract class IUserRepository {
  Future<Either<IError, bool>> save(UserParams params);
  Future<Either<IError, UserEntity>> get();
}
