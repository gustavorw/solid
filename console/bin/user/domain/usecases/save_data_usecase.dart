import 'package:dartz/dartz.dart';

import '../../../core/errors/domain_error.dart';
import '../../../core/errors/i_error.dart';
import '../params/data_params.dart';
import '../repositories/i_data_repository.dart';

class SaveDataUsecase {
  final IDataRepository repository;
  SaveDataUsecase(this.repository);

  Future<Either<IError, bool>> call(DataParams params) async {
    if (params.user.age.isNegative || params.user.name.isEmpty) {
      return Left(DomainError('Dados invalidos', StackTrace.current));
    }
    return repository.call(params);
  }
}
