import 'package:wajve_coding_challenge/domain/model/page.dart';
import 'package:wajve_coding_challenge/domain/model/user.dart';

abstract class UserRepository {
  Future<DataPage<User>> getUsers(int page);
  Future<User> getUserById(int id);
}
