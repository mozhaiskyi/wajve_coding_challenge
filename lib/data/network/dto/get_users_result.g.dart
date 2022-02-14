// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_users_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUsersResult _$GetUsersResultFromJson(Map<String, dynamic> json) =>
    GetUsersResult(
      Meta.fromJson(json['meta'] as Map<String, dynamic>),
      (json['data'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
