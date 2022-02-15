import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wajve_coding_challenge/domain/model/user.dart';
import 'package:wajve_coding_challenge/domain/repository/user_repository.dart';

abstract class UserDetailsState {}

class Loading extends UserDetailsState {}

class Error extends UserDetailsState {}

class Content extends UserDetailsState {
  final User user;

  Content(this.user);
}

class UserDetailsCubit extends Cubit<UserDetailsState> {
  final UserRepository userRepository;

  UserDetailsCubit({required this.userRepository}) : super(Loading());

  Future<void> loadDetailsFromPayload(User user) async {
    final content = Content(user);
    emit(content);
  }

  Future<void> loadDetailsById(int id) async {
    try {
      emit(Loading());
      final user = await userRepository.getUserById(id);
      final content = Content(user);
      emit(content);
    } on Exception catch(e) {
      log(e.toString());
      emit(Error());
    }
  }
}
