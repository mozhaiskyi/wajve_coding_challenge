import 'package:wajve_coding_challenge/domain/model/page.dart';
import 'package:wajve_coding_challenge/domain/model/user.dart';

User get testActiveUser => User(0, 'test', 'test', Gender.unknown, Status.active);
User get testInactiveUser => User(0, 'test', 'test', Gender.unknown, Status.inactive);
User get testUnknownUser => User(0, 'test', 'test', Gender.unknown, Status.unknown);

DataPage<User> generatePage(int page, int pages, int length, User Function(int) generator) {
  final data = List.generate(length, (index) => generator(index), growable: false);
  return DataPage(page, pages, data);
}
