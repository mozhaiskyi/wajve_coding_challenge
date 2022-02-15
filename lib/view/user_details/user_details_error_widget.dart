import 'package:flutter/material.dart';

class UserDetailsErrorWidget extends StatelessWidget {

  const UserDetailsErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Something went wrong'),
    );
  }
}
