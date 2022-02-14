import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wajve_coding_challenge/domain/model/user.dart';
import 'package:wajve_coding_challenge/domain/model/user_batch.dart';
import 'package:wajve_coding_challenge/domain/repository/user_repository.dart';

const _firstPage = 1;

abstract class UserFetchingState {}

class Loading extends UserFetchingState {}

class Error extends UserFetchingState {}

class Content extends UserFetchingState {
  final List<UserBatch> batches;
  final int page;
  final bool hasNextPage;

  Content(this.batches, this.page, this.hasNextPage);
}

class UserFetchingCubit extends Cubit<UserFetchingState> {
  final UserRepository userRepository;

  var _isPageLoadingProgress = false;

  UserFetchingCubit({required this.userRepository}) : super(Loading());

  Future<void> loadNextPage() async {
    if (_isPageLoadingProgress) return;

    if (state is Content || state is Loading) {
      try {
        _isPageLoadingProgress = true;

        final int page;
        if (state is Content) {
          page = (state as Content).page + 1;
        } else {
          page = _firstPage;
        }

        final dataPage = await userRepository.getUsers(page);
        final batch = _buildButch(dataPage.data);

        final List<UserBatch> batches;
        if (state is Content) {
          batches = (state as Content).batches..add(batch);
        } else {
          batches = <UserBatch>[batch];
        }
        final hasNextPage = dataPage.page < dataPage.pages;
        final content = Content(batches, dataPage.page, hasNextPage);
        emit(content);
      } on Exception catch (e) {
        log(e.toString());
        emit(Error());
      } finally {
        _isPageLoadingProgress = false;
      }
    }
  }

  UserBatch _buildButch(List<User> users) {
    final active = <User>[];
    final inactive = <User>[];

    for (final user in users) {
      // ignore: missing_enum_constant_in_switch
      switch (user.status) {
        case Status.active:
          active.add(user);
          break;
        case Status.inactive:
          inactive.add(user);
          break;
      }
    }

    return UserBatch(active, inactive);
  }
}
