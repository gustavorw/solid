import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sample/core/entities/user_entity.dart';
import 'package:sample/core/errors/datasource_error.dart';
import 'package:sample/user/domain/params/user_params.dart';
import 'package:sample/user/domain/repositories/i_user_repository.dart';
import 'package:sample/user/domain/usecases/get_user_usecase.dart';
import 'package:sample/user/domain/usecases/save_user_usecase.dart';
import 'package:test/test.dart';

class MockRepository extends Mock implements IUserRepository {}

final user = UserEntity('Fulano', 20);
final params = UserParams(user);
final stakeTrace = StackTrace.current;
void main() {
  late GetUserUsecase getUserUsecase;
  late SaveUserUsecase saveUserUsecase;
  late IUserRepository repository;

  setUpAll(() {
    repository = MockRepository();
    getUserUsecase = GetUserUsecase(repository);
    saveUserUsecase = SaveUserUsecase(repository);
    registerFallbackValue(params);
  });
  group('Save User ==>', () {
    test('Success', () async {
      when(() => repository.save(any())).thenAnswer((_) async {
        return right(true);
      });
      final response = await saveUserUsecase(params);
      expect(response, isA<Right>());
    });
    test('Invalid data', () async {
      when(() => repository.save(any())).thenAnswer((_) async {
        return left(
            DatasourceError('Não foi possivel salvar os dados', stakeTrace));
      });
      final response = await saveUserUsecase(params);
      expect(response, isA<Left>());
    });
  });

  group('Get User ==>', () {
    test('Success', () async {
      when(() => repository.get()).thenAnswer((_) async {
        return right(user);
      });
      final response = await getUserUsecase();
      expect(response, isA<Right>());
    });
  });
}
