import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wajve_coding_challenge/provider.dart';
import 'package:wajve_coding_challenge/view/user_browser/user_browser_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: const MaterialApp(
        title: 'Wajve',
        home: UserBrowserScreen(),
      ),
    );
  }
}
