import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:wajve_coding_challenge/data/network/dto/get_users_result.dart';

const baseUrl = 'gorest.co.in';
const apiVersion = 'public/v1';

abstract class UserApiService {
  Future<GetUsersResult> getUsers({required int page});
}

class UserApiServiceImpl extends UserApiService {
  final http.Client client;

  UserApiServiceImpl({required this.client});

  @override
  Future<GetUsersResult> getUsers({required int page}) async {
    final uri = Uri.https(baseUrl, '$apiVersion/users');
    final response = await client.get(uri);
    final json = convert.jsonDecode(response.body) as Map<String, dynamic>;
    return GetUsersResult.fromJson(json);
  }
}
