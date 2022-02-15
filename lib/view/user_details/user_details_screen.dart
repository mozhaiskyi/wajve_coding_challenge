import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:wajve_coding_challenge/domain/bloc/user_details_cubit.dart';
import 'package:wajve_coding_challenge/domain/model/user.dart';
import 'package:wajve_coding_challenge/domain/repository/user_repository.dart';
import 'package:wajve_coding_challenge/view/user_details/user_details_content_widget.dart';
import 'package:wajve_coding_challenge/view/user_details/user_details_error_widget.dart';
import 'package:wajve_coding_challenge/view/user_details/user_details_loading_widget.dart';

class UserDetailsScreen extends StatelessWidget {
  final int id;
  final User? payload;

  const UserDetailsScreen({Key? key, required this.id, this.payload}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final userRepository = Provider.of<UserRepository>(context, listen: false);
        final cubit = UserDetailsCubit(userRepository: userRepository);

        if (payload != null) {
          cubit.loadDetailsFromPayload(payload!);
        } else {
          cubit.loadDetailsById(id);
        }

        return cubit;
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          centerTitle: false,
          title: const Text(
            'User Details',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          elevation: 1,
        ),
        body: BlocBuilder<UserDetailsCubit, UserDetailsState>(
          builder: (_, state) {
            switch (state.runtimeType) {
              case Loading: return const UserDetailsLoadingWidget();
              case Error: return const UserDetailsErrorWidget();
              case Content: return UserDetailsContentWidget(content: state as Content);
              default: throw Exception('Unsupported state type ${state.runtimeType}');
            }
          },
        ),
      ),
    );
  }
}
