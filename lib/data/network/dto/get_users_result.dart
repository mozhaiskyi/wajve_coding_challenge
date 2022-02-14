import 'package:json_annotation/json_annotation.dart';
import 'package:wajve_coding_challenge/data/network/dto/meta.dart';
import 'package:wajve_coding_challenge/data/network/dto/user.dart';

part 'get_users_result.g.dart';

@JsonSerializable(createToJson: false)
class GetUsersResult {
  final Meta meta;
  final List<User> data;

  GetUsersResult(this.meta, this.data);

  factory GetUsersResult.fromJson(Map<String, dynamic> json) => _$GetUsersResultFromJson(json);
}
