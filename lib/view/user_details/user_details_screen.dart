import 'package:flutter/material.dart';

class UserDetailsScreen extends StatelessWidget {
  final int id;

  const UserDetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Hello world!'),
      ),
    );
  }
}
