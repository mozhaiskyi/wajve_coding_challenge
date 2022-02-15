import 'package:json_annotation/json_annotation.dart';
import 'package:wajve_coding_challenge/data/network/dto/user.dart';

part 'get_user_result.g.dart';

@JsonSerializable(createToJson: false)
class GetUserResult {
  final User data;

  GetUserResult(this.data);

  factory GetUserResult.fromJson(Map<String, dynamic> json) => _$GetUserResultFromJson(json);
}
