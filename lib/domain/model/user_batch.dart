import 'package:wajve_coding_challenge/domain/model/user.dart';

class UserBatch {
  final List<User> active;
  final List<User> inactive;

  UserBatch(this.active, this.inactive);
}
