import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sample/core/entities/user_entity.dart';
import 'package:sample/core/errors/datasource_error.dart';
import 'package:sample/core/errors/storage_error.dart';
import 'package:sample/core/services/i_local_storage.dart';
import 'package:sample/user/domain/params/user_params.dart';
import 'package:sample/user/external/user_datasource.dart';
import 'package:sample/user/infra/datasources/i_user_datasource.dart';
import 'package:test/test.dart';

class MockStorage extends Mock implements ILocalStorage {}

final user = UserEntity('Fulano', 20);
final params = UserParams(user);
final stakeTrace = StackTrace.current;
void main() {
  late IUserDatasource datasource;
  late ILocalStorage storage;

  setUpAll(() {
    storage = MockStorage();
    datasource = UserDatasource(storage);
  });

  group('Datasource save user ==>', () {
    test('Success', () async {
      when(() => storage.save(any(), any())).thenAnswer((_) async => true);
      final response = await datasource.save(params);
      expect(response, true);
    });
    test('Error', () async {
      when(() => storage.save(any(), any())).thenThrow(
          StorageError('Ocorreu um erro no banco de dados', stakeTrace));
      final response = datasource.save;
      expect(
          () async => await response(params), throwsA(isA<DatasourceError>()));
    });
  });
}
