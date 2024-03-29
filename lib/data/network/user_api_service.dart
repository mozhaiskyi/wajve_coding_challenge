import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:wajve_coding_challenge/data/network/dto/get_users_result.dart';
import 'package:wajve_coding_challenge/data/network/dto/get_user_result.dart';

const baseUrl = 'gorest.co.in';
const apiVersion = 'public/v1';

abstract class UserApiService {
  Future<GetUsersResult> getUsers({required int page});
  Future<GetUserResult> getUserById({required int id});
}

class UserApiServiceImpl extends UserApiService {
  final http.Client client;

  UserApiServiceImpl({required this.client});

  @override
  Future<GetUsersResult> getUsers({required int page}) async {
    final queryParams = {'page': page.toString()};
    final uri = Uri.https(baseUrl, '$apiVersion/users', queryParams);
    final response = await client.get(uri);
    final json = convert.jsonDecode(response.body) as Map<String, dynamic>;
    return GetUsersResult.fromJson(json);
  }

  @override
  Future<GetUserResult> getUserById({required int id}) async {
    final uri = Uri.https(baseUrl, '$apiVersion/users/$id');
    final response = await client.get(uri);
    final json = convert.jsonDecode(response.body) as Map<String, dynamic>;
    return GetUserResult.fromJson(json);
  }
}
