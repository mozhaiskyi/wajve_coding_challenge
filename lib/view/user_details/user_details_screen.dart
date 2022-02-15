import 'package:flutter/material.dart';
import 'package:wajve_coding_challenge/domain/model/user.dart';

class UserDetailsScreen extends StatelessWidget {
  final int id;
  final User? payload;

  const UserDetailsScreen({Key? key, required this.id, this.payload}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(id.toString()),
      ),
    );
  }
}
