import 'package:flutter/material.dart';

class UserBrowserLoadingWidget extends StatelessWidget {

  const UserBrowserLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
