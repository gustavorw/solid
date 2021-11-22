import 'package:dartz/dartz.dart';
import '../../../core/errors/i_error.dart';
import '../../domain/params/data_params.dart';
import '../../domain/repositories/i_data_repository.dart';

class DataRepository implements IDataRepository {
  @override
  Future<Either<IError, bool>> call(DataParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
