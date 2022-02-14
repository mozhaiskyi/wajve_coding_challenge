import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

enum Gender { @JsonValue('male') male, @JsonValue('female') female, unknown }

enum Status { @JsonValue('active') active, @JsonValue('inactive') inactive, unknown }

@JsonSerializable(createToJson: false)
class User {
  final int id;
  final String name;
  final String email;
  @JsonKey(defaultValue: Gender.unknown)
  final Gender gender;
  @JsonKey(defaultValue: Status.unknown)
  final Status status;

  User(this.id, this.name, this.email, this.gender, this.status);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
