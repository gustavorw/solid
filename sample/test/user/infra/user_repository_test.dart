import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sample/core/entities/user_entity.dart';
import 'package:sample/core/errors/datasource_error.dart';
import 'package:sample/core/errors/storage_error.dart';
import 'package:sample/user/domain/params/user_params.dart';
import 'package:sample/user/infra/datasources/i_user_datasource.dart';
import 'package:sample/user/infra/repositories/user_repository.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

class MockDatasource extends Mock implements IUserDatasource {}

final user = UserEntity('Fulano', 20);
final params = UserParams(user);
final stakeTrace = StackTrace.current;
void main() {
  late UserRepository repository;
  late IUserDatasource datasource;
  setUpAll(() {
    datasource = MockDatasource();
    repository = UserRepository(datasource);
    registerFallbackValue(params);
  });

  group('Repository save user ==> ', () {
    test('Success', () async {
      when(() => datasource.save(any())).thenAnswer((_) async => true);
      final response = await repository.save(params);
      expect(response, isA<Right>());
    });
    test('Error', () async {
      when(() => datasource.save(any())).thenThrow(
          DatasourceError('Ocorreu um erro no banco de dados', stakeTrace));
      final response = await repository.save(params);
      expect(response, isA<Left>());
    });
  });
}
