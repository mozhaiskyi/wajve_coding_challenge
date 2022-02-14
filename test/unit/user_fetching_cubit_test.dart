import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:wajve_coding_challenge/domain/bloc/user_fetching_cubit.dart';
import 'package:wajve_coding_challenge/domain/model/page.dart';
import 'package:wajve_coding_challenge/domain/model/user.dart';
import 'package:wajve_coding_challenge/domain/repository/user_repository.dart';

import 'user_fetching_cubit_test.mocks.dart';

@GenerateMocks([UserRepository])
void main() {
  final userRepository = MockUserRepository();

  group('UserFetchingCubit interface', () {
    test('Initial state is Loading', () {
      final cubit = UserFetchingCubit(userRepository: userRepository);
      expect(cubit.state.runtimeType, Loading);
    });

    test('The state is Error when exception occurs', () async {
      final cubit = UserFetchingCubit(userRepository: userRepository);

      when(userRepository.getUsers(1)).thenAnswer((_) => Future.error(Exception()));
      await cubit.loadNextPage();

      expect(cubit.state.runtimeType, Error);
    });

    test('The state contains one batch after loadNextPage() call', () async {
      final cubit = UserFetchingCubit(userRepository: userRepository);

      final dataPage = _generatePage(1, 100, 20, () => _testActiveUser);
      when(userRepository.getUsers(1)).thenAnswer((_) => Future.value(dataPage));

      await cubit.loadNextPage();

      expect(cubit.state.runtimeType, Content);
      expect((cubit.state as Content).batches.length, 1);
    });
  });

  group('Pagination', () {
    test('The state contains valid hasNextPage after loadNextPage() call', () async {
      final cubit = UserFetchingCubit(userRepository: userRepository);

      final dataPage1 = _generatePage(1, 2, 20, () => _testActiveUser);
      final dataPage2 = _generatePage(2, 2, 20, () => _testActiveUser);
      when(userRepository.getUsers(1)).thenAnswer((_) => Future.value(dataPage1));
      when(userRepository.getUsers(2)).thenAnswer((_) => Future.value(dataPage2));

      await cubit.loadNextPage();

      expect(cubit.state.runtimeType, Content);
      expect((cubit.state as Content).hasNextPage, true);

      await cubit.loadNextPage();

      expect((cubit.state as Content).hasNextPage, false);
    });

    test('The state is Content with empty batch when data does not exist', () async {
      final cubit = UserFetchingCubit(userRepository: userRepository);

      final dataPage = _generatePage(1, 1, 0, () => _testActiveUser);
      when(userRepository.getUsers(1)).thenAnswer((_) => Future.value(dataPage));

      await cubit.loadNextPage();

      expect(cubit.state.runtimeType, Content);
      expect((cubit.state as Content).batches.length, 1);
      expect((cubit.state as Content).batches[0].inactive.length, 0);
      expect((cubit.state as Content).batches[0].active.length, 0);
    });

    test('The state contains valid batches after loadNextPage() call', () async {
      final cubit = UserFetchingCubit(userRepository: userRepository);

      final dataPage1 = _generatePage(1, 2, 20, () => _testActiveUser);
      final dataPage2 = _generatePage(2, 2, 20, () => _testActiveUser);
      when(userRepository.getUsers(1)).thenAnswer((_) => Future.value(dataPage1));
      when(userRepository.getUsers(2)).thenAnswer((_) => Future.value(dataPage2));

      await cubit.loadNextPage();

      expect(cubit.state.runtimeType, Content);
      expect((cubit.state as Content).hasNextPage, true);
      expect((cubit.state as Content).batches.length, 1);

      final users1 = <User>{};
      users1.addAll((cubit.state as Content).batches[0].active);
      users1.addAll((cubit.state as Content).batches[0].inactive);
      expect(users1, dataPage1.data.toSet());

      await cubit.loadNextPage();

      expect((cubit.state as Content).hasNextPage, false);
      expect((cubit.state as Content).batches.length, 2);

      final users2 = <User>{};
      users2.addAll((cubit.state as Content).batches[1].active);
      users2.addAll((cubit.state as Content).batches[1].inactive);
      expect(users2, dataPage2.data.toSet());
    });
  });

  group('Batch parsing', () {
    test('Users with unknown status are ignored', () async {
      final cubit = UserFetchingCubit(userRepository: userRepository);

      final dataPage = _generatePage(1, 1, 20, () => _testUnknownUser);
      when(userRepository.getUsers(1)).thenAnswer((_) => Future.value(dataPage));

      await cubit.loadNextPage();

      expect(cubit.state.runtimeType, Content);
      expect((cubit.state as Content).batches.length, 1);
      expect((cubit.state as Content).batches[0].inactive.length, 0);
      expect((cubit.state as Content).batches[0].active.length, 0);
    });

    test('Parsing by status works well', () async {
      final cubit = UserFetchingCubit(userRepository: userRepository);

      final users = [
        _testActiveUser,
        _testActiveUser,
        _testInactiveUser,
        _testInactiveUser,
        _testUnknownUser,
        _testUnknownUser,
      ];
      final dataPage = DataPage(1, 1, users);
      when(userRepository.getUsers(1)).thenAnswer((_) => Future.value(dataPage));

      await cubit.loadNextPage();

      expect(cubit.state.runtimeType, Content);
      expect((cubit.state as Content).batches.length, 1);
      expect((cubit.state as Content).batches[0].inactive.length, 2);
      expect((cubit.state as Content).batches[0].active.length, 2);
    });
  });
}

User get _testActiveUser => User(0, 'test', 'test', Gender.unknown, Status.active);
User get _testInactiveUser => User(0, 'test', 'test', Gender.unknown, Status.inactive);
User get _testUnknownUser => User(0, 'test', 'test', Gender.unknown, Status.unknown);

DataPage<User> _generatePage(int page, int pages, int length, User Function() generator) {
  final data = List.generate(length, (_) => generator(), growable: false);
  return DataPage(page, pages, data);
}
