import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:wajve_coding_challenge/domain/repository/user_repository.dart';
import 'package:wajve_coding_challenge/view/app.dart';

import '../data/test_data.dart';
import '../mocks/mocks.mocks.dart';

void main() {
  final userRepository = MockUserRepository();
  final testProviders = <SingleChildWidget>[
    Provider<UserRepository>(create: (_) => userRepository),
  ];

  testWidgets(
      'App trigger loading of next page'
      'when user scrolls to the bottom', (tester) async {

    final dataPage1 = generatePage(1, 100, 20, (index) => index % 2 == 0 ? testActiveUser : testInactiveUser);
    final dataPage2 = generatePage(2, 100, 20, (index) => index % 2 == 0 ? testActiveUser : testInactiveUser);
    when(userRepository.getUsers(1)).thenAnswer((_) => Future.value(dataPage1));
    when(userRepository.getUsers(2)).thenAnswer((_) => Future.value(dataPage2));

    final app = MultiProvider(
      providers: testProviders,
      child: App(),
    );
    await tester.pumpWidget(app);
    await tester.pump(const Duration(milliseconds: 300));

    final listFinder = find.byKey(const ValueKey('users_list_widget'));
    final nextPageLoaderFinder = find.byKey(const ValueKey('next_page_loader_widget'));
    expect(listFinder, findsOneWidget);

    verify(userRepository.getUsers(1)).called(1);

    await tester.drag(listFinder, const Offset(0.0, -800));
    await tester.pump(const Duration(milliseconds: 200));

    expect(nextPageLoaderFinder, findsOneWidget);

    verify(userRepository.getUsers(2)).called(1);
  });
}
