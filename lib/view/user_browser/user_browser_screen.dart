import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:wajve_coding_challenge/domain/bloc/user_fetching_cubit.dart';
import 'package:wajve_coding_challenge/domain/model/user.dart';
import 'package:wajve_coding_challenge/domain/repository/user_repository.dart';
import 'package:wajve_coding_challenge/view/user_browser/user_browser_content_widget.dart';
import 'package:wajve_coding_challenge/view/user_browser/user_browser_error_widget.dart';
import 'package:wajve_coding_challenge/view/user_browser/user_browser_loading_widget.dart';

class UserBrowserScreen extends StatelessWidget {
  final Function(User)? onUserClicked;

  const UserBrowserScreen({Key? key, this.onUserClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserFetchingCubit>(
      create: (context) {
        final userRepository = Provider.of<UserRepository>(context, listen: false);
        return UserFetchingCubit(userRepository: userRepository)..loadNextPage();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          title: const Text(
            'User List',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          elevation: 1,
        ),
        body: BlocBuilder<UserFetchingCubit, UserFetchingState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case Loading: return const UserBrowserLoadingWidget();
              case Error: return const UserBrowserErrorWidget();
              case Content: return UserBrowserContentWidget(
                content: state as Content,
                onScrolledBottom: () {
                  BlocProvider.of<UserFetchingCubit>(context).loadNextPage();
                },
                onUserClicked: onUserClicked,
              );
              default: throw Exception('Unsupported state type ${state.runtimeType}');
            }
          },
        ),
      ),
    );
  }
}
