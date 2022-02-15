import 'package:flutter/material.dart';

class UserDetailsLoadingWidget extends StatelessWidget {

  const UserDetailsLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
