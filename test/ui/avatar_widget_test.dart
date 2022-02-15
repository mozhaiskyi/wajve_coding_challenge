import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wajve_coding_challenge/domain/model/user.dart';
import 'package:wajve_coding_challenge/view/user_browser/avatar_widget.dart';

void main() {
  testWidgets(
      'The background color of AvatarWidget is the '
      'same for widgets with the same name parameter', (tester) async {

    final row = Row(
      children: const [
        AvatarWidget(name: 'test_name', gender: Gender.male, size: 40),
        AvatarWidget(name: 'test_name', gender: Gender.unknown, size: 40),
      ],
    );
    await tester.pumpWidget(MaterialApp(home: row));
    final finder = find.byKey(const ValueKey('circle_avatar'));
    
    expect(finder, findsNWidgets(2));

    final elements = finder.evaluate().toList(growable: false);
    final circleAvatar1 = elements[0].widget as CircleAvatar;
    final circleAvatar2 = elements[1].widget as CircleAvatar;

    expect(circleAvatar1.backgroundColor, isNotNull);
    expect(circleAvatar2.backgroundColor, isNotNull);
    expect(circleAvatar1.backgroundColor == circleAvatar2.backgroundColor, true);
  });

  testWidgets(
      'The background color of AvatarWidget is different'
      ' for widgets with different name parameter', (tester) async {

    final row = Row(
      children: const [
        AvatarWidget(name: 'test_name1', gender: Gender.male, size: 40),
        AvatarWidget(name: 'test_name2', gender: Gender.unknown, size: 40),
      ],
    );
    await tester.pumpWidget(MaterialApp(home: row));
    final finder = find.byKey(const ValueKey('circle_avatar'));

    expect(finder, findsNWidgets(2));

    final elements = finder.evaluate().toList(growable: false);
    final circleAvatar1 = elements[0].widget as CircleAvatar;
    final circleAvatar2 = elements[1].widget as CircleAvatar;

    expect(circleAvatar1.backgroundColor, isNotNull);
    expect(circleAvatar2.backgroundColor, isNotNull);
    expect(circleAvatar1.backgroundColor == circleAvatar2.backgroundColor, false);
  });
}
