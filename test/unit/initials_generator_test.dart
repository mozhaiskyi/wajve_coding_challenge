import 'package:flutter_test/flutter_test.dart';
import 'package:wajve_coding_challenge/view/util/initial_generator.dart';

void main() {
  test('Generator works well when name is empty', () {
    const name1 = '';
    const name2 = 'John Deer';
    final initials1 = generateInitialFromName(name: name1);
    final initials2 = generateInitialFromName(name: name2);

    expect(initials1, '');
    expect(initials2, 'JD');
  });

  test('Generator works well with complex names', () {
    const name1 = 'John Deer';
    const name2 = 'Jr. John Deer';
    const name3 = 'John Deer II';
    const name4 = 'Pr. John Deer II';
    final initials1 = generateInitialFromName(name: name1);
    final initials2 = generateInitialFromName(name: name2);
    final initials3 = generateInitialFromName(name: name3);
    final initials4 = generateInitialFromName(name: name4);

    expect(initials1, 'JD');
    expect(initials2, 'JD');
    expect(initials3, 'JD');
    expect(initials4, 'JD');
  });
}
