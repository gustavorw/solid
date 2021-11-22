import 'package:dartz/dartz.dart';

import '../../../core/errors/i_error.dart';
import '../params/data_params.dart';

abstract class IDataRepository {
  Future<Either<IError, bool>> call(DataParams params);
}
