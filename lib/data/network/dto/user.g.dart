// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['id'] as int,
      json['name'] as String,
      json['email'] as String,
      $enumDecodeNullable(_$GenderEnumMap, json['gender']) ?? Gender.unknown,
      $enumDecodeNullable(_$StatusEnumMap, json['status']) ?? Status.unknown,
    );

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.unknown: 'unknown',
};

const _$StatusEnumMap = {
  Status.active: 'active',
  Status.inactive: 'inactive',
  Status.unknown: 'unknown',
};
