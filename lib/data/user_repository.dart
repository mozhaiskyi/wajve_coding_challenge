import 'package:wajve_coding_challenge/data/mapper/user_mapper.dart' as user_mapper;
import 'package:wajve_coding_challenge/data/network/user_api_service.dart';
import 'package:wajve_coding_challenge/domain/model/page.dart';
import 'package:wajve_coding_challenge/domain/model/user.dart';
import 'package:wajve_coding_challenge/domain/repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserApiService apiService;

  UserRepositoryImpl({required this.apiService});

  @override
  Future<DataPage<User>> getUsers(int page) async {
    final result = await apiService.getUsers(page: page);
    return DataPage(
      result.meta.pagination.page,
      result.meta.pagination.pages,
      result.data.map(user_mapper.map).toList(growable: false),
    );
  }

  @override
  Future<User> getUserById(int id) async {
    final result = await apiService.getUserById(id: id);
    return user_mapper.map(result.data);
  }
}
