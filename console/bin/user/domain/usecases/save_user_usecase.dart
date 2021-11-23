import 'package:dartz/dartz.dart';

import '../../../core/errors/domain_error.dart';
import '../../../core/errors/i_error.dart';

import '../params/user_params.dart';
import '../repositories/i_user_repository.dart';

class SaveUserUsecase {
  final IUserRepository repository;
  SaveUserUsecase(this.repository);

  Future<Either<IError, bool>> call(UserParams params) async {
    if (params.user.age.isNegative || params.user.name.isEmpty) {
      return Left(DomainError('Dados invalidos', StackTrace.current));
    }
    return repository.save(params);
  }
}
