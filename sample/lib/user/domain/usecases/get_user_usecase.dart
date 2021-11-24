import 'package:dartz/dartz.dart';

import '../../../core/entities/user_entity.dart';
import '../../../core/errors/i_error.dart';
import '../repositories/i_user_repository.dart';

class GetUserUsecase {
  final IUserRepository repository;

  GetUserUsecase(this.repository);

  Future<Either<IError, UserEntity>> call() async {
    return repository.get();
  }
}
